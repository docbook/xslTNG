<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                exclude-result-prefixes="map xs"
                version="2.0">

<xsl:output method="xml" encoding="utf-8" indent="yes"/>

<xsl:template match="/">
  <x:description xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 stylesheet="../xslt/docbook.xsl">
    <xsl:apply-templates select="*"/>
  </x:description>
</xsl:template>

<xsl:template match="/*">
  <xsl:variable name="hlmap" select="map {
    'linecolumn':                        'lc',
    'lines':                             'l',
    'lineranges-all':                    'lra',
    'lineranges-first':                  'lrf',
    'linecolumn,lines':                  'lc-l',
    'linecolumn,lineranges-all':         'lc-lra',
    'linecolumn,lineranges-first':       'lc-lrf',
    'linecolumn,lines,lineranges-all':   'lc-l-lra',
    'linecolumn,lines,lineranges-first': 'lc-l-lrf',
    'lines,lineranges-all':              'l-lra',
    'lines,lineranges-first':            'l-lrf'
    }"/>

  <xsl:for-each
      select="('programlistingco.001', 'screenco.001')">
    <xsl:variable name="source" select="."/>
    
    <xsl:for-each select="('raw', 'plain', 'lines')">
      <xsl:variable name="style" select="."/>

      <xsl:for-each select="('true', 'false')">
        <xsl:variable name="numbered" select="."/>

        <xsl:for-each select="('linecolumn', 'lines', 'lineranges-all',
                               'lineranges-first',
                               'linecolumn,lines',
                               'linecolumn,lineranges-all',
                               'linecolumn,lineranges-first',
                               'linecolumn,lines,lineranges-all',
                               'linecolumn,lines,lineranges-first',
                               'lines,lineranges-all',
                               'lines,lineranges-first')">
          <xsl:variable name="highlight" select="."/>
          
          <xsl:variable name="S" select="substring($style, 1, 1)"/>
          <xsl:variable name="N" select="substring($numbered, 1, 1)"/>
          <xsl:variable name="H" select="map:get($hlmap, $highlight)"/>

          <xsl:variable name="highlight" select="tokenize($highlight, ',')"/>
          <xsl:variable name="highlight"
                        select="string-join($highlight, ''',''')"/>

          <x:scenario label="When transforming build/generated-xml/{$source}_{$S}_{$N}_{$H}">
            <x:context href="../generated-xml/{$source}_{$S}_{$N}_{$H}.xml"/>
            <x:expect href="../../src/test/resources/expected/{$source}_{$S}_{$N}_{$H}.html"/>
          </x:scenario>
        </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:for-each>
</xsl:template>

<xsl:template match='attribute()|text()|comment()|processing-instruction()'>
  <xsl:copy/>
</xsl:template>

</xsl:stylesheet>
