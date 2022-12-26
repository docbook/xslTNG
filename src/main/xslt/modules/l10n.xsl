<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                xmlns:h="http://www.w3.org/1999/xhtml"
                xmlns:l="http://docbook.org/ns/docbook/l10n"
                xmlns:lt="http://docbook.org/ns/docbook/l10n/templates"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:mp="http://docbook.org/ns/docbook/modes/private"
                xmlns:tp="http://docbook.org/ns/docbook/templates/private"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:vp="http://docbook.org/ns/docbook/variables/private"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                default-mode="m:docbook"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:template match="l:template" mode="mp:localization">
  <xsl:param name="context" as="element()"/>
  <xsl:param name="label" as="item()*"/>
  <xsl:param name="content" as="item()*"/>

  <xsl:apply-templates select="*" mode="mp:localization">
    <xsl:with-param name="context" select="$context" tunnel="yes"/>
    <xsl:with-param name="label" select="$label" tunnel="yes"/>
    <xsl:with-param name="content" select="$content" tunnel="yes"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="lt:text" mode="mp:localization">
  <xsl:sequence select="node()"/>
</xsl:template>

<xsl:template match="lt:separator" mode="mp:localization">
  <xsl:param name="context" as="element()" tunnel="yes"/>

  <span class="sep">
    <xsl:choose>
      <xsl:when test="$context/self::db:table
                      |$context/self::db:figure
                      |$context/self::db:example
                      |$context/self::db:equation
                      |$context/self::db:procedure
                      |$context/self::db:formalgroup
                      |$context/self::db:chapter
                      |$context/self::db:appendix
                      |$context/self::db:part
                      |$context/self::db:reference
                     ">
        <xsl:text>. </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </span>
</xsl:template>

<xsl:template match="lt:percent" mode="mp:localization">
  <xsl:text>%</xsl:text>
</xsl:template>

<xsl:template match="lt:label" mode="mp:localization">
  <xsl:param name="label" as="item()*" tunnel="yes"/>
  <span class="label">
    <xsl:sequence select="$label"/>
  </span>
</xsl:template>

<xsl:template match="lt:content" mode="mp:localization">
  <xsl:param name="content" as="item()*" tunnel="yes"/>

  <xsl:sequence select="$content"/>
</xsl:template>

<xsl:template match="lt:ref" mode="mp:localization">
  <xsl:param name="context" as="element()" tunnel="yes"/>
  <xsl:variable name="ref" as="element()?">
    <xsl:evaluate xpath="@select" context-item="$context"/>
  </xsl:variable>

  <xsl:apply-templates select="$ref"
                       mode="m:crossref">
    <xsl:with-param name="context" select="@context"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="h:*" mode="mp:localization">
  <xsl:element name="{local-name(.)}" namespace="http://www.w3.org/1999/xhtml">
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates mode="mp:localization"/>
  </xsl:element>
</xsl:template>

<xsl:template match="lt:*" mode="mp:localization">
  <xsl:message terminate="yes"
               select="'Unexpected localization element: ' || node-name(.)"/>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="*" mode="m:gentext-list">
  <xsl:param name="list" as="element()+"/>
  <xsl:param name="name" select="local-name(.)"/>

  <xsl:variable name="template"
                select="fp:localization-list(., $name)"/>

  <xsl:variable name="items" as="element(l:items)?">
    <xsl:iterate select="$template/l:items">
      <xsl:choose>
        <xsl:when test="count(.//lt:content) = count($list)">
          <xsl:break select="."/>
        </xsl:when>
        <xsl:when test="count(.//lt:content) le count($list) and .//l:repeat">
          <xsl:break select="."/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:next-iteration/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:iterate>
  </xsl:variable>

  <xsl:if test="empty($items)">
    <xsl:message expand-text="yes">
      <xsl:text>Failed to select items for {count($list)} element list </xsl:text>
      <xsl:text>in {local-name(.)}.</xsl:text>
    </xsl:message>
  </xsl:if>

  <xsl:choose>
    <xsl:when test="empty($items/l:repeat)">
      <xsl:call-template name="tp:process-list">
        <xsl:with-param name="list" select="$list"/>
        <xsl:with-param name="template" select="$items/*"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <!-- Assume the items contains (lt:content|lt:text)*, lt:repeat, (lt:content|lt:text)*
           where lt:repeat contains (lt:content|lt:text)* -->
      <xsl:variable name="before" select="$items/l:repeat/preceding-sibling::*"/>
      <xsl:variable name="after" select="$items/l:repeat/following-sibling::*"/>

      <xsl:variable name="bc" select="count($before/ancestor-or-self::lt:content)"/>
      <xsl:variable name="ac" select="count($after/ancestor-or-self::lt:content)"/>

      <xsl:variable name="rt" select="count($items/l:repeat//lt:content)"/>

      <xsl:variable name="ric" select="count($list) - ($ac + $bc)"/>
      <xsl:variable name="rc"
                    select="($ric + $rt - 1) idiv $rt"/>

      <xsl:variable name="expanded-list" as="element()+">
        <xsl:sequence select="$before"/>
        <xsl:for-each select="1 to $rc">
          <xsl:sequence select="$items/l:repeat/*"/>
        </xsl:for-each>
        <xsl:sequence select="$after"/>
      </xsl:variable>

      <xsl:call-template name="tp:process-list">
        <xsl:with-param name="list" select="$list"/>
        <xsl:with-param name="template" select="$expanded-list"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="tp:process-list">
  <xsl:param name="list" as="element()*"/>
  <xsl:param name="template" as="element()*"/>

  <xsl:choose>
    <xsl:when test="empty($template)"/>
    <xsl:when test="$template[1]/self::lt:text">
      <xsl:sequence select="$template[1]/node()"/>
      <xsl:call-template name="tp:process-list">
        <xsl:with-param name="list" select="$list"/>
        <xsl:with-param name="template" select="$template[position() gt 1]"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$template[1]/self::lt:content">
      <xsl:sequence select="$list[1]"/>
      <xsl:call-template name="tp:process-list">
        <xsl:with-param name="list" select="$list[position() gt 1]"/>
        <xsl:with-param name="template" select="$template[position() gt 1]"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message select="'Unexpected element in list template:', node-name(.)"/>
      <xsl:call-template name="tp:process-list">
        <xsl:with-param name="list" select="$list"/>
        <xsl:with-param name="template" select="$template[position() gt 1]"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
