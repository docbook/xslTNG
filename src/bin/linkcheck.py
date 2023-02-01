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

def linkcheck(root, debug):
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
                exclude-result-prefixes="xs"
                version="3.0">

<xsl:output method="json" encoding="utf-8"/>

<xsl:mode on-no-match="shallow-skip"/>

<xsl:template match="/">
  <xsl:variable name="uris" as="xs:string*">
    <xsl:apply-templates/>
  </xsl:variable>

  <xsl:sequence select="array { $uris }"/>
</xsl:template>

<xsl:template match="*[@href]" as="xs:string">
  <xsl:sequence select="resolve-uri(@href, base-uri(.))"/>
</xsl:template>

<xsl:template match="*[@src]" as="xs:string">
  <xsl:sequence select="resolve-uri(@src, base-uri(.))"/>
</xsl:template>

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
            xexec = xslt.compile_stylesheet(stylesheet_text=extract)

            builder = saxon.new_document_builder()
            builder.set_base_uri('file:' + htmlfile)
            node = builder.parse_xml(xml_text=text)

            uris = json.loads(xexec.apply_templates_returning_string(xdm_value=node))

            for uri in uris:
                if uri.startswith('file:'):
                    fn = re.sub('^file:/+', '/', uri)

                    # FIXME: check fragment identifiers...
                    if "#" in fn:
                        fn = fn[0:fn.index("#")]
                    
                    if fn not in seen:
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
@click.argument("root", type=click.Path(exists=True))
def main(debug, root):
    """ The main entry point."""
    linkcheck(os.path.abspath(root), debug)

if __name__ == "__main__":
    main()
