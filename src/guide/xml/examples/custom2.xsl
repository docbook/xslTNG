<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:db="http://docbook.org/ns/docbook"
    xmlns:m="http://docbook.org/ns/docbook/modes"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="db m xs"
    version="3.0">

<xsl:import href="docbook/xslt/docbook.xsl"/>

<xsl:param name="orderedlist-item-numeration"
           select="'1'"/>

<xsl:param name="date-dateTime-format"
           select="'[D01] [MNn,*-3] [Y0001]
                   at [H01]:[m01]'"/>

<xsl:template match="db:productname"
              mode="m:docbook">
  <xsl:variable name="name"
                select="normalize-space(.)"/>

  <xsl:variable name="url" as="xs:string?">
    <xsl:choose>
      <xsl:when test="$name='DocBook'">
        <xsl:sequence select="'https://docbook.org/'"/>
      </xsl:when>
      <xsl:when test="$name='DocBook xslTNG Stylesheets'">
        <xsl:sequence select="'https://xsltng.docbook.org/'"/>
      </xsl:when>
      <xsl:when test="$name='Wikipedia'">
        <xsl:sequence select="'https://wikipedia.org/'"/>
      </xsl:when>
      <xsl:otherwise>
        <!-- Unrecognized -->
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
                  
  <xsl:choose>
    <xsl:when test="empty($url)">
      <xsl:next-match/>
    </xsl:when>
    <xsl:otherwise>
      <a href="{$url}" title="Home page">
        <xsl:next-match/>
      </a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
