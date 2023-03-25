<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                exclude-result-prefixes="xs"
                version="3.0">

<xsl:output method="text" encoding="utf-8"/>
<xsl:param name="test-drivers" as="xs:string*"/>

<xsl:template name="xsl:initial-template">
  <xsl:variable name="result-files"
                select="collection('../build?match=.*-result.xml')"/>

  <xsl:variable name="totals" as="map(*)">
    <xsl:iterate select="$result-files">
      <xsl:param name="totals" as="map(xs:string, xs:integer)"
                 select="map { 'total': 0,
                               'pending': 0,
                               'pass': 0,
                               'fail': 0 }"/>
      <xsl:on-completion>
        <xsl:sequence select="$totals"/>
      </xsl:on-completion>

      <xsl:variable name="report"
                    select="./x:report"/>

      <xsl:next-iteration>
        <xsl:with-param name="totals" as="map(xs:string, xs:integer)">
          <xsl:map>
            <xsl:map-entry key="'total'"
                           select="$totals?total + count($report//x:test)"/>
            <xsl:map-entry key="'pending'"
                           select="$totals?pending + count($report//x:test[@pending])"/>
            <xsl:map-entry key="'pass'"
                           select="$totals?pass + count($report//x:test[@successful='true'])"/>
            <xsl:map-entry key="'fail'"
                           select="$totals?fail + count($report//x:test[@successful='false'])"/>
          </xsl:map>
        </xsl:with-param>
      </xsl:next-iteration>
    </xsl:iterate>
  </xsl:variable>

  <xsl:value-of select="$totals?total"/>
  <xsl:text> tests&#10;</xsl:text>
  <xsl:value-of select="$totals?pass"/>
  <xsl:text> passed&#10;</xsl:text>
  <xsl:value-of select="$totals?fail"/>
  <xsl:text> failed&#10;</xsl:text>
  <xsl:value-of select="$totals?pending"/>
  <xsl:text> pending&#10;</xsl:text>
  <xsl:message select="'=================================================='"/>
  <xsl:message expand-text="yes">
    <xsl:text>{$totals?total} tests; </xsl:text>
    <xsl:text>{$totals?pass} passed, </xsl:text>
    <xsl:text>{$totals?fail} failed, {$totals?pending} pending.</xsl:text>
  </xsl:message>
  <xsl:message select="'=================================================='"/>
</xsl:template>

</xsl:stylesheet>
