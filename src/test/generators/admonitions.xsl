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
                 stylesheet="../xspec-xslt/xspec-driver.xsl">
    <xsl:text>&#10;</xsl:text>
    <xsl:comment> Tests:
     note tip important caution warning danger
</xsl:comment>
    <xsl:text>&#10;&#10;</xsl:text>

    <xsl:apply-templates select="*"/>
  </x:description>
</xsl:template>

<xsl:template match="/*">
  <xsl:for-each select="('en', 'fr')">
    <xsl:variable name="lang" select="."/>
    <xsl:for-each select="('note', 'tip', 'important',
                           'caution', 'warning', 'danger')">
      <xsl:variable name="admon" select="."/>
      <xsl:for-each select="('001', '002', (if ($admon = 'note') then '003' else ()))">
        <x:scenario label="When transforming {$lang}_{$admon}.{.}">
          <x:context href="../../src/test/resources/xml/{$lang}_{$admon}.{.}.xml"/>
          <x:expect label="expect it to be rendered {
                           if ($lang eq 'fr') then 'in French' else 'in English'
                           }"
             href="../../src/test/resources/expected/{$lang}_{$admon}.{.}.html"/>
        </x:scenario>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:for-each>
</xsl:template>

<xsl:template match='attribute()|text()|comment()|processing-instruction()'>
  <xsl:copy/>
</xsl:template>

</xsl:stylesheet>
