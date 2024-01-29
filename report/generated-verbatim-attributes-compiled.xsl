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
                 as="Q{http://www.w3.org/2001/XMLSchema}anyURI">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:variable>
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
            <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
            <xsl:attribute name="stylesheet" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec-xslt/xspec-driver.xsl</xsl:attribute>
            <xsl:attribute name="date" namespace="" select="current-dateTime()"/>
            <!-- invoke each compiled top-level x:scenario -->
            <xsl:for-each select="1 to 15">
               <xsl:choose>
                  <xsl:when test=". eq 1">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1"/>
                  </xsl:when>
                  <xsl:when test=". eq 2">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2"/>
                  </xsl:when>
                  <xsl:when test=". eq 3">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3"/>
                  </xsl:when>
                  <xsl:when test=". eq 4">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4"/>
                  </xsl:when>
                  <xsl:when test=". eq 5">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5"/>
                  </xsl:when>
                  <xsl:when test=". eq 6">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6"/>
                  </xsl:when>
                  <xsl:when test=". eq 7">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7"/>
                  </xsl:when>
                  <xsl:when test=". eq 8">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8"/>
                  </xsl:when>
                  <xsl:when test=". eq 9">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9"/>
                  </xsl:when>
                  <xsl:when test=". eq 10">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10"/>
                  </xsl:when>
                  <xsl:when test=". eq 11">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11"/>
                  </xsl:when>
                  <xsl:when test=". eq 12">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12"/>
                  </xsl:when>
                  <xsl:when test=". eq 13">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13"/>
                  </xsl:when>
                  <xsl:when test=". eq 14">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14"/>
                  </xsl:when>
                  <xsl:when test=". eq 15">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15"/>
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
      <xsl:message>When converting an address in the raw style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario1</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an address in the raw style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'raw'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'raw'</xsl:attribute>
               </xsl:element>
               <xsl:element name="address" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d2e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d67e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="address" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d2e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d67e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d67e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d67e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'raw'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'raw'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d67e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
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
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1-expect4">
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
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e9" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an address in the raw style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
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
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e9"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e10" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd2e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd2e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an address in the raw style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario1-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd2e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e10"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e11" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a address b c verbatim'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a address b c verbatim'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an address in the raw style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario1-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a address b c verbatim'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e11"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e12" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an address in the raw style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario1-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e12"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an literallayout in the raw style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario2</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an literallayout in the raw style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'raw'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'raw'</xsl:attribute>
               </xsl:element>
               <xsl:element name="literallayout" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d3e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d101e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="literallayout" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d3e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d101e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d101e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d101e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'raw'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'raw'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d101e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e19" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an literallayout in the raw style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario2-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e19"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e20" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd3e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd3e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an literallayout in the raw style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario2-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd3e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e20"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e21" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a b c literallayout verbatim'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a b c literallayout verbatim'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an literallayout in the raw style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario2-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a b c literallayout verbatim'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e21"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e22" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an literallayout in the raw style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario2-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e22"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an screen in the raw style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario3</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an screen in the raw style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'raw'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'raw'</xsl:attribute>
               </xsl:element>
               <xsl:element name="screen" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d4e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d135e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="screen" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d4e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d135e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d135e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d135e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'raw'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'raw'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d135e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e29" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an screen in the raw style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario3-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e29"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e30" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd4e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd4e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an screen in the raw style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario3-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd4e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e30"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e31" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a b c screen verbatim'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a b c screen verbatim'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an screen in the raw style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario3-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a b c screen verbatim'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e31"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e32" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an screen in the raw style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario3-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e32"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an synopsis in the raw style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario4</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an synopsis in the raw style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'raw'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'raw'</xsl:attribute>
               </xsl:element>
               <xsl:element name="synopsis" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d5e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d169e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="synopsis" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d5e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d169e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d169e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d169e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'raw'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'raw'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d169e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e39" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an synopsis in the raw style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario4-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e39"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e40" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd5e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd5e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an synopsis in the raw style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario4-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd5e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e40"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e41" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a b c synopsis verbatim'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a b c synopsis verbatim'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an synopsis in the raw style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario4-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a b c synopsis verbatim'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e41"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e42" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an synopsis in the raw style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario4-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e42"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an programlisting in the raw style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario5</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an programlisting in the raw style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'raw'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'raw'</xsl:attribute>
               </xsl:element>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d6e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d203e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d6e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d203e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d203e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d203e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'raw'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'raw'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d203e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e49" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an programlisting in the raw style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario5-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e49"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e50" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd6e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd6e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an programlisting in the raw style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario5-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd6e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e50"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e51" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a b c language-none numbered programlisting verbatim'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a b c language-none numbered programlisting verbatim'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an programlisting in the raw style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario5-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a b c language-none numbered programlisting verbatim'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e51"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e52" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an programlisting in the raw style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario5-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e52"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an address in the plain style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario6</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an address in the plain style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="address" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d7e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d237e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="address" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d7e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d237e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d237e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d237e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'plain'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d237e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e59" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an address in the plain style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario6-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e59"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e60" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd7e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd7e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an address in the plain style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario6-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd7e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e60"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e61" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a address b c verbatim'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a address b c verbatim'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an address in the plain style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario6-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a address b c verbatim'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e61"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e62" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an address in the plain style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario6-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e62"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an literallayout in the plain style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario7</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an literallayout in the plain style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="literallayout" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d8e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d271e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="literallayout" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d8e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d271e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d271e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d271e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'plain'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d271e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e69" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an literallayout in the plain style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario7-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e69"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e70" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd8e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd8e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an literallayout in the plain style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario7-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd8e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e70"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e71" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a b c literallayout verbatim'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a b c literallayout verbatim'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an literallayout in the plain style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario7-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a b c literallayout verbatim'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e71"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e72" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an literallayout in the plain style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario7-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e72"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an screen in the plain style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario8</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an screen in the plain style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="screen" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d9e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d305e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="screen" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d9e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d305e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d305e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d305e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'plain'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d305e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e79" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an screen in the plain style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario8-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e79"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e80" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd9e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd9e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an screen in the plain style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario8-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd9e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e80"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e81" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a b c screen verbatim'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a b c screen verbatim'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an screen in the plain style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario8-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a b c screen verbatim'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e81"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e82" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an screen in the plain style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario8-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e82"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an synopsis in the plain style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario9</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an synopsis in the plain style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="synopsis" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d10e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d339e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="synopsis" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d10e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d339e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d339e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d339e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'plain'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d339e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e89" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an synopsis in the plain style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario9-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e89"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e90" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd10e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd10e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an synopsis in the plain style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario9-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd10e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e90"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e91" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a b c synopsis verbatim'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a b c synopsis verbatim'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an synopsis in the plain style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario9-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a b c synopsis verbatim'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e91"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e92" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an synopsis in the plain style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario9-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e92"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an programlisting in the plain style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario10</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an programlisting in the plain style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d11e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d373e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d11e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d373e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d373e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d373e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'plain'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d373e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e99" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an programlisting in the plain style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario10-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e99"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e100" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd11e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd11e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an programlisting in the plain style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario10-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd11e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e100"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e101" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a b c language-none numbered programlisting verbatim'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a b c language-none numbered programlisting verbatim'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an programlisting in the plain style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario10-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a b c language-none numbered programlisting verbatim'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e101"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e102" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an programlisting in the plain style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario10-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e102"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an address in the lines style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario11</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an address in the lines style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'lines'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'lines'</xsl:attribute>
               </xsl:element>
               <xsl:element name="address" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d12e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d407e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="address" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d12e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d407e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d407e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d407e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'lines'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d407e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e110" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an address in the lines style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario11-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e110"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e111" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd12e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd12e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an address in the lines style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario11-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd12e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e111"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e112" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a address b c verbatim verblines'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a address b c verbatim verblines'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an address in the lines style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario11-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a address b c verbatim verblines'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e112"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e113" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an address in the lines style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario11-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e113"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an literallayout in the lines style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario12</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an literallayout in the lines style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'lines'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'lines'</xsl:attribute>
               </xsl:element>
               <xsl:element name="literallayout" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d13e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d441e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="literallayout" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d13e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d441e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d441e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d441e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'lines'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d441e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e120" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an literallayout in the lines style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario12-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e120"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e121" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd13e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd13e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an literallayout in the lines style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario12-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd13e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e121"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e122" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a b c literallayout verbatim verblines'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a b c literallayout verbatim verblines'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an literallayout in the lines style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario12-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a b c literallayout verbatim verblines'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e122"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e123" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an literallayout in the lines style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario12-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e123"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an screen in the lines style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario13</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an screen in the lines style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'lines'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'lines'</xsl:attribute>
               </xsl:element>
               <xsl:element name="screen" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d14e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d475e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="screen" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d14e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d475e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d475e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d475e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'lines'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d475e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e130" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an screen in the lines style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario13-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e130"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e131" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd14e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd14e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an screen in the lines style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario13-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd14e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e131"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e132" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a b c screen verbatim verblines'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a b c screen verbatim verblines'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an screen in the lines style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario13-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a b c screen verbatim verblines'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e132"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e133" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an screen in the lines style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario13-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e133"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an synopsis in the lines style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario14</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an synopsis in the lines style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'lines'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'lines'</xsl:attribute>
               </xsl:element>
               <xsl:element name="synopsis" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d15e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d509e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="synopsis" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d15e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d509e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d509e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d509e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'lines'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d509e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e140" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an synopsis in the lines style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario14-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e140"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e141" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd15e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd15e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an synopsis in the lines style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario14-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd15e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e141"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e142" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a b c synopsis verbatim verblines'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a b c synopsis verbatim verblines'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an synopsis in the lines style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario14-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a b c synopsis verbatim verblines'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e142"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e143" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an synopsis in the lines style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario14-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e143"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an programlisting in the lines style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario15</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/generated-verbatim-attributes.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an programlisting in the lines style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">verbatim-style-default</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'lines'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'lines'</xsl:attribute>
               </xsl:element>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d16e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d543e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:id"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="d16e0"/>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="role"
                                 namespace=""
                                 select="'', ''"
                                 separator="a b c b"/>
                  <xsl:text>...</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d543e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d543e0-doc ! ( * )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d543e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}verbatim-style-default"
                          select="'lines'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d543e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}verbatim-style-default"
                               select="$Q{}verbatim-style-default"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15-expect2">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15-expect3">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15-expect4">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return a single div element</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e150" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="count(/h:div) = 1"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="count(/h:div) = 1"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an programlisting in the lines style it should return a single div element'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario15-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return a single div element</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">count(/h:div) = 1</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e150"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15-expect2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e151" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@id = 'd16e0'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@id = 'd16e0'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an programlisting in the lines style it should return the xml:id in the id'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario15-expect2</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the xml:id in the id</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@id = 'd16e0'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e151"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15-expect3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e152" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="/h:div/h:pre/@class = 'a b c language-none numbered programlisting verbatim verblines'"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="/h:div/h:pre/@class = 'a b c language-none numbered programlisting verbatim verblines'"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an programlisting in the lines style it should return the roles as classes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario15-expect3</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should return the roles as classes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">/h:div/h:pre/@class = 'a b c language-none numbered programlisting verbatim verblines'</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e152"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15-expect4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d64e153" select="()"><!--expected result--></xsl:variable>
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
                  <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                                xmlns:m="http://docbook.org/ns/docbook/modes"
                                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
                                version="3"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence xmlns:h="http://www.w3.org/1999/xhtml"
                             xmlns:m="http://docbook.org/ns/docbook/modes"
                             xmlns:x="http://www.jenitennison.com/xslt/xspec"
                             select="empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))"
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
               <xsl:message terminate="yes">ERROR in x:expect ('When converting an programlisting in the lines style it should not return any other attributes'): Non-boolean @test must be accompanied by @as, @href, @select, or child node.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario15-expect4</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>it should not return any other attributes</xsl:text>
         </xsl:element>
         <xsl:element name="expect-test-wrap" namespace="">
            <xsl:element name="x:expect" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="test" namespace="">empty(/h:div/*/@* except (h:div/*/@id | h:div/*/@class))</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:if test="not($Q{urn:x-xspec:compile:impl}boolean-test)">
            <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
               <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}test-result"/>
               <xsl:with-param name="report-name" select="'result'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d64e153"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
</xsl:stylesheet>
