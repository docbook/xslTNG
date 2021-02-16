<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="db f m xs"
                version="3.0">

<xsl:import href="../../build/xslt/docbook.xsl"/>

<xsl:template match="*[db:info/db:subtitle]" mode="m:toc-entry">
  <li>
    <a href="#{f:id(.)}">
      <xsl:apply-templates select="." mode="m:headline">
        <xsl:with-param name="purpose" select="'lot'"/>
      </xsl:apply-templates>
    </a>
    <xsl:text>—</xsl:text>
    <xsl:apply-templates select="db:info/db:subtitle/node()"/>

    <xsl:apply-templates select="." mode="m:toc">
      <xsl:with-param name="nested" select="true()"/>
    </xsl:apply-templates>
  </li>
</xsl:template>

</xsl:stylesheet>
