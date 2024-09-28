<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:h="http://www.w3.org/1999/xhtml"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="#all"
                version="3.0">

<!-- this is only intended to run against the built xslt output -->
<xsl:import href="../../../build/xslt/docbook.xsl"/>

<xsl:variable name="v:templates" as="document-node()"
              xmlns:v="http://docbook.org/ns/docbook/variables">
  <xsl:document xmlns:tmp="http://docbook.org/ns/docbook/templates"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns="http://www.w3.org/1999/xhtml">
    <db:book>
      <header>
        <tmp:apply-templates select="db:cover/db:mediaobject">
          <div class="cover">
            <tmp:content/>
          </div>
        </tmp:apply-templates>
        <tmp:apply-templates select="db:title">
          <h1><tmp:content/></h1>
        </tmp:apply-templates>
        <tmp:apply-templates select="db:editor">
          <div class="editor">
            <h3><tmp:content/></h3>
          </div>
        </tmp:apply-templates>
      </header>
    </db:book>
    <db:chapter context="parent::db:book">
      <header>
        <tmp:apply-templates select="db:title">
          <h2><tmp:content/></h2>
        </tmp:apply-templates>
        <tmp:apply-templates select="db:subtitle">
          <h3><tmp:content/></h3>
        </tmp:apply-templates>
        <tmp:apply-templates select="db:author">
          <h3 class="author">
            <tmp:content/>
          </h3>
        </tmp:apply-templates>
      </header>
    </db:chapter>
  </xsl:document>
</xsl:variable>

<xsl:template match="db:book" mode="m:docbook">
  <xsl:message>Processing with book.014.xsl customization layer</xsl:message>
  <xsl:next-match/>
</xsl:template>

<xsl:template match="db:book" mode="m:generate-titlepage">
  <header>
    <h1>
      <xsl:apply-templates select="db:info/db:title" mode="m:titlepage"/>
    </h1>
    <p>Hello, world</p>
  </header>
</xsl:template>

</xsl:stylesheet>
