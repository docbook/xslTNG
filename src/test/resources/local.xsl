<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://docbook.org/ns/docbook"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="db xs"
                version="3.0">

<xsl:template match="db:att">
  <tag class="attribute">
    <xsl:copy-of select="@* except @class"/>
    <xsl:apply-templates/>
  </tag>
</xsl:template>

<xsl:template match="db:mode">
  <code role="{string-join(
                distinct-values((@role/string(), 'mode')),
                ' ')}">
    <xsl:copy-of select="@* except @role"/>
    <xsl:apply-templates/>
  </code>
</xsl:template>

<xsl:template match="element()">
  <xsl:copy>
    <xsl:apply-templates select="@*,node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="attribute()|text()|comment()
                     |processing-instruction()">
  <xsl:copy/>
</xsl:template>

</xsl:stylesheet>
