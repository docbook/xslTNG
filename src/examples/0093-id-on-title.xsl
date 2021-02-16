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

<xsl:template match="db:title|db:subtitle" mode="m:titlepage">
  <xsl:attribute name="id"><xsl:value-of select="f:generate-id(.)"/></xsl:attribute>
  <xsl:next-match/>
</xsl:template>

</xsl:stylesheet>
