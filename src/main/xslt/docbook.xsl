<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:ext="http://docbook.org/extensions/xslt"
                xmlns:h="http://www.w3.org/1999/xhtml"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:mp="http://docbook.org/ns/docbook/modes/private"
                xmlns:t="http://docbook.org/ns/docbook/templates"
                xmlns:tp="http://docbook.org/ns/docbook/templates/private"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:vp="http://docbook.org/ns/docbook/variables/private"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="db ext h m map mp t tp v vp xs"
                version="3.0">

<!-- This will all be in XProc 3.0 eventually, hack for now... -->
<xsl:import href="main.xsl"/>
<xsl:import href="drivers.xsl"/>

<xsl:output method="xhtml" encoding="utf-8" indent="no" html-version="5"
            omit-xml-declaration="yes"/>

<xsl:template match="*" as="element()">
  <xsl:variable name="document" as="document-node()">
    <xsl:document>
      <xsl:sequence select="."/>
    </xsl:document>
  </xsl:variable>
  <xsl:call-template name="tp:docbook">
    <xsl:with-param name="source" select="$document"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="/" name="tp:docbook">
  <xsl:param name="source" as="document-node()" select="."/>

  <xsl:variable name="source" as="document-node()">
    <xsl:call-template name="t:preprocess">
      <xsl:with-param name="source" select="$source"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="result" as="document-node()">
    <xsl:call-template name="t:process">
      <xsl:with-param name="source" select="$source"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="result" as="document-node()">
    <xsl:call-template name="t:chunk-cleanup">
      <xsl:with-param name="docbook" select="$source"/>
      <xsl:with-param name="source" select="$result"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="result" as="map(xs:string, item()*)">
    <xsl:call-template name="t:chunk-output">
      <xsl:with-param name="docbook" select="$source"/>
      <xsl:with-param name="source" select="$result"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:for-each select="map:keys($result)">
    <xsl:if test=". != 'output'">
      <xsl:result-document href="{.}">
        <xsl:sequence select="map:get($result, .)"/>
      </xsl:result-document>
    </xsl:if>
  </xsl:for-each>

  <xsl:sequence select="$result?output"/>
</xsl:template>

</xsl:stylesheet>
