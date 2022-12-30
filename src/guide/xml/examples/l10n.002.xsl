<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:import href="../../../../build/xslt/docbook.xsl"/>

<xsl:variable name="v:user-xref-groups" as="element()*">
  <crossref xpath="self::db:chapter|self::db:appendix"
            context="xref-number"/>
</xsl:variable>

<xsl:variable name="v:custom-localizations">
  <locale xmlns="http://docbook.org/ns/docbook/l10n/source"
          language="en"
          english-language-name="English">
    <mappings>
      <gentext key="TableofContents">Contents</gentext>
    </mappings>
    <group name="title-numbered">
      <template name="appendix">%l%.%c</template>
    </group>
    <group name="xref-number">
      <template name="appendix">App. %l</template>
    </group>
  </locale>
</xsl:variable>

<xsl:param name="user-css-links" select="'l10n.example.css'"/>

</xsl:stylesheet>
