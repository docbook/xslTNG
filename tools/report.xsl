<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:t="http://docbook.org/ns/docbook/templates"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="db f m map t x xs"
                version="3.0">

<xsl:import href="coverage-report.xsl"/>

<xsl:output method="html" encoding="utf-8" indent="no"
            omit-xml-declaration="yes"/>

<xsl:key name="test" match="x:test" use="@id"/>

<xsl:variable name="total" select="count($test-reports//x:test)"/>
<xsl:variable name="pass" select="count($test-reports//x:test[@successful = 'true'])"/>
<xsl:variable name="pending" select="count($test-reports//x:test[@pending])"/>
<xsl:variable name="fail" select="($total - $pending) - $pass"/>

<xsl:template match="/">
  <!-- don't run document template from the coverage report -->
  <xsl:message select="'Starting report for', count($test-reports/*/x:report), 'files'"/>
  <xsl:apply-templates select="$test-reports/*/x:report[1]"/>
</xsl:template>

<!-- The assumption is that the input file is the XSpec test results. -->
<xsl:template match="x:report">
  <html>
    <head>
      <title>DocBook xslTNG Test Report</title>
      <link rel="shortcut icon" href="img/xsltng-icon.png" />
      <link rel="stylesheet" href="css/report.css"/>
    </head>
    <body>
      <header>
        <h1><span class="text">DocBook xslTNG</span
        ><span class="img"
        ><img class="logo" alt="[xslTNG logo]" src="media/DocBookXslTNG.png"/></span></h1>
        <h2>Test Report</h2>
      </header>
      <main>
      <p>
        <xsl:variable name="dt"
                      select="adjust-dateTime-to-timezone(xs:dateTime(@date), $Z)"/>
        <xsl:text>Reported on </xsl:text>
        <xsl:sequence select="format-dateTime($dt, '[D01] [MNn,*-3] [Y0001]')"/>
        <xsl:text> at </xsl:text>
        <xsl:sequence select="format-dateTime($dt, '[H01]:[m01] UTC')"/>
        <xsl:text>.</xsl:text>
      </p>

      <div xsl:expand-text="yes"
           class="results { if ($fail eq 0 and $pending eq 0)
                            then 'pass'
                            else if ($fail gt 0)
                                 then 'fail'
                                 else 'pending' }">
        <p>
          <xsl:call-template name="t:results">
            <xsl:with-param name="title" select="'Results'"/>
            <xsl:with-param name="uri" select="()"/>
            <xsl:with-param name="pass" select="$pass"/>
            <xsl:with-param name="fail" select="$fail"/>
            <xsl:with-param name="pending" select="$pending"/>
          </xsl:call-template>
        </p>
        <xsl:call-template name="t:details"/>
      </div>

      <xsl:message select="'Compute coverage…'"/>

      <xsl:call-template name="t:coverage"/>

      <xsl:message select="'Results…'"/>

      <div id="hideresults"/>
      <table>
        <colgroup>
          <col width="15%"/>
          <col width="10%"/>
        </colgroup>
        <thead>
          <tr>
            <th>Scenario</th>
            <th>Pass?</th>
            <th>XML</th>
            <th>Expected result&#x2009;<sup><a href="#tbl.fn" id="tbl.fn.mark">a</a></sup></th>
          </tr>
        </thead>
        <tfoot>
          <tr>
            <td colspan="4">
              <sup><a href="#tbl.fn.mark" id="tbl.fn">a</a></sup>
              The expected results linked here have been transformed
              so that they render properly. The actual expected results
              consist of only the <code>body</code> element.
             </td>
          </tr>
        </tfoot>
        <tbody>
          <xsl:for-each select="$test-reports//x:scenario/input-wrap/x:context[@href]">
            <xsl:sort select="lower-case(tokenize(@href, '/')[last()])"/>

            <!--<xsl:message select="'Test report:', position()"/>-->

            <xsl:variable name="id" select="../../@id/string()"/>
            <xsl:variable name="doc"
                          select="ancestor::x:report[1]/@xspec/string()"/>
            <xsl:variable name="doc"
                          select="$doc
                                  =&gt; substring-after('/xspec/')
                                  =&gt; substring-before('.xspec')"/>

            <xsl:variable name="segment"
                          select="if (contains(@href, '/generated-xml/'))
                                  then '/generated-xml/'
                                  else '/xml/'"/>

            <!--<xsl:message select="'D:', $doc, 'S:', $segment"/>-->

            <xsl:variable name="file" select="tokenize(@href, '/')[last()]
                                              => substring-before('.xml')"/>

            <!--<xsl:message select="'FILE:', $file"/>-->

            <xsl:variable name="key" select="../../@id || '-expect1'"/>
            
            <!--<xsl:message select="'KEY:', $key, count($key), count($test-reports)"/>-->

            <xsl:variable name="test" select="key('test', $key, $test-reports)"/>
            <tr class="{if ($test/@successful = 'true')
                        then 'pass'
                        else 'fail'}">
              <td title="{../../x:label} ({$doc})">
                <a href="{$doc}-result.html#top_{$id}">
                  <xsl:value-of select="$id"/>
                </a>
              </td>
              <td class="passfail">
                <xsl:choose>
                  <xsl:when test="$test/@successful = 'true'">
                    <xsl:text>pass</xsl:text>
                  </xsl:when>
                  <xsl:when test="$test/@successful = 'false'">
                    <xsl:text>fail</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>unknown</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
              <td>
                <a href="xml/{$file}.xml">
                  <xsl:sequence select="$file || '.xml'"/>
                </a>
              </td>
              <td>
                <a href="expected/{$file}.html">
                  <xsl:sequence select="$file || '.html'"/>
                </a>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
      </main>
      <script src="js/report.js"/>
    </body>
  </html>
