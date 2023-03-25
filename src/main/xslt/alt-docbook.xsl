<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="#all"
                version="3.0">

<!-- This driver is an alternate customization layer that enables
     testing some features of the stylesheets that would be difficult
     to test with the default stylesheet (for example, numbering of
     sets and books). -->

<xsl:import href="../xslt/docbook.xsl"/>
<xsl:include href="alt-customizations.xsl"/>

</xsl:stylesheet>
