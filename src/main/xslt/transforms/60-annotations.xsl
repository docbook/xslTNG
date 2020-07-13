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

<xsl:key name="annotations" match="db:annotation" use="@xml:id"/>

<xsl:template match="/">
  <xsl:document>
    <xsl:apply-templates/>
  </xsl:document>
</xsl:template>

<!-- Move all the actual annotations to the end of the document -->
<xsl:template match="/*" priority="100">
  <xsl:copy>
    <xsl:apply-templates select="@*,node()"/>
    <!-- Make sure annotations have xml:id attributes! -->
    <xsl:for-each select="//db:annotation">
      <xsl:copy>
        <xsl:if test="empty(@xml:id)">
          <xsl:attribute name="xml:id" select="f:generate-id(.)"/>
        </xsl:if>
        <xsl:copy-of select="@*,node()"/>
      </xsl:copy>
    </xsl:for-each>
  </xsl:copy>
</xsl:template>

<xsl:template match="db:annotation" priority="100"/>

<!-- Output a ghost:annotation everywhere an annotation is used -->
<xsl:template match="*[@xml:id] | *[@annotations]">
  <xsl:variable name="points-to-me"
                select="//db:annotation[tokenize(@annotates, '\s+')
                                        = current()/@xml:id]"/>
  <xsl:variable name="i-point-to"
                select="key('annotations', tokenize(@annotations, '\s+'))"/>

  <xsl:variable name="annotations" select="($points-to-me union $i-point-to)"/>

  <xsl:copy>
    <xsl:apply-templates select="@*,node()"/>
    <xsl:for-each select="$annotations">
      <ghost:annotation>
        <xsl:attribute name="linkend" select="f:generate-id(.)"/>
      </ghost:annotation>
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

</xsl:stylesheet>
