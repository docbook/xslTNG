<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://docbook.org/ns/docbook"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:l="http://docbook.org/ns/docbook/l10n"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="db xs"
                version="3.0">

<xsl:output method="xml" encoding="utf-8" indent="yes"/>

<xsl:key name="id" match="*" use="@xml:id"/>

<xsl:variable name="root" select="/"/>

<xsl:template match="db:article">
  <l:l10n xmlns:l="http://docbook.org/ns/docbook/l10n"
          xmlns="http://docbook.org/ns/docbook"
          language="{db:info/db:bibliomisc[@role='language']}"
          english-language-name="{db:info/db:bibliomisc[@role='language-name'
                                                        and @xml:lang='en']}">
    <xsl:apply-templates select="db:section"/>
  </l:l10n>
</xsl:template>

<xsl:template match="db:section">
  <l:gentext name="{@xml:id}">
    <xsl:apply-templates select="db:segmentedlist"/>
  </l:gentext>
</xsl:template>

<xsl:template match="db:section[@xml:id='letters']" priority="10">
  <l:letters>
    <xsl:for-each select="db:segmentedlist/db:seglistitem">
      <xsl:variable name="i" select="db:seg[1]/string()"/>
      <xsl:for-each select="db:seg[2]/db:simplelist/db:member">
        <l:l i="{$i}">
          <xsl:sequence select="node()"/>
        </l:l>
      </xsl:for-each>
    </xsl:for-each>
  </l:letters>
</xsl:template>

<xsl:template match="db:segmentedlist">
  <xsl:for-each select="db:seglistitem">
    <l:tokens key="{db:seg[1]}">
      <xsl:sequence select="db:seg[2]/node()"/>
    </l:tokens>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
