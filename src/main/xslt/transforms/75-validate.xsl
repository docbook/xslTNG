<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:ext="http://docbook.org/extensions/xslt"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:include href="../environment.xsl"/>

<xsl:template match="/" as="document-node()"
              use-when="function-available('ext:validate-with-relax-ng')">
  <xsl:choose>
    <xsl:when test="normalize-space($relax-ng-grammar) != ''">
      <xsl:sequence
          select="ext:validate-with-relax-ng($source, $relax-ng-grammar)?document"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="$source"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="/" as="document-node()"
              use-when="not(function-available('ext:validate-with-relax-ng'))">
  <xsl:if test="normalize-space($relax-ng-grammar) != ''">
    <xsl:message select="'Ignoring validation, extension unavailable'"/>
  </xsl:if>
  <xsl:sequence select="."/>
</xsl:template>

</xsl:stylesheet>
