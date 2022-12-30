<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:t="http://docbook.org/ns/docbook/templates"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="db f m t xs"
                version="3.0">

  <!-- This href has to point to your local copy
       of the stylesheets. -->
  <xsl:import href="docbook/xslt/docbook.xsl"/>

  <xsl:output method="text"/>

  <!-- Suppress xslTNG's default HTML output; note that this template
       must return a document node.  -->
  <xsl:template match="/" mode="m:docbook">
    <xsl:document>
      <xsl:apply-templates select="." mode="TOC"/>
    </xsl:document>
  </xsl:template>

  <!-- The templates below generate a simple JSON ToC. -->

  <xsl:template match="/" mode="TOC">
    {"toc": [
    <xsl:apply-templates mode="TOC"/>
    ]}
  </xsl:template>

  <xsl:template match="db:part|db:article|db:section|db:chapter" mode="TOC"
                expand-text="yes">
    <xsl:if test="preceding-sibling::db:part
                  | preceding-sibling::db:article
                  | preceding-sibling::db:section
                  | preceding-sibling::db:chapter">,&#10;</xsl:if>
    {{
    "ref": "{f:generate-id(.)}",
    "title": "{normalize-space(db:info/db:title)}",
    "subtitle": "{normalize-space(db:info/db:subtitle)}",
    "items": [
    <xsl:apply-templates select="db:part|db:article|db:section|db:chapter" mode="TOC"/>
    ]
    }}
  </xsl:template>

  <xsl:template match="*" mode="TOC">
    <xsl:apply-templates select="*" mode="TOC"/>
  </xsl:template>
</xsl:stylesheet>
