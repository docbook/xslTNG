<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"
                version="3.0">

<xsl:output method="text" encoding="utf-8" indent="no"/>

<xsl:template match="/">
  <xsl:variable name="elements" as="xs:string*">
    <xsl:apply-templates/>
  </xsl:variable>
  <xsl:for-each select="distinct-values($elements)">
    <xsl:sort select="."/>
    <xsl:sequence select="."/>
    <xsl:text>&#10;</xsl:text>
  </xsl:for-each>
</xsl:template>

<xsl:template match="x:context" as="xs:string*">
  <xsl:for-each select=".//*">
    <xsl:sequence select="string(node-name(.))"/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="x:context[@href]" priority="10" as="xs:string*">
  <xsl:variable name="context" select="doc(resolve-uri(@href, base-uri(.)))"/>
  <xsl:for-each select="$context//*">
    <xsl:sequence select="string(node-name(.))"/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="element()">
  <xsl:apply-templates select="node()"/>
</xsl:template>

<xsl:template match="attribute()|text()|comment()|processing-instruction()"/>

</xsl:stylesheet>