</xsl:template>

<xsl:template match="x:report" mode="m:results">
  <xsl:variable name="file"
                select="(tokenize(@xspec, '/')[last()]
                         =&gt; substring-before('.xspec'))"/>
  <xsl:variable name="uri"
                select="$file || '-result.html'"/>

  <xsl:variable name="pass" select="count(.//x:test[@successful = 'true'])"/>
  <xsl:variable name="pending" select="count(.//x:test[@pending])"/>
  <xsl:variable name="fail" select="(count(.//x:test) - $pending) - $pass"/>
  <xsl:call-template name="t:results">
    <xsl:with-param name="title" select="$file || '.xspec'"/>
    <xsl:with-param name="uri" select="$uri"/>
    <xsl:with-param name="pass" select="$pass"/>
    <xsl:with-param name="fail" select="$fail"/>
    <xsl:with-param name="pending" select="$pending"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="t:details">
  <xsl:variable name="gradle.properties"
                select="unparsed-text('../properties.gradle')"/>
  <xsl:variable name="properties"
                select="f:parse-properties(tokenize($gradle.properties, '&#10;+'),
                                           map { })"/>
  <details>
    <ul>
      <xsl:for-each select="$test-reports/*/x:report">
        <xsl:sort select="@xspec"/>
        <li class="{if (.//x:test[not(@successful = 'true')])
                    then 'fail'
                    else 'pass'}">
          <xsl:apply-templates select="." mode="m:results"/>
        </li>
      </xsl:for-each>
    </ul>
    <p xsl:expand-text="yes">Stylesheet
    version {$properties?xslTNGversion} using
    DocBook version {$properties?docbookVersion} and DocBook Publishers
    version {$properties?publishersVersion}.</p>
    <p xsl:expand-text="yes">Tested with <a href="https://github.com/xspec/xspec/">XSpec</a>
    version {$properties?xspecVersion} (patched) using
    Saxon {system-property('xsl:product-name')} {system-property('xsl:product-version')}.
    </p>
  </details>
</xsl:template>

<xsl:template name="t:results">
  <xsl:param name="title" as="xs:string"/>
  <xsl:param name="uri" as="xs:string*"/>
  <xsl:param name="pass" as="xs:integer"/>
  <xsl:param name="fail" as="xs:integer"/>
  <xsl:param name="pending" as="xs:integer"/>
  <xsl:variable name="total" select="$pass + $fail + $pending"/>

  <span xsl:expand-text="yes">
    <xsl:choose>
      <xsl:when test="exists($uri)">
        <a href="{$uri}">
          <xsl:sequence select="$title"/>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$title"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>: passed {$pass}</xsl:text>
    <xsl:choose>
      <xsl:when test="$total = $pass">
        <xsl:text> tests (100%).</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$total != $pass"> of {$total}</xsl:if>
        <xsl:text> tests </xsl:text>
        <xsl:sequence
            select="'(' || format-number(100.0 * $pass div $total, '#0.00') || '%)'"/>
        <xsl:choose>
          <xsl:when test="$fail eq 0"/>
          <xsl:when test="$fail eq 1">; failed 1 test</xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="'; failed ' || $fail || ' tests'"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="$pending eq 0"/>
          <xsl:when test="$pending eq 1"> with 1 pending test</xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="' with ' || $pending || ' pending tests'"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text>.</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </span>
