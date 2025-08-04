<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:t="http://docbook.org/ns/docbook/l10n/title"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:vp="http://docbook.org/ns/docbook/variables/private"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                default-mode="m:docbook"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:template match="db:title" mode="m:titlepage">
  <xsl:apply-templates select="../.." mode="m:headline">
    <xsl:with-param name="purpose" select="'title'"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="db:formalpara/db:info/db:title" mode="m:titlepage" priority="10">
  <span>
    <xsl:choose>
      <xsl:when test="matches(normalize-space(string(.)), '^.*\p{P}$')">
        <xsl:attribute name="class" select="'title titlepunct'"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="class" select="'title'"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="m:titlepage"/>
  </span>
</xsl:template>

<xsl:template match="db:subtitle" mode="m:titlepage">
  <xsl:variable name="attributes" as="attribute()*">
    <xsl:apply-templates select="." mode="m:attributes"/>
  </xsl:variable>

  <xsl:if test="not(empty($attributes))">
    <xsl:try>
      <!-- Adding attributes will fail if we're not at the start of
           an element. But the odds are very good that we are. -->
      <xsl:sequence select="$attributes"/>
      <xsl:catch>
        <xsl:message>Failed to apply HTML attributes for subtitle.</xsl:message>
      </xsl:catch>
    </xsl:try>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="db:copyright|db:abstract|db:legalnotice
                     |db:authorgroup|db:revhistory
                     |db:pubdate"
              mode="m:titlepage">
  <xsl:apply-templates select="."/>
</xsl:template>

<xsl:template match="db:releaseinfo" mode="m:titlepage">
  <span>
    <xsl:apply-templates select="." mode="m:attributes"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="db:author" mode="m:titlepage">
  <xsl:apply-templates select="db:personname|db:orgname"/>
</xsl:template>

<xsl:template match="db:editor" mode="m:titlepage">
  <span class="editedby">
    <xsl:apply-templates select="." mode="m:gentext">
      <xsl:with-param name="group" select="'label'"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="." mode="m:gentext">
      <xsl:with-param name="group" select="'label-separator'"/>
    </xsl:apply-templates>
  </span>
  <xsl:apply-templates select="db:personname|db:orgname"/>
</xsl:template>

<xsl:template match="db:jobtitle|db:orgname|db:orgdiv" mode="m:titlepage">
  <xsl:apply-templates select="."/>
</xsl:template>

<xsl:template match="*" mode="m:titlepage">
  <xsl:if test="'templates' = $v:debug">
    <xsl:message select="'No titlepage template for: ' || node-name(.)"/>
  </xsl:if>
  <xsl:apply-templates select="."/>
</xsl:template>

</xsl:stylesheet>
