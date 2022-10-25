<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:f="http://nwalsh.com/ns/xsl/functions"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="array f xs"
                version="2.0">

<xsl:output method="html" encoding="utf-8" indent="no" html-version="5"/>

<xsl:param name="build-tag" as="xs:string" select="''"/>
<xsl:param name="org" as="xs:string" select="'docbook'"/>
<xsl:param name="repo" as="xs:string" select="'xslTNG'"/>
<xsl:variable name="reluri" as="xs:string"
              select="'https://api.github.com/repos/' || $org || '/' || $repo || '/releases'"/>

<xsl:variable name="release" as="map(*)">
  <xsl:variable name="releases" select="parse-json(unparsed-text($reluri))"/>
  <xsl:sequence select="array:get($releases, 1)"/>
</xsl:variable>

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:variable name="summary" as="map(*)">
  <xsl:map>
    <xsl:for-each select="tokenize(unparsed-text('../build/test-results.txt'), '&#10;')">
      <xsl:choose>
        <xsl:when test="matches(., '\d+ tests')">
          <xsl:map-entry key="'total'"
                         select="xs:integer(replace(., '(\d+) tests', '$1'))"/>
        </xsl:when>
        <xsl:when test="matches(., '\d+ (passed|failed|pending)')">
          <xsl:map-entry key="replace(., '\d+ (passed|failed|pending)', '$1')"
                         select="xs:integer(replace(., '(\d+) (passed|failed|pending)', '$1'))"/>
        </xsl:when>
        <xsl:when test="normalize-space(.) = ''"/>
        <xsl:otherwise>
          <xsl:message select="'Failed to parse summary: ', ."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:map>
</xsl:variable>

<xsl:template match="element()">
  <xsl:copy>
    <xsl:apply-templates select="@*,node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="processing-instruction('testsummary')">
  <xsl:choose>
    <xsl:when test="$summary?total = $summary?passed">
      <xsl:text>all tests are passing.</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$summary?failed gt 0 and $summary?pending gt 0">
          <span class="failing">
            <xsl:sequence select="f:number($summary?failed, 'test is', 'tests are')"/>
            <xsl:text> failing</xsl:text>
          </span>
          <xsl:text>, </xsl:text>
          <span class="pending">
            <xsl:sequence select="f:number($summary?pending, 'test is', 'tests are')"/>
            <xsl:text> pending</xsl:text>
          </span>
          <xsl:text>, </xsl:text>
        </xsl:when>
        <xsl:when test="$summary?failed gt 0">
          <span class="failing">
            <xsl:sequence select="f:number($summary?failed, 'test is', 'tests are')"/>
            <xsl:text> failing</xsl:text>
          </span>
          <xsl:text>, </xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <span class="pending">
            <xsl:sequence select="f:number($summary?pending, 'test is', 'tests are')"/>
            <xsl:text> pending</xsl:text>
          </span>
          <xsl:text>, </xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      <span class="passing">
        <xsl:sequence select="f:number($summary?passed, 'test is', 'tests are')"/>
        <xsl:text> passing</xsl:text>
      </span>
      <xsl:text> (</xsl:text>
      <xsl:sequence select="format-number($summary?passed div $summary?total, '#.##%')"/>
      <xsl:text>).</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="processing-instruction('testcount')">
  <xsl:sequence select="format-number($summary?total, '#,###')"/>
</xsl:template>

<xsl:template match="processing-instruction('xsltng-version')">
  <xsl:if test="$build-tag eq ''">
    <xsl:message select="'GitHub API reports latest build:', string($release?tag_name)"/>
  </xsl:if>
  <xsl:sequence select="if ($build-tag eq '')
                        then string($release?tag_name)
                        else $build-tag"/>
</xsl:template>

<xsl:template match="processing-instruction('pubdate')">
  <xsl:if test="$build-tag eq ''">
    <xsl:message select="'GitHub API reports latest build date:',
                         xs:dateTime($release?published_at)"/>
  </xsl:if>
  <xsl:variable name="date" select="if ($build-tag eq '')
                                    then xs:dateTime($release?published_at)
                                    else current-dateTime()"/>
  <xsl:variable name="Z" select="xs:dayTimeDuration('PT0H')"/>
  <xsl:variable name="pubdate"
                select="adjust-dateTime-to-timezone($date, $Z)"/>
  <xsl:sequence select="format-dateTime($pubdate,
                                        'at [H01]:[m01] ')"/>
  <a href="https://www.timeanddate.com/time/zones/gmt">GMT</a>
  <xsl:sequence select="format-dateTime($pubdate,
                                        ' on [D01] [MNn,*-3] [Y0001]')"/>
</xsl:template>

<xsl:template match="attribute()|text()|comment()|processing-instruction()">
  <xsl:copy/>
</xsl:template>

<xsl:function name="f:number">
  <xsl:param name="number" as="xs:integer"/>
  <xsl:param name="singular" as="xs:string"/>
  <xsl:param name="plural" as="xs:string"/>
  <xsl:choose>
    <xsl:when test="$number = 1">
      <xsl:sequence select="format-number($number, '#,###'), ' ', $singular"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="format-number($number, '#,###'), ' ', $plural"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

</xsl:stylesheet>

