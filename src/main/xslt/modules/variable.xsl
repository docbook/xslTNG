<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:ext="http://docbook.org/extensions/xslt"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:vp="http://docbook.org/ns/docbook/variables/private"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                default-mode="m:docbook"
                exclude-result-prefixes="db ext f fp m v vp xs"
                version="3.0">

<!-- Note: These are variables used by the stylesheet. Many are
     initialized by parsing parameters defined in param.xsl. They're
     in a separate stylesheet to make the pipelines cleaner. -->

<!-- Some them are initialized using content instead of a select
     attribute in order to make the reference page in the Guide work
     better. -->

<xsl:variable name="v:debug" static="yes" as="xs:string*"
              select="tokenize($debug, ',') ! normalize-space(.)"/>

<xsl:variable name="v:verbatim-line-style"
              select="tokenize($verbatim-line-style, '\s+')"/>

<xsl:variable name="v:verbatim-plain-style" as="xs:string*"
              select="tokenize($verbatim-plain-style, '\s+')"/>

<xsl:variable name="v:verbatim-space" as="node()">
  <xsl:value-of select="substring($verbatim-space || ' ', 1, 1)"/>
</xsl:variable>

<xsl:variable name="v:verbatim-numbered-elements" as="xs:string*"
              select="tokenize($verbatim-numbered-elements, '\s+')"/>

<xsl:variable name="v:verbatim-number-minlines"
              select="xs:integer($verbatim-number-minlines)"/>

<xsl:variable name="v:verbatim-number-every-nth"
              select="xs:integer($verbatim-number-every-nth)"/>

<xsl:variable name="v:verbatim-number-first-line"
              select="f:is-true($verbatim-number-first-line)"/>

<xsl:variable name="v:verbatim-callouts" as="xs:string*"
              select="tokenize($verbatim-callouts, '\s+')"/>

<xsl:variable name="v:verbatim-syntax-highlight-languages"
              select="tokenize($verbatim-syntax-highlight-languages, '\s+')"/>
<xsl:variable name="v:verbatim-syntax-highlight-options"
           select="map { }"/>
<xsl:variable name="v:verbatim-syntax-highlight-pygments-options"
           select="map { }"/>

<xsl:variable name="v:mediaobject-input-base-uri" as="xs:string?">
  <xsl:message use-when="'mediaobject-uris' = $v:debug"
               select="'Mediaobject input base URI:',
                       if ($mediaobject-input-base-uri = '')
                       then ()
                       else resolve-uri($mediaobject-input-base-uri, static-base-uri())"/>
  <xsl:sequence select="if ($mediaobject-input-base-uri = '')
                        then ()
                        else resolve-uri($mediaobject-input-base-uri, static-base-uri())"/>
</xsl:variable>

<xsl:variable name="v:mediaobject-output-base-uri" as="xs:string?">
  <xsl:message use-when="'mediaobject-uris' = $v:debug"
               select="'Mediaobject output base URI:',
                       if ($mediaobject-output-base-uri = '')
                       then ()
                       else if (ends-with($mediaobject-output-base-uri, '/'))
                            then $mediaobject-output-base-uri
                            else $mediaobject-output-base-uri || '/'"/>
  <xsl:sequence select="if ($mediaobject-output-base-uri = '')
                        then ()
                        else if (ends-with($mediaobject-output-base-uri, '/'))
                             then $mediaobject-output-base-uri
                             else $mediaobject-output-base-uri || '/'"/>
</xsl:variable>

<xsl:variable name="v:personal-name-styles"
              select="('first-last', 'last-first', 'FAMILY-given')"/>

<xsl:variable name="v:formal-object-title-placement" as="map(xs:string,xs:string)"
              select="fp:parse-key-value-pairs(
                        tokenize($formal-object-title-placement, '\s+'))"/>

<xsl:variable name="v:arg-choice-opt-open-str"><span class="cmdpunct">[</span></xsl:variable>
<xsl:variable name="v:arg-choice-opt-close-str"><span class="cmdpunct">]</span></xsl:variable>
<xsl:variable name="v:arg-choice-req-open-str"><span class="cmdpunct">{</span></xsl:variable>
<xsl:variable name="v:arg-choice-req-close-str"><span class="cmdpunct">}</span></xsl:variable>
<xsl:variable name="v:arg-choice-plain-open-str"><xsl:text></xsl:text></xsl:variable>
<xsl:variable name="v:arg-choice-plain-close-str"><xsl:text></xsl:text></xsl:variable>
<xsl:variable name="v:arg-choice-def-open-str"><span class="cmdpunct">[</span></xsl:variable>
<xsl:variable name="v:arg-choice-def-close-str"><span class="cmdpunct">]</span></xsl:variable>
<xsl:variable name="v:arg-rep-repeat-str"><span class="cmdpunct">…</span></xsl:variable>
<xsl:variable name="v:arg-rep-norepeat-str"><xsl:text></xsl:text></xsl:variable>
<xsl:variable name="v:arg-rep-def-str"><xsl:text></xsl:text></xsl:variable>
<xsl:variable name="v:arg-or-sep"><span class="cmdpunct"> | </span></xsl:variable>

<xsl:variable name="v:css-links"
              select="tokenize($css-links, '\s+') ! normalize-space(.)"/>

<xsl:variable name="v:chunk-renumber-footnotes" as="xs:boolean"
              select="f:is-true($chunk-renumber-footnotes)"/>

<xsl:variable name="v:chunk-filter-namespaces" as="namespace-node()*">
  <xsl:namespace name="db" select="'http://docbook.org/ns/docbook'"/>
</xsl:variable>

<xsl:variable name="v:admonition-icons">
  <db:tip>☞&#xFE0E;</db:tip>
  <db:note>🛈&#xFE0E;</db:note>
  <db:important>☝&#xFE0E;</db:important>
  <db:caution>⚠&#xFE0E;</db:caution>
  <db:warning>⯃&#xFE0E;</db:warning>
  <db:danger>⚡&#xFE0E;</db:danger>
</xsl:variable>

<xsl:variable name="v:annotation-close" as="element()">
  <span>╳</span>
</xsl:variable>

<xsl:variable name="v:nominal-page-width"
              select="f:parse-length($nominal-page-width)"/>
<xsl:variable name="v:image-nominal-width"
              select="f:parse-length($image-nominal-width)"/>
<xsl:variable name="v:image-nominal-height"
              select="f:parse-length($image-nominal-height)"/>

<xsl:variable name="v:toc-open" as="element()">
  <span>[toc]</span>
</xsl:variable>

<xsl:variable name="v:toc-close" as="element()">
  <span>╳</span>
</xsl:variable>

</xsl:stylesheet>
