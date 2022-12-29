<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:l="http://docbook.org/ns/docbook/l10n"
                xmlns:lt="http://docbook.org/ns/docbook/l10n/templates"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://docbook.org/ns/docbook"
                exclude-result-prefixes="db f map xs"
                expand-text="yes"
                version="3.0">

<xsl:output method="xml" encoding="utf-8" indent="yes"/>

<xsl:key name="gentext" match="gentext" use="@key"/>

<xsl:variable name="locale" select="/*" as="element(locale)"/>

<xsl:template match="locale">
  <l:l10n language="{@language}"
          english-language-name="{@english-language-name}">
    <xsl:apply-templates select="* except info"/>
  </l:l10n>
</xsl:template>

<xsl:template match="mappings">
  <l:gentext>
    <xsl:apply-templates select="gentext">
      <xsl:sort select="lower-case(@key)" case-order="lower-first"/>
    </xsl:apply-templates>
  </l:gentext>
</xsl:template>

<xsl:template match="gentext">
  <l:token key="{@key}">
    <xsl:sequence select="node()"/>
  </l:token>
</xsl:template>

<xsl:template match="properties">
  <l:properties name="{@name}">
    <xsl:apply-templates select="property"/>
  </l:properties>
</xsl:template>

<xsl:template match="property">
  <l:property name="{@name}" value="{@value}"/>
</xsl:template>

<xsl:template match="group">
  <l:group name="{@name}">
    <xsl:apply-templates select="template"/>
  </l:group>
</xsl:template>

<xsl:template match="ref">
  <l:ref>
    <xsl:copy-of select="@*"/>
  </l:ref>
</xsl:template>

<xsl:template match="list">
  <l:list>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates select="items"/>
  </l:list>
</xsl:template>

<xsl:template match="template|repeat|items">
  <xsl:variable name="expanded" as="node()*">
    <xsl:apply-templates mode="expand-template"/>
  </xsl:variable>

  <xsl:element name="l:{local-name(.)}" 
               namespace="http://docbook.org/ns/docbook/l10n">
    <xsl:if test="@name">
      <xsl:attribute name="key" select="@name"/>
    </xsl:if>
    <xsl:iterate select="$expanded">
      <xsl:param name="result" select="()"/>
      <xsl:param name="last" select="()"/>
      <xsl:on-completion select="$result"/>
      <xsl:choose>
        <xsl:when test="./self::lt:text and $last/self::lt:text">
          <xsl:variable name="text" as="element()">
            <lt:text>
              <xsl:sequence select="string($last) || string(.)"/>
            </lt:text>
          </xsl:variable>
          <xsl:next-iteration>
            <xsl:with-param name="result" select="($result[position() lt last()], $text)"/>
            <xsl:with-param name="last" select="$text"/>
          </xsl:next-iteration>
        </xsl:when>
        <xsl:otherwise>
          <xsl:next-iteration>
            <xsl:with-param name="result" select="($result, .)"/>
            <xsl:with-param name="last" select="."/>
          </xsl:next-iteration>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:iterate>
  </xsl:element>
</xsl:template>

<xsl:template match="letters">
  <l:letters>
    <xsl:apply-templates select="*"/>
  </l:letters>
</xsl:template>

<xsl:template match="l">
  <l:l>
    <xsl:copy-of select="@*"/>
    <xsl:sequence select="string(.)"/>
  </l:l>
</xsl:template>

<xsl:template match="*">
  <xsl:message terminate="yes">No template for {local-name(.)}</xsl:message>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="ref" mode="expand-template">
  <lt:ref>
    <xsl:copy-of select="@*"/>
  </lt:ref>
</xsl:template>

<xsl:template match="items" mode="expand-template">
  <l:items>
    <xsl:apply-templates mode="expand-template"/>
  </l:items>
</xsl:template>

<xsl:template match="repeat" mode="expand-template">
  <l:repeat>
    <xsl:apply-templates mode="expand-template"/>
  </l:repeat>
</xsl:template>

<xsl:template match="*" mode="expand-template">
  <lt:token key="{local-name(.)}"/>
  <xsl:if test="not(key('gentext', local-name(.)))">
    <xsl:message>Warning: no gentext for {local-name(.)}</xsl:message>
  </xsl:if>
