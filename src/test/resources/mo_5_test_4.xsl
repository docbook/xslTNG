<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:h="http://www.w3.org/1999/xhtml"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                version="3.0">

<!-- This is only intended to run against the built xslt output -->

<!-- This version is different from mo_1_test_4.xsl because there are
     two different levels of renaming going on in mo-5. -->

<xsl:import href="../../../build/xslt/docbook.xsl"/>

<xsl:template match="@*" mode="m:mediaobject-output-adjust">
  <xsl:param name="adjusted-uri" as="xs:string"/>

  <xsl:choose>
    <xsl:when test="exists(f:uri-scheme(.))">
      <!-- Don't mess with absolute URIs... -->
      <xsl:sequence select="$adjusted-uri"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="type" as="xs:string">
        <xsl:choose>
          <xsl:when test="../self::h:img">image</xsl:when>
          <xsl:when test="ancestor::h:video">video</xsl:when>
          <xsl:when test="ancestor::h:audio">audio</xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="'media-cleanup-err'"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:variable name="parts" select="tokenize($adjusted-uri, '/')"/>

      <xsl:sequence select="string-join($parts[position() lt (last() - 1)], '/')
                            || (if (count($parts) gt 2) then '/' else '')
                            || $type || '/'
                            || $parts[position() eq (last() - 1)] || '/'
                            || $parts[position() eq last()]"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