</xsl:template>

<xsl:template name="t:coverage">
  <!-- slightly dubious definitions to reuse paragraph formatting -->
  <xsl:variable name="total" select="$total-count"/>
  <xsl:variable name="pass" select="$tested-count"/>
  <xsl:variable name="pending" select="$total-count - $good-count"/>
  <xsl:variable name="fail" select="$total - $pass"/>

  <div xsl:expand-text="yes"
       class="coverage { if ($fail eq 0 and $pending eq 0)
                         then 'pass'
                         else if ($fail gt 0)
                              then 'fail'
                              else 'pending' }">
    <p>
      <a href="coverage-report.html">
        <xsl:text>Coverage</xsl:text>
      </a>
      <xsl:text>: {$pass}</xsl:text>
      <xsl:choose>
        <xsl:when test="$total = $pass">
          <xsl:text> elements (100%).</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="$total != $pass"> of {$total}</xsl:if>
          <xsl:text> elements </xsl:text>
          <xsl:sequence
              select="'(' || format-number(100.0 * $pass div $total, '#0.00') || '%)'"/>
          <xsl:choose>
            <xsl:when test="$fail eq 0"/>
            <xsl:when test="$fail eq 1">; missing 1 element</xsl:when>
            <xsl:otherwise>
              <xsl:sequence select="'; missing ' || $fail || ' elements'"/>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="$pending eq 0"/>
            <xsl:otherwise>
              <xsl:sequence select="' with ' || $pending || ' lacking good coverage'"/>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>.</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </p>
    <xsl:if test="$fail gt 0">
      <xsl:variable name="not-covered" as="element()*">
        <xsl:for-each select="$element-list//db:member">
          <xsl:variable name="member"
                        select="QName('http://docbook.org/ns/docbook',
                                      string(.))"/>
          <xsl:variable name="tests"
                        select="$all-contexts/*/x:context
                                   //*[node-name(.) = $member]"/>
          <xsl:if test="empty($tests)">
            <xsl:variable name="uri" as="xs:string">
              <xsl:choose>
                <xsl:when test="ancestor::db:section[1]/@xml:id='publishers'">
                  <xsl:sequence select="'https://tdg.docbook.org/tdg/publishers/5.2'"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:sequence select="'https://tdg.docbook.org/tdg/5.2'"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <a href="{$uri}/{.}">
              <xsl:sequence select="string(.)"/>
            </a>
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <details>
        <p>
          <xsl:text>Not covered: </xsl:text>
          <xsl:for-each select="$not-covered">
            <xsl:sort select="."/>
            <xsl:if test="position() gt 1">, </xsl:if>
            <xsl:sequence select="."/>
          </xsl:for-each>
          <xsl:text>.</xsl:text>
        </p>
      </details>
    </xsl:if>
  </div>
</xsl:template>

<xsl:function name="f:parse-properties">
  <xsl:param name="lines" as="xs:string*"/>
  <xsl:param name="props" as="map(*)"/>

  <xsl:variable name="car" select="$lines[1]"/>
  <xsl:variable name="cdr" select="subsequence($lines, 2)"/>

  <xsl:variable name="propregex" select="'^\s*(\c+)\s*=\s*[''&quot;](.*)[''&quot;]$'"/>

  <xsl:choose>
    <xsl:when test="empty($lines)">
      <xsl:sequence select="$props"/>
    </xsl:when>
    <xsl:when test="matches($car, $propregex)">
      <xsl:variable name="name" select="replace($car, $propregex, '$1')"/>
      <xsl:variable name="value" select="replace($car, $propregex, '$2')"/>
      <xsl:sequence select="f:parse-properties($cdr, map:put($props, $name, $value))"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="f:parse-properties($cdr, $props)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

</xsl:stylesheet>