</xsl:template>

<xsl:template match="text()" mode="expand-template">
  <xsl:sequence select="f:fix-text(.)"/>
</xsl:template>

<xsl:function name="f:expand-percent" as="element()*">
  <xsl:param name="parts" as="element()*"/>
  <xsl:param name="perc" as="xs:string"/>
  <xsl:param name="tok" as="xs:string"/>

  <xsl:for-each select="$parts">
    <xsl:choose>
      <xsl:when test="./self::lt:text">
        <xsl:for-each select="tokenize(., $perc)">
          <xsl:if test="position() gt 1">
            <xsl:element name="lt:{$tok}"
                         namespace="http://docbook.org/ns/docbook/l10n/templates"/>
          </xsl:if>
          <xsl:if test=". != ''">
            <lt:text>{.}</lt:text>
          </xsl:if>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="."/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:function>

<!-- ============================================================ -->

<xsl:function name="f:fix-text" as="node()*">
  <xsl:param name="text" as="xs:string"/>

  <xsl:variable name="bpos"
                select="if (contains($text, '{'))
                        then string-length(substring-before($text, '{'))
                        else -1"/>
  <xsl:variable name="ppos"
                select="if (contains($text, '%'))
                        then string-length(substring-before($text, '%'))
                        else -1"/>
  <xsl:choose>
    <xsl:when test="$text = ''"/>
    <xsl:when test="$bpos lt 0 and $ppos lt 0">
      <lt:text>
        <xsl:value-of select="$text"/>
      </lt:text>
    </xsl:when>
    <xsl:when test="$bpos lt 0 or ($bpos ge 0 and $ppos ge 0 and $ppos lt $bpos)">
      <xsl:if test="$ppos gt 0">
        <lt:text>
          <xsl:value-of select="substring-before($text, '%')"/>
        </lt:text>
      </xsl:if>

      <xsl:variable name="perc" select="substring($text, $ppos+2, 1)"/>
      <xsl:variable name="rest" select="substring($text, $ppos+3)"/>

      <!--
      <xsl:message select="'p:', '[' || $perc || ']', $rest, '::', $text"/>
      -->

      <xsl:choose>
        <xsl:when test="$perc = 'c'"><lt:content/></xsl:when>
        <xsl:when test="$perc = 'l'"><lt:label/></xsl:when>
        <xsl:when test="$perc = '%'"><lt:percent/></xsl:when>
        <xsl:when test="$perc = '.'"><lt:separator/></xsl:when>
        <xsl:when test="$perc = 'p'"><lt:page/></xsl:when>
        <xsl:when test="$perc = 'o'"><lt:olink-title/></xsl:when>
        <xsl:otherwise>
          <xsl:message terminate="yes"
                       select="'Unexpected percent code: %'||$perc"/>
        </xsl:otherwise>
      </xsl:choose>

      <xsl:sequence select="f:fix-text($rest)"/>
    </xsl:when>
    <xsl:when test="$ppos lt 0 or ($bpos ge 0 and $ppos ge 0 and $bpos lt $ppos)">
      <xsl:if test="$bpos gt 0">
        <lt:text>
          <xsl:value-of select="substring-before($text, '{')"/>
        </lt:text>
      </xsl:if>
      <xsl:variable name="text"
                    select="substring($text, $bpos+2)"/>

      <xsl:variable name="epos" select="string-length(substring-before($text, '}'))"/>
      <xsl:variable name="token" select="substring($text, 1, $epos)"/>
      <xsl:variable name="rest" select="substring($text, $epos+2)"/>

      <!--
      <xsl:message select="'b:', $bpos, $epos, '|' || $token || '|', $rest, '::', $text"/>
      -->

      <lt:token key="{$token}"/>
      
      <xsl:if test="empty($locale/mappings/gentext[@key = $token])">
        <xsl:message select="'Warning: no gentext for &quot;' || $token || '&quot;'"/>
      </xsl:if>

      <xsl:sequence select="f:fix-text($rest)"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message terminate="yes">This can’t happen.</xsl:message>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

</xsl:stylesheet>
