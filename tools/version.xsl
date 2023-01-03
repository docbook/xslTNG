<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                version="3.0">

<xsl:param name="version" required="yes"/>
<xsl:param name="gitref" required="yes"/>

<xsl:output method="xml" encoding="utf-8" indent="yes"
	    omit-xml-declaration="yes"/>

<xsl:template match="/">
  <xsl:message select="'Version:', $version, ':', $gitref"/>

  <xsl:element name="xsl:stylesheet" namespace="http://www.w3.org/1999/XSL/Transform">
    <xsl:namespace name="v" select="'http://docbook.org/ns/docbook/variables'"/>
    <xsl:attribute name="version" select="'3.0'"/>
    <xsl:element name="xsl:variable" namespace="http://www.w3.org/1999/XSL/Transform">
      <xsl:attribute name="name" select="'v:VERSION'"/>
      <xsl:attribute name="select" select="concat('''', $version, '''')"/>
    </xsl:element>
    <xsl:element name="xsl:variable" namespace="http://www.w3.org/1999/XSL/Transform">
      <xsl:attribute name="name" select="'v:VERSION-ID'"/>
      <xsl:attribute name="select" select="concat('''', $gitref, '''')"/>
    </xsl:element>
  </xsl:element>
  <xsl:text>&#10;</xsl:text>
</xsl:template>

</xsl:stylesheet>
