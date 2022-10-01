<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ext="http://docbook.org/extensions/xslt"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="ext xs"
                version="3.0">

<xsl:output method="xml" encoding="utf-8" indent="no"/>

<!-- This should only be called if the ext:xinclude extension function
     is available. If it isn't *compiled* with that function available,
     then it won't work the way you expect. -->
<xsl:template xmlns:xi="http://www.w3.org/2001/XInclude"
              match="xi:include">
  <xsl:choose>
    <xsl:when test="function-available('ext:xinclude')">
      <xsl:sequence select="ext:xinclude(.)"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message>XInclude extension function unavailable</xsl:message>
      <xsl:copy>
        <xsl:apply-templates select="@*,node()"/>
      </xsl:copy>
    </xsl:otherwise>
  </xsl:choose>
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
