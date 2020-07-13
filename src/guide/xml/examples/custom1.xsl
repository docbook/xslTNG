<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:db="http://docbook.org/ns/docbook"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="db xs"
    version="3.0">

<xsl:import href="docbook/xslt/docbook.xsl"/>

<xsl:param name="orderedlist-item-numeration"
           select="'1'"/>

<xsl:param name="date-dateTime-format"
           select="'[D01] [MNn,*-3] [Y0001]
                   at [H01]:[m01]'"/>

</xsl:stylesheet>
