<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:ghost="http://docbook.org/ns/docbook/ephemeral"
                xmlns:mp="http://docbook.org/ns/docbook/modes/private"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="db f ghost mp xs"
                version="3.0">

<xsl:import href="../modules/shared.xsl"/>

<xsl:param name="annotation-placement" select="'after'"/>

<xsl:key name="annotations" match="db:annotation" use="@xml:id"/>

<xsl:template match="/">
  <xsl:if test="$annotation-placement != 'before'
                and $annotation-placement != 'after'">
    <xsl:message terminate="yes"
                 >The $annotation-placement parameter must be ‘before’ or ‘after’</xsl:message>
  </xsl:if>

  <xsl:choose>
    <xsl:when test="empty(//db:annotation)">
      <xsl:sequence select="."/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="doc">
        <xsl:apply-templates select="node()" mode="mp:move-to-end"/>
      </xsl:variable>
      <xsl:document>
        <xsl:apply-templates select="$doc/node()"/>
      </xsl:document>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Output a ghost:annotation everywhere an annotation is used -->
<xsl:template match="*[@xml:id] | *[@annotations]">
  <xsl:variable name="points-to-me"
                select="//db:annotation[tokenize(@annotates, '\s+')
                                        = current()/@xml:id]"/>
  <xsl:variable name="i-point-to"
                select="key('annotations', tokenize(@annotations, '\s+'))"/>

  <xsl:variable name="annotations" select="($points-to-me union $i-point-to)"/>

  <xsl:variable name="before-annotations" as="element(db:annotation)*">
    <xsl:for-each select="$annotations">
      <xsl:if test="$annotation-placement = 'before'
                    or (contains-token(@role, 'before')
                        and not(contains-token(@role, 'after')))">
        <xsl:sequence select="."/>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="after-annotations" as="element(db:annotation)*"
                select="$annotations except $before-annotations"/>

  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:for-each select="$before-annotations">
      <ghost:annotation linkend="{f:generate-id(.)}" placement="before"/>
    </xsl:for-each>
    <xsl:apply-templates select="node()"/>
    <xsl:for-each select="$after-annotations">
      <ghost:annotation linkend="{f:generate-id(.)}" placement="after"/>
    </xsl:for-each>
  </xsl:copy>
</xsl:template>

<xsl:template match="element()">
  <xsl:copy>
    <xsl:apply-templates select="@*,node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="attribute()|text()|comment()|processing-instruction()">
  <xsl:copy/>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="/*" priority="100" mode="mp:move-to-end">
  <xsl:copy>
    <xsl:apply-templates select="@*,node()" mode="mp:move-to-end"/>
    <xsl:for-each select="//db:annotation">
      <xsl:copy>
        <xsl:if test="empty(@xml:id)">
          <xsl:attribute name="xml:id" select="f:generate-id(.)"/>
        </xsl:if>
        <xsl:sequence select="@*,node()"/>
      </xsl:copy>
    </xsl:for-each>
  </xsl:copy>
</xsl:template>

<xsl:template match="db:annotation" priority="100" mode="mp:move-to-end"/>

<xsl:template match="element()" mode="mp:move-to-end">
  <xsl:copy>
    <xsl:apply-templates select="@*,node()" mode="mp:move-to-end"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="attribute()|text()|comment()|processing-instruction()"
              mode="mp:move-to-end">
  <xsl:copy/>
</xsl:template>

</xsl:stylesheet>
