<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:import href="../../../../build/xslt/docbook.xsl"/>

<xsl:variable name="v:user-xref-groups" as="element()*">
  <crossref xpath="self::db:chapter|self::db:appendix"
            context="xref-number"/>
</xsl:variable>

<xsl:param name="user-css-links" select="'l10n.example.css'"/>

</xsl:stylesheet>
