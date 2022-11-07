<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:a="http://nwalsh.com/ns/xslt/analysis"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:t="http://docbook.org/ns/docbook/templates"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="a db f m t v"
                version="3.0">

<xsl:import href="../../../build/xslt/docbook.xsl"/>

<xsl:variable name="epub" select="false()"/>
<xsl:include href="core.xsl"/>

</xsl:stylesheet>
