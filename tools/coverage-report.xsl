<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="db xs x"
                version="3.0">

<xsl:output method="html" encoding="utf-8" indent="no"
            omit-xml-declaration="yes"/>

<xsl:variable name="test-reports">
  <wrapper>
    <xsl:sequence select="collection('../build?match=.*-result.xml')/x:report"/>
  </wrapper>
</xsl:variable>

<xsl:variable name="Z" select="xs:dayTimeDuration('PT0H')"/>

<!-- This stylesheet depends critically on the structure of element-list.xml -->
<xsl:variable name="element-list" as="element(db:article)"
              select="doc('../src/test/resources/element-list.xml')/db:article"/>

<xsl:variable name="good-threshold" select="4"/>

<xsl:variable name="all-contexts">
  <x:description>
    <xsl:for-each select="$test-reports//x:context">
      <xsl:choose>
        <xsl:when test="@href">
          <x:context href="{@href}">
            <xsl:sequence select="doc(@href)"/>
          </x:context>
        </xsl:when>
        <xsl:otherwise>
          <x:context href="{base-uri(.)}">
            <xsl:copy-of select="node()"/>
          </x:context>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </x:description>
</xsl:variable>

<xsl:variable name="covered" as="xs:string*">
  <xsl:for-each select="$element-list//db:member">
    <xsl:variable name="member"
                  select="QName('http://docbook.org/ns/docbook',
                                string(.))"/>
    <xsl:if test="$all-contexts/*/x:context//*[node-name(.) = $member]">
      <xsl:sequence select="string(.)"/>
    </xsl:if>
  </xsl:for-each>
</xsl:variable>

<xsl:variable name="good-list" as="xs:string*">
  <xsl:for-each select="$element-list//db:member">
    <xsl:variable name="member"
                  select="QName('http://docbook.org/ns/docbook',
                                string(.))"/>
    <xsl:variable name="tests"
                  select="$all-contexts/*/x:context//*[node-name(.) = $member]"/>

    <xsl:sequence select="if (count($tests) gt $good-threshold)
                          then .
                          else ()"/>
  </xsl:for-each>
</xsl:variable>

<xsl:variable name="total-count" select="count($element-list//db:member)"/>
<xsl:variable name="tested-count" select="count($covered)"/>
<xsl:variable name="good-count" select="count($good-list)"/>

<xsl:template match="/">
  <xsl:variable name="xspec-report" select="."/>

  <xsl:message expand-text="yes">
    <xsl:text>{$total-count} elements; </xsl:text>
    <xsl:text>{$total-count - $tested-count} untested, </xsl:text>
    <xsl:text>{$tested-count} tested, </xsl:text>
    <xsl:text>{$good-count} well tested.</xsl:text>
  </xsl:message>

  <html>
    <head>
      <title>DocBook xslTNG Coverage Report</title>
      <link rel="shortcut icon" href="../img/xsltng-icon.png" />
      <link rel="stylesheet" href="css/coverage.css"/>
    </head>
    <body>
      <header>
        <h1><span class="text">DocBook xslTNG</span
        ><span class="img"
        ><img class="logo" alt="[xslTNG logo]" src="../media/DocBookXslTNG.png"/></span></h1>
        <h2>Coverage Report</h2>
      </header>
      <main>
        <p>
          <xsl:variable name="dt"
                        select="adjust-dateTime-to-timezone(
                                   xs:dateTime($xspec-report/x:report/@date), $Z)"/>
          <xsl:text>Reported on </xsl:text>
          <xsl:sequence select="format-dateTime($dt, '[D01] [MNn,*-3] [Y0001]')"/>
          <xsl:text> at </xsl:text>
          <xsl:sequence select="format-dateTime($dt, '[H01]:[m01] UTC')"/>
          <xsl:text>.</xsl:text>
        </p>

        <details>
          <ul xsl:expand-text="yes">
            <li>DocBook elements: {$total-count}</li>
            <li>Covered: {$tested-count} ({
                   format-number($tested-count div $total-count, "##.00%")};
                   <xsl:text>good coverage: </xsl:text>
                   {format-number($good-count div $total-count, "##.00%")})
            </li>
            <li>Untested: {$total-count - $tested-count} ({
                   format-number(($total-count - $tested-count) div $total-count,
                                 "##.00%")})
            </li>
          </ul>

          <div class="table-of-contents">
            <div class="title">Table of Contents</div>
            <ul class="toc">
              <xsl:for-each select="$element-list//db:section[not(db:section)]">
                <li>
                  <a href="#{generate-id(.)}">
                    <xsl:apply-templates select="db:title/node()"/>
                  </a>
                </li>
              </xsl:for-each>
            </ul>
          </div>
        </details>

        <xsl:for-each select="$element-list//db:section[not(db:section)]">
          <xsl:variable name="uri" as="xs:string">
            <xsl:choose>
              <xsl:when test="@xml:id='publishers'">
                <xsl:sequence select="'https://tdg.docbook.org/tdg/publishers/5.2'"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:sequence select="'https://tdg.docbook.org/tdg/5.2'"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>

          <div id="{generate-id(.)}">
            <header>
              <h3><xsl:value-of select="db:title"/></h3>
            </header>
            <dl>
              <xsl:for-each select=".//db:member">
                <xsl:variable name="member"
                              select="QName('http://docbook.org/ns/docbook',
                                      string(.))"/>
                <xsl:variable name="tests"
                              select="$all-contexts/*/x:context
                                      //*[node-name(.) = $member]"/>
                <dt>
                  <xsl:attribute name="class"
                                 select="if (count($tests) gt 5)
                                         then 'good'
                                         else if ($tests)
                                         then 'fair'
                                         else 'none'"/>
                  <xsl:choose>
                    <xsl:when test="$tests">
                      <span class="check">☑</span>
                      <span class="element">
                        <a href="{$uri}/{.}">
                          <xsl:value-of select="."/>
                        </a>
                      </span>
                      <xsl:text expand-text="yes"> ({count($tests)})</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <span class="check">☐</span>
                      <strong>
                        <span class="element">
                          <a href="{$uri}/{.}">
                            <xsl:value-of select="."/>
                          </a>
                        </span>
                      </strong>
                    </xsl:otherwise>
                  </xsl:choose>
                </dt>
              </xsl:for-each>
            </dl>
          </div>
        </xsl:for-each>
      </main>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>
