<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:a="http://nwalsh.com/ns/xslt/analysis"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:fg="http://docbook.org/ns/guide/functions"
                xmlns:h="http://www.w3.org/1999/xhtml"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:mg="http://docbook.org/ns/guide/modes"
                xmlns:mp="http://docbook.org/ns/docbook/modes/private"
                xmlns:t="http://docbook.org/ns/docbook/templates"
                xmlns:tg="http://docbook.org/ns/guide/templates"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:import href="guide.xsl"/>
<xsl:import href="../../../build/xslt/docbook-paged.xsl"/>

<xsl:param name="output-media" select="'print'"/>

<xsl:param name="annotate-toc" select="'false'"/>

<!-- ============================================================ -->

<xsl:template name="t:html-head">
</xsl:template>

<xsl:template match="*" mode="m:html-head-last">
  <link rel="stylesheet" href="{$resource-base-uri}css/guide.css"/>
  <link rel="stylesheet" href="{$resource-base-uri}css/guide-paged.css"/>
</xsl:template>

<xsl:template match="*" mode="m:html-head-links"/>

<xsl:template match="db:refnamediv" mode="m:docbook">
  <!-- The guide marks refname elements as display:none which means
       that the IDs they have don't turn up as targets. Force (empty)
       a elements into the output to be link targets. -->
  <xsl:for-each select="db:refname[@xml:id]">
    <a id="{@xml:id}"/>
  </xsl:for-each>
  <xsl:next-match/>
</xsl:template>

<xsl:template match="db:refname" mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@* except @xml:id"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr)"/>
</xsl:template>

<!-- Find the header for the book cover page and move its embedded
     revhistory out of the header. -->
<xsl:template match="h:header[h:div[contains-token(@class, 'cover')]]"
              mode="m:chunk-cleanup">
  <xsl:variable name="header" as="element(h:header)">
    <xsl:next-match/>
  </xsl:variable>
  <xsl:apply-templates select="$header" mode="mp:norevhistory"/>
  <xsl:copy-of select="$header//h:div[contains-token(@class, 'revhistory')]"/>
</xsl:template>

<xsl:template match="*" mode="mp:norevhistory">
  <xsl:copy>
    <xsl:apply-templates select="@*,node()" mode="mp:norevhistory"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="h:div[contains-token(@class, 'revhistory')]"
              mode="mp:norevhistory">
</xsl:template>

<xsl:template match="text()|comment()|processing-instruction()|attribute()"
              mode="mp:norevhistory">
  <xsl:copy/>
</xsl:template>

</xsl:stylesheet>
