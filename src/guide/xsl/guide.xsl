<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:a="http://nwalsh.com/ns/xslt/analysis"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:t="http://docbook.org/ns/docbook/templates"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="a db f m t v"
                version="3.0">

<xsl:import href="../../../build/xslt/main.xsl"/>
<xsl:import href="../../../build/xslt/drivers.xsl"/>
<xsl:import href="common.xsl"/>

<!-- ============================================================ -->

<xsl:param name="refentry-generate-name" select="false()"/>
<xsl:param name="chunk-nav" select="'true'"/>

<xsl:param name="persistent-toc" select="'true'"/>
<xsl:param name="persistent-toc-css"
           select="'css/guide-toc.css'"/>
<xsl:variable name="v:toc-open" as="element()">
  <i class="far fa-book"/>
</xsl:variable>
<xsl:variable name="v:toc-close" as="element()">
  <i class="far fa-window-close"/>
</xsl:variable>
<xsl:variable name="v:annotation-close" as="element()">
  <i class="far fa-window-close"/>
</xsl:variable>

<!-- ============================================================ -->

<xsl:template match="/">
  <xsl:variable name="this" select="/"/>

  <xsl:sequence select="f:undocumented(
                           distinct-values($explorer//a:template[@mode]/@mode/string()),
                           $this, 'Undocumented mode:')"/>

  <xsl:sequence select="f:undocumented(
                           distinct-values($explorer
                               //a:variable[contains-token(@class, 'variable')]
                               /@name/string()),
                           $this, 'Undocumented var:')"/>

  <xsl:sequence select="f:undocumented(
                           distinct-values($explorer
                               //a:variable[contains-token(@class, 'param')]
                               /@name/string()),
                           $this, 'Undocumented param:')"/>

  <xsl:sequence select="f:undocumented(
                           distinct-values($explorer//a:function/@name/string()),
                           $this, 'Undocumented function:')"/>

  <xsl:sequence select="f:undocumented(
                           distinct-values($explorer//a:template/@name/string()),
                           $this, 'Undocumented template:')"/>

  <xsl:call-template name="t:docbook"/>
</xsl:template>

<xsl:template match="*" mode="m:html-head-links">
  <xsl:next-match/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="stylesheet" href="css/guide.css"/>
  <link rel="stylesheet" href="css/guide-online.css"/>
  <link rel="shortcut icon" href="media/xsltng-icon.png" />
  <script type="text/javascript"
          src="https://kit.fontawesome.com/c94d537c36.js" crossorigin="anonymous"/>
</xsl:template>

<xsl:template match="db:book" mode="m:docbook">
  <xsl:next-match/>
  <div db-chunk="copyright.html" db-navigable='false'>
    <div>
      <xsl:apply-templates select="db:info/db:legalnotice/*" mode="m:docbook"/>
    </div>
  </div>
</xsl:template>

</xsl:stylesheet>
