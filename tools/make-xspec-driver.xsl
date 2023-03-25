<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.w3.org/1999/XSL/Transform/alias"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"
                version="3.0">

<xsl:output method="xml" encoding="utf-8" indent="yes"/>

<xsl:namespace-alias stylesheet-prefix="t" result-prefix="xsl"/>

<xsl:param name="division-numbers-inherit" select="()"/>
<xsl:param name="component-numbers-inherit" select="()"/>
<xsl:param name="section-numbers-inherit" select="()"/>
<xsl:param name="sets-number-from" select="()"/>
<xsl:param name="books-number-from" select="()"/>
<xsl:param name="divisions-number-from" select="()"/>
<xsl:param name="components-number-from" select="()"/>
<xsl:param name="sections-number-from" select="()"/>
<xsl:param name="formal-objects-number-from" select="()"/>

<xsl:param name="sets-inherit-from" select="()"/>
<xsl:param name="books-inherit-from" select="()"/>
<xsl:param name="divisions-inherit-from" select="()"/>
<xsl:param name="components-inherit-from" select="()"/>
<xsl:param name="sections-inherit-from" select="()"/>
<xsl:param name="formal-objects-inherit-from" select="()"/>

<xsl:param name="lists-of" select="()"/>

<xsl:mode on-no-match="shallow-copy"/>

<xsl:template name="xsl:initial-template">
  <t:stylesheet version="3.0">
    <t:import href="alt-xspec-driver.xsl"/>
    
    <xsl:if test="exists($division-numbers-inherit)">
      <t:param name="division-numbers-inherit" select="'{$division-numbers-inherit}'"/>
    </xsl:if>
    <xsl:if test="exists($component-numbers-inherit)">
      <t:param name="component-numbers-inherit" select="'{$component-numbers-inherit}'"/>
    </xsl:if>
    <xsl:if test="exists($section-numbers-inherit)">
      <t:param name="section-numbers-inherit" select="'{$section-numbers-inherit}'"/>
    </xsl:if>
    <xsl:if test="exists($sets-number-from)">
      <t:param name="sets-number-from" select="'{$sets-number-from}'"/>
    </xsl:if>
    <xsl:if test="exists($books-number-from)">
      <t:param name="books-number-from" select="'{$books-number-from}'"/>
    </xsl:if>
    <xsl:if test="exists($divisions-number-from)">
      <t:param name="divisions-number-from" select="'{$divisions-number-from}'"/>
    </xsl:if>
    <xsl:if test="exists($components-number-from)">
      <t:param name="components-number-from" select="'{$components-number-from}'"/>
    </xsl:if>
    <xsl:if test="exists($sections-number-from)">
      <t:param name="sections-number-from" select="'{$sections-number-from}'"/>
    </xsl:if>
    <xsl:if test="exists($formal-objects-number-from)">
      <t:param name="formal-objects-number-from" select="'{$formal-objects-number-from}'"/>
    </xsl:if>

    <xsl:if test="exists($sets-inherit-from)">
      <t:param name="sets-inherit-from" select="'{$sets-inherit-from}'"/>
    </xsl:if>
    <xsl:if test="exists($books-inherit-from)">
      <t:param name="books-inherit-from" select="'{$books-inherit-from}'"/>
    </xsl:if>
    <xsl:if test="exists($divisions-inherit-from)">
      <t:param name="divisions-inherit-from" select="'{$divisions-inherit-from}'"/>
    </xsl:if>
    <xsl:if test="exists($components-inherit-from)">
      <t:param name="components-inherit-from" select="'{$components-inherit-from}'"/>
    </xsl:if>
    <xsl:if test="exists($sections-inherit-from)">
      <t:param name="sections-inherit-from" select="'{$sections-inherit-from}'"/>
    </xsl:if>
    <xsl:if test="exists($formal-objects-inherit-from)">
      <t:param name="formal-objects-inherit-from" select="'{$formal-objects-inherit-from}'"/>
    </xsl:if>

    <xsl:if test="normalize-space($lists-of) != ''">
      <xsl:for-each select="tokenize(normalize-space($lists-of), '\s+')">
        <t:param name="lists-of-{.}" select="'true'"/>
      </xsl:for-each>
    </xsl:if>

  </t:stylesheet>
</xsl:template>

</xsl:stylesheet>
