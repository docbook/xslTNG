<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:h="http://www.w3.org/1999/xhtml"
                xmlns="http://docbook.org/ns/docbook"
                expand-text="yes"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:output method="xml" encoding="utf-8" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:mode on-no-match="shallow-copy"/>

<xsl:variable name="spaces"
              select="'                                                            '"/>

<xsl:template match="/" name="xsl:initial-template">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="db:refentry">
  <xsl:variable name="name" select="db:refmeta/db:fieldsynopsis[1]/db:varname"/>
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:attribute name="xml:id" select="'p_' || $name"/>
    <xsl:text>&#10;   </xsl:text>
    <xsl:processing-instruction name="db">
      <xsl:text>filename="p_{$name}"</xsl:text>
    </xsl:processing-instruction>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<xsl:template match="db:fieldsynopsis"/>

<xsl:template match="db:refmeta">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:if test="empty(db:refentrytitle)">
      <refentrytitle>
        <xsl:sequence select="'$' || db:fieldsynopsis/db:varname/string()"/>
      </refentrytitle>
    </xsl:if>
    <xsl:apply-templates select="node()"/>
    <xsl:for-each select="db:fieldsynopsis">
      <refmiscinfo>{{}}{db:varname/string()}</refmiscinfo>
    </xsl:for-each>
  </xsl:copy>
</xsl:template>

<xsl:template match="db:refnamediv">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:for-each select="../db:refmeta/db:fieldsynopsis">
      <refname>
        <xsl:if test="position() gt 1">
          <xsl:attribute name="xml:id" select="'p_' || db:varname"/>
        </xsl:if>
        <xsl:text>${db:varname/string()}</xsl:text>
      </refname>
    </xsl:for-each>
    <xsl:apply-templates/>
    <refclass>param</refclass>
  </xsl:copy>

  <refsynopsisdiv>
    <title>Synopsis</title>

    <xsl:choose>
      <xsl:when test="ancestor::db:refentry[contains-token(@role, 'obsolete')]">
        <para>
          <xsl:text>Obsolete as of version </xsl:text>
          <xsl:sequence select="substring-after(ancestor::db:refentry/@role, 'obsolete ')"/>
          <xsl:text>.</xsl:text>
        </para>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="../db:refmeta/db:fieldsynopsis">
          <xsl:choose>
            <xsl:when test="db:initializer/*">
              <xsl:variable name="synopsis">
                <xsl:element name="xsl:param" namespace="http://www.w3.org/1999/XSL/Transform">
                  <xsl:attribute name="name" select="db:varname/string()"/>
                  <xsl:if test="db:type">
                    <xsl:attribute name="as" select="db:type/string()"/>
                  </xsl:if>
                  <xsl:apply-templates select="db:initializer/node()"
                                       mode="copy-without-namespaces"/>
                </xsl:element>
              </xsl:variable>
              <xsl:variable name="text" as="xs:string">
                <xsl:sequence select="serialize($synopsis, map{'method':'xml','indent':true()})"/>
              </xsl:variable>
              <synopsis linenumbering="unnumbered">
                <xsl:sequence
                    select="replace($text, ' xmlns:xsl=.http://www.w3.org/1999/XSL/Transform.', '')
                            ! replace(., ' xmlns=.http://www.w3.org/1999/xhtml.', '')
                            ! replace(., '^\s+', '')
                            ! replace(., '\s+$', '')"/>
              </synopsis>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="prefix"
                            select="'$' || db:varname
                                    || (if (db:type)
                                        then ' as ' || db:type
                                        else '')
                                    || ' :='"/>
              <synopsis>
                <xsl:sequence select="$prefix"/>
                <xsl:for-each select="tokenize(string(db:initializer), '&#10;')">
                  <xsl:if test="position() gt 1">
                    <xsl:text> &#10;</xsl:text>
                    <xsl:text>{substring($spaces, 1, string-length($prefix)+1)}</xsl:text>
                  </xsl:if>
                  <xsl:sequence select="."/>
                </xsl:for-each>
              </synopsis>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </refsynopsisdiv>
</xsl:template>

<xsl:mode name="copy-without-namespaces" on-no-match="shallow-copy"/>

<xsl:template match="h:*" mode="copy-without-namespaces" priority="10">
  <xsl:element name="{local-name(.)}" namespace="http://www.w3.org/1999/xhtml">
    <xsl:apply-templates select="@*,node()" mode="copy-without-namespaces"/>
  </xsl:element>
</xsl:template>

<xsl:template match="xsl:*" mode="copy-without-namespaces" priority="10">
  <xsl:element name="xsl:{local-name(.)}" namespace="http://www.w3.org/1999/XSL/Transform">
    <xsl:apply-templates select="@*,node()" mode="copy-without-namespaces"/>
  </xsl:element>
</xsl:template>

<xsl:template match="*" mode="copy-without-namespaces">
  <xsl:message terminate="yes">Unexpected element: <xsl:sequence select="node-name(.)"/></xsl:message>
</xsl:template>

</xsl:stylesheet>
