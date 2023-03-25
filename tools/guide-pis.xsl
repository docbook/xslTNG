<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:mg="http://docbook.org/ns/guide/modes"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://docbook.org/ns/docbook"
                exclude-result-prefixes="db mg xs"
                version="3.0">

<xsl:output method="xml" encoding="utf-8" indent="no"/>

<xsl:mode on-no-match="shallow-copy"/>

<xsl:template match="db:reference">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates select="db:refentry[1]/preceding-sibling::node()"/>
    <xsl:apply-templates select="db:refentry">
      <xsl:sort select="db:refnamediv/db:refname[1]"/>
    </xsl:apply-templates>
  </xsl:copy>
</xsl:template>

<xsl:template match="db:refentry">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:variable name="primary" select="db:refnamediv/db:refclass/string()"/>
    <xsl:variable name="secondary" as="xs:string+">
      <xsl:for-each select="db:refmeta/db:refmiscinfo">
        <xsl:sequence select="if (contains(., '#'))
                              then substring-before(substring-after(., '}'), '#')
                              else substring-after(., '}')"/>
      </xsl:for-each>
    </xsl:variable>
    <xsl:for-each select="distinct-values($secondary)">
      <indexterm>
        <primary>
          <xsl:sequence select="$primary"/>
        </primary>
        <secondary>
          <xsl:sequence select="."/>
        </secondary>
      </indexterm>
    </xsl:for-each>
    <xsl:apply-templates select="node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="db:parameter[not(ancestor::db:funcsynopsis)]">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates select="node()"/>
  </xsl:copy>
  <indexterm>
    <primary>param</primary>
    <secondary>
      <xsl:sequence select="normalize-space(.)"/>
    </secondary>
  </indexterm>
</xsl:template>

<xsl:template match="db:varname">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates select="node()"/>
  </xsl:copy>
  <indexterm>
    <primary>variable</primary>
    <secondary>
      <xsl:sequence select="normalize-space(.)"/>
    </secondary>
  </indexterm>
</xsl:template>

<xsl:template match="processing-instruction('guide-example')">
  <xsl:choose>
    <xsl:when test="id(.)">
      <xsl:variable name="markup" as="node()*">
        <xsl:apply-templates select="id(.)/* except (id(.)/db:info|id(.)/db:title)"
                             mode="mg:strip-ns"/>
      </xsl:variable>
      <programlisting language="xml" linenumbering="unnumbered">
        <xsl:sequence select="serialize($markup,
                                        map { 'method': 'xml',
                                              'indent': true() })"/>
      </programlisting>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message select="'?guide-example error:', ."/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:att">
  <tag class="attribute">
    <xsl:apply-templates select="@*,node()"/>
  </tag>
</xsl:template>

<xsl:template match="db:mode">
  <code role="mode">
    <xsl:apply-templates select="@*,node()"/>
  </code>
</xsl:template>

<xsl:template match="db:dir">
  <filename class="directory">
    <xsl:apply-templates select="@*,node()"/>
  </filename>
</xsl:template>

<xsl:template match="db:ext">
  <filename class="extension">
    <xsl:apply-templates select="@*,node()"/>
  </filename>
</xsl:template>

<xsl:template match="db:template">
  <code role="template">
    <xsl:apply-templates select="@*,node()"/>
  </code>
</xsl:template>

<xsl:template match="attribute()|text()|comment()|processing-instruction()">
  <xsl:copy/>
</xsl:template>

<xsl:template match="element()" mode="mg:strip-ns">
  <xsl:element name="{local-name(.)}" namespace="">
    <xsl:apply-templates select="@*,node()" mode="mg:strip-ns"/>
  </xsl:element>
</xsl:template>

<xsl:template match="attribute()|text()|comment()|processing-instruction()"
              mode="mg:strip-ns">
  <xsl:copy/>
</xsl:template>

</xsl:stylesheet>

