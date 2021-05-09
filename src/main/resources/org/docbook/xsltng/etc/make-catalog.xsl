<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:cat="urn:oasis:names:tc:entity:xmlns:xml:catalog"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
		exclude-result-prefixes="cat xs"
                version="3.0">

<xsl:output method="xml" encoding="utf-8" indent="yes"/>

<xsl:param name="version" as="xs:string" required="yes"/>
<xsl:param name="jarloc" as="xs:string?" select="()"/>
<xsl:param name="jarpath" as="xs:string" select="''"/>
<xsl:param name="catalog" as="xs:string?" select="()"/>

<xsl:variable name="https" select="'https://cdn.docbook.org/'"/>

<xsl:template match="catalog">
  <xsl:if test="contains($jarloc, 'classpath:')">
    <xsl:comment> This catalog requires XML Resolver 2.0.0 or later </xsl:comment>
    <xsl:text>&#10;</xsl:text>
  </xsl:if>
  <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
    <xsl:apply-templates select="@*,node()"/>
    <xsl:if test="exists($catalog)">
      <nextCatalog catalog="{$catalog}"/>
    </xsl:if>
  </catalog>
</xsl:template>

<xsl:template match="uri">
  <xsl:variable name="name" select="substring-after(@name, '/xsltng/')"/>

  <xsl:for-each select="('current', $version)">
    <xsl:variable name="path" select="'release/xsltng/' ||  . || '/' || $name"/>
    <uri xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
      <xsl:attribute name="name" select="concat($https, $path)"/>
      <xsl:attribute name="uri"
                     select="if (exists($jarloc))
                             then $jarloc || $jarpath || $name
                             else '../' || $name"/>
    </uri>
  </xsl:for-each>
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
