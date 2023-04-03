<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                 exclude-result-prefixes="#all"
                 version="3.0">
   <!-- the tested stylesheet -->
   <xsl:import href="file:/home/runner/work/xslTNG/xslTNG/build/xspec-xslt/xspec-driver.xsl"/>
   <!-- XSpec library modules providing tools -->
   <xsl:include href="file:/home/runner/work/xslTNG/xslTNG/build/xspec-2.2.4/src/common/runtime-utils.xsl"/>
   <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}stylesheet-uri"
                  as="Q{http://www.w3.org/2001/XMLSchema}anyURI">file:/home/runner/work/xslTNG/xslTNG/build/xspec-xslt/xspec-driver.xsl</xsl:variable>
   <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}xspec-uri"
                  as="Q{http://www.w3.org/2001/XMLSchema}anyURI">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/dates.xspec</xsl:variable>
   <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}is-external"
                  as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                  select="false()"/>
   <xsl:variable xmlns:xs="http://www.w3.org/2001/XMLSchema"
                  name="Q{urn:x-xspec:compile:impl}thread-aware"
                  as="xs:boolean"
                  select="(system-property('Q{http://www.w3.org/1999/XSL/Transform}product-name') eq 'SAXON') and starts-with(system-property('Q{http://www.w3.org/1999/XSL/Transform}product-version'), 'EE ')"
                  static="yes"/>
   <xsl:variable name="Q{urn:x-xspec:compile:impl}logical-processor-count"
                  as="Q{http://www.w3.org/2001/XMLSchema}integer"
                  use-when="$Q{urn:x-xspec:compile:impl}thread-aware"
                  select="Q{java:java.lang.Runtime}getRuntime() =&gt; Q{java:java.lang.Runtime}availableProcessors()"/>
   <xsl:variable name="Q{urn:x-xspec:compile:impl}thread-count"
                  as="Q{http://www.w3.org/2001/XMLSchema}integer"
                  select="1"
                  use-when="$Q{urn:x-xspec:compile:impl}thread-aware =&gt; not()"/>
   <!-- the main template to run the suite -->
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}main"
                  as="empty-sequence()">
      <xsl:context-item use="absent"/>
      <!-- info message -->
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('Q{http://www.w3.org/1999/XSL/Transform}product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('Q{http://www.w3.org/1999/XSL/Transform}product-version')"/>
      </xsl:message>
      <!-- set up the result document (the report) -->
      <xsl:result-document format="Q{{http://www.jenitennison.com/xslt/xspec}}xml-report-serialization-parameters">
         <xsl:element name="report" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/dates.xspec</xsl:attribute>
            <xsl:attribute name="stylesheet" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec-xslt/xspec-driver.xsl</xsl:attribute>
            <xsl:attribute name="date" namespace="" select="current-dateTime()"/>
            <!-- invoke each compiled top-level x:scenario -->
            <xsl:for-each select="1 to 1">
               <xsl:choose>
                  <xsl:when test=". eq 1">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:message terminate="yes">ERROR: Unhandled scenario invocation</xsl:message>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:for-each>
         </xsl:element>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming a french date with a custom format</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario1</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/dates.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming a french date with a custom format</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="db">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/resources/xml/dates.001.xml</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:attribute name="select" namespace="">//db:para[@xml:id='dtformat-fr']/db:date</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d54e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/xml/dates.001.xml')"/>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                        xmlns:db="http://docbook.org/ns/docbook"
                        xmlns:h="http://www.w3.org/1999/xhtml"
                        xmlns:m="http://docbook.org/ns/docbook/modes"
                        xmlns:x="http://www.jenitennison.com/xslt/xspec"
                        name="Q{urn:x-xspec:compile:impl}context-d54e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d54e0-doc ! ( //db:para[@xml:id='dtformat-fr']/db:date )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d54e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d54e0"
                                  mode="Q{http://docbook.org/ns/docbook/modes}docbook"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect the result to be in French (maybe)</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d52e4" select="()"><!--expected result--></xsl:variable>
      <!-- wrap $x:result into a document node if possible -->
      <xsl:variable name="Q{urn:x-xspec:compile:impl}test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($Q{http://www.jenitennison.com/xslt/xspec}result) and Q{http://www.jenitennison.com/xslt/xspec}wrappable-sequence($Q{http://www.jenitennison.com/xslt/xspec}result)">
               <xsl:sequence select="Q{http://www.jenitennison.com/xslt/xspec}wrap-nodes($Q{http://www.jenitennison.com/xslt/xspec}result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <!-- evaluate the predicate with $x:result (or its wrapper document node) as context item if it is a single item; if not, evaluate the predicate without context item -->
      <xsl:variable name="Q{urn:x-xspec:compile:impl}test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($Q{urn:x-xspec:compile:impl}test-items) eq 1">
               <xsl:for-each select="$Q{urn:x-xspec:compile:impl}test-items">
                  <xsl:sequence xmlns:db="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 select="(starts-with(system-property('xsl:product-version'), 'HE')                    and string(.) = '4:49p.m. / Friday, May 8, 2020')                   or (string(.) = '4:49p.m. / Vendredi, Mai 8, 2020') "
                                 version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:db="http://docbook.org/ns/docbook"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              select="(starts-with(system-property('xsl:product-version'), 'HE')                    and string(.) = '4:49p.m. / Friday, May 8, 2020')                   or (string(.) = '4:49p.m. / Vendredi, Mai 8, 2020') "
                              version="3"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}boolean-test"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="$Q{urn:x-xspec:compile:impl}test-result instance of Q{http://www.w3.org/2001/XMLSchema}boolean"/>
      <!-- did the test pass? -->
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean">
         <xsl:choose>
            <xsl:when test="$Q{urn:x-xspec:compile:impl}boolean-test">
               <xsl:sequence select="$Q{urn:x-xspec:compile:impl}test-result =&gt; boolean()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:message terminate="yes">ERROR in x:expect ('When transforming a french date with a custom format expect the result to be in French (maybe)'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario1-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect the result to be in French (maybe)</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="db">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">(starts-with(system-property('xsl:product-version'), 'HE')                    and string(.) = '4:49p.m. / Friday, May 8, 2020')                   or (string(.) = '4:49p.m. / Vendredi, Mai 8, 2020') </xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d52e4"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
</xsl:stylesheet>
