#!/usr/bin/env python3

"""This is yet another link checker. Was it better to write my own
than find an existing cross-platform version? Maybe not, but it
appeared to be easier."""

import re
import os
import sys
import json
import glob
import html5_parser
import lxml.etree
import click
from saxonche import PySaxonProcessor

def linkcheck(root, server_root, debug):
    if debug:
        print("Checking links in", root)

    globpatn = root + '/**/*'
    if root.endswith('/'): # can this happen?
        globpatn = root + '**/*'

    files = []
    for file in glob.glob(globpatn, recursive=True):
        if file.endswith('.html') or file.endswith('.xhtml') \
          or file.endswith('.htm') or file.endswith('.xhtm'):
            files.append(file)

    extract = """
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:h="http://www.w3.org/1999/xhtml"
                xmlns:f="http://nwalsh.com/ns/functions"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:output method="json" encoding="utf-8"/>

<xsl:param name="server-root" as="xs:string?" select="()"/>

<xsl:variable name="server-base-uri" as="xs:string?"
              select="if (empty($server-root))
                      then ()
                      else resolve-uri($server-root, base-uri(.)) || '/'"/>

<xsl:mode on-no-match="shallow-skip"/>

<xsl:template match="/">
  <xsl:variable name="uris" as="xs:string*">
    <xsl:apply-templates/>
  </xsl:variable>

  <xsl:sequence select="array { $uris }"/>
</xsl:template>

<xsl:template match="*[@href]" as="xs:string">
  <xsl:sequence select="f:resolve(@href, .)"/>
  <xsl:if test="(self::h:a or self::a) and empty(node())">
    <xsl:message select="'Unclickable:', string(@href), 'in', base-uri(.)"/>
  </xsl:if>
</xsl:template>

<xsl:template match="*[@src]" as="xs:string">
  <xsl:sequence select="f:resolve(@src, .) "/>
</xsl:template>

<xsl:function name="f:resolve" as="xs:string">
  <xsl:param name="href" as="xs:string"/>
  <xsl:param name="context" as="element()"/>

  <!-- work around for bug in SaxonC HE 12.1 -->
  <xsl:variable name="baseuri"
                select="if (contains(base-uri($context), '/file:'))
                        then 'file:' || substring-after(base-uri($context), '/file:')
                        else base-uri($context)"/>

  <xsl:variable name="res" as="xs:string">
    <xsl:choose>
      <xsl:when test="exists($server-base-uri) and starts-with($href, '/')">
        <xsl:sequence select="$server-base-uri || substring($href, 2)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="resolve-uri($href, $baseuri)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!--<xsl:message select="$href, '→', $res"/>-->
  <xsl:sequence select="$res"/>
</xsl:function>

</xsl:stylesheet>
"""

    seen = []
    fail = {}

    for htmlfile in files:
        with open(htmlfile, "r", encoding="utf-8") as html:
            doc = html5_parser.parse(html.read())
            # All my files are UTF-8!
            text = lxml.etree.tostring(doc).decode("utf-8")

        with PySaxonProcessor(license=False) as saxon:
            xslt = saxon.new_xslt30_processor()
            if server_root:
                xslt.set_parameter("{}server-root", saxon.make_string_value(root))
            xexec = xslt.compile_stylesheet(stylesheet_text=extract)

            builder = saxon.new_document_builder()
            builder.set_base_uri('file:' + htmlfile)
            node = builder.parse_xml(xml_text=text)

            xexec.set_global_context_item(xdm_item=node)
            result = xexec.apply_templates_returning_string(xdm_value=node)
            uris = json.loads(result)

            for uri in uris:
                if uri.startswith('file:'):
                    fn = re.sub('^file:/+', '/', uri)

                    # FIXME: check fragment identifiers...
                    if "#" in fn:
                        fn = fn[0:fn.index("#")]

                    # FIXME?: check queries
                    if "?" in fn:
                        fn = fn[0:fn.index("?")]

                    if fn not in seen:
                        if debug:
                            print(f"\tCheck {uri}")
                        seen.append(fn)
                        if not os.path.exists(fn):
                            if not htmlfile in fail:
                                fail[htmlfile] = []
                            fail[htmlfile].append(fn)

    if fail:
        print("Link check failed:", root)
        for html in fail:
            print("\t", html)
            for fn in fail[html]:
                print("\t\t", fn)
        sys.exit(1)

@click.command()
@click.option("--debug", help="Debug", is_flag=True)
@click.option("--server-root", "-s", help="Server root", is_flag=True)
@click.argument("root", type=click.Path(exists=True))
def main(debug, server_root, root):
    """ The main entry point."""
    linkcheck(os.path.abspath(root), server_root, debug)

if __name__ == "__main__":
    main()
