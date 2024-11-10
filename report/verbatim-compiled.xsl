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
                 as="Q{http://www.w3.org/2001/XMLSchema}anyURI">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:variable>
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
            <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
            <xsl:attribute name="stylesheet" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec-xslt/xspec-driver.xsl</xsl:attribute>
            <xsl:attribute name="date" namespace="" select="current-dateTime()"/>
            <!-- invoke each compiled top-level x:scenario -->
            <xsl:for-each select="1 to 24">
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
                  <xsl:when test=". eq 16">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario16"/>
                  </xsl:when>
                  <xsl:when test=". eq 17">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario17"/>
                  </xsl:when>
                  <xsl:when test=". eq 18">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario18"/>
                  </xsl:when>
                  <xsl:when test=". eq 19">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario19"/>
                  </xsl:when>
                  <xsl:when test=". eq 20">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario20"/>
                  </xsl:when>
                  <xsl:when test=". eq 21">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario21"/>
                  </xsl:when>
                  <xsl:when test=". eq 22">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario22"/>
                  </xsl:when>
                  <xsl:when test=". eq 23">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario23"/>
                  </xsl:when>
                  <xsl:when test=". eq 24">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario24"/>
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
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an address in the raw style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d76e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="address" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d76e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d76e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d76e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'raw'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d76e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e8-doc" as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap address-wrap"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="address verbatim"/>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e8"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e8-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e8, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario1-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e8"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a literallayout in the raw style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario2</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a literallayout in the raw style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d84e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="literallayout" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d84e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d84e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d84e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'raw'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d84e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e17-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap literallayout-wrap"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="literallayout verbatim"/>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e17"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e17-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e17, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario2-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e17"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a programlisting in the raw style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario3</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a programlisting in the raw style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d92e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d92e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d92e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d92e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'raw'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d92e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e26-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap programlisting-wrap"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-startinglinenumber"
                              namespace=""
                              select="'', ''"
                              separator="1"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-numberoflines"
                              namespace=""
                              select="'', ''"
                              separator="5"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="language-none long numbered programlisting verbatim"/>
                  <xsl:element name="code" namespace="http://www.w3.org/1999/xhtml">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e26"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e26-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e26, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario3-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e26"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a screen in the raw style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario4</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a screen in the raw style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d100e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="screen" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d100e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d100e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d100e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'raw'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d100e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e36-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap screen-wrap"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="screen verbatim"/>
                  <xsl:element name="code" namespace="http://www.w3.org/1999/xhtml">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e36"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e36-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e36, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario4-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e36"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a synopsis in the raw style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario5</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a synopsis in the raw style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d108e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="synopsis" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d108e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d108e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d108e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'raw'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d108e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e46-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap synopsis-wrap"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="synopsis verbatim"/>
                  <xsl:element name="code" namespace="http://www.w3.org/1999/xhtml">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e46"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e46-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e46, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario5-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e46"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a verbatim with inline markup in the raw style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario6</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a verbatim with inline markup in the raw style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line </xsl:text>
                  <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>two</xsl:text>
                  </xsl:element>
                  <xsl:text>
Line </xsl:text>
                  <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>end of three
start of four</xsl:text>
                  </xsl:element>
                  <xsl:text>
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d116e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line </xsl:text>
                  <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>two</xsl:text>
                  </xsl:element>
                  <xsl:text>
Line </xsl:text>
                  <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>end of three
start of four</xsl:text>
                  </xsl:element>
                  <xsl:text>
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d116e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d116e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d116e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'raw'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d116e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>the inline markup should be transformed.</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e62-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap programlisting-wrap"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-startinglinenumber"
                              namespace=""
                              select="'', ''"
                              separator="1"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-numberoflines"
                              namespace=""
                              select="'', ''"
                              separator="5"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="language-none long numbered programlisting verbatim"/>
                  <xsl:element name="code" namespace="http://www.w3.org/1999/xhtml">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>Line one
Line </xsl:text>
                     <xsl:element name="em" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>two</xsl:text>
                     </xsl:element>
                     <xsl:text>
Line </xsl:text>
                     <xsl:element name="em" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>end of three
start of four</xsl:text>
                     </xsl:element>
                     <xsl:text>
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e62"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e62-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e62, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario6-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>the inline markup should be transformed.</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e62"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an address in the plain style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario7</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an address in the plain style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d124e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="address" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d124e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d124e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d124e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d124e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e79-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap address-wrap"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="address verbatim"/>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e79"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e79-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e79, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario7-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e79"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a literallayout in the plain style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario8</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a literallayout in the plain style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d132e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="literallayout" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d132e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d132e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d132e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d132e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e88-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap literallayout-wrap"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="literallayout verbatim"/>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e88"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e88-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e88, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario8-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e88"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a programlisting in the plain style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario9</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a programlisting in the plain style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d140e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d140e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d140e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d140e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d140e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e97-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap programlisting-wrap"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-startinglinenumber"
                              namespace=""
                              select="'', ''"
                              separator="1"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-numberoflines"
                              namespace=""
                              select="'', ''"
                              separator="5"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="language-none long numbered programlisting verbatim"/>
                  <xsl:element name="code" namespace="http://www.w3.org/1999/xhtml">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e97"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e97-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e97, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario9-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e97"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a screen in the plain style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario10</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a screen in the plain style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d148e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="screen" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d148e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d148e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d148e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d148e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e108-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap screen-wrap"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="screen verbatim"/>
                  <xsl:element name="code" namespace="http://www.w3.org/1999/xhtml">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e108"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e108-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e108, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario10-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e108"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a synopsis in the plain style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario11</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a synopsis in the plain style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d156e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="synopsis" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d156e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d156e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d156e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d156e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e118-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap synopsis-wrap"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="synopsis verbatim"/>
                  <xsl:element name="code" namespace="http://www.w3.org/1999/xhtml">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e118"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e118-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e118, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario11-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e118"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a verbatim with inline markup in the plain style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario12</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a verbatim with inline markup in the plain style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">/*/*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="div" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:space"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="preserve"/>
                  <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>Line one
Line </xsl:text>
                     <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>two</xsl:text>
                     </xsl:element>
                     <xsl:text>
Line </xsl:text>
                     <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>end of three
start of four</xsl:text>
                     </xsl:element>
                     <xsl:text>
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d164e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="div" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:space"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="preserve"/>
                  <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>Line one
Line </xsl:text>
                     <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>two</xsl:text>
                     </xsl:element>
                     <xsl:text>
Line </xsl:text>
                     <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>end of three
start of four</xsl:text>
                     </xsl:element>
                     <xsl:text>
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d164e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d164e0-doc ! ( /*/* )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d164e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d164e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>the inline markup should be transformed.</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e136-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap programlisting-wrap"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-startinglinenumber"
                              namespace=""
                              select="'', ''"
                              separator="1"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-numberoflines"
                              namespace=""
                              select="'', ''"
                              separator="5"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="language-none long numbered programlisting verbatim"/>
                  <xsl:element name="code" namespace="http://www.w3.org/1999/xhtml">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>Line one
Line </xsl:text>
                     <xsl:element name="em" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>two</xsl:text>
                     </xsl:element>
                     <xsl:text>
Line </xsl:text>
                     <xsl:element name="em" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>end of three</xsl:text>
                     </xsl:element>
                     <xsl:text>
</xsl:text>
                     <xsl:element name="em" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>start of four</xsl:text>
                     </xsl:element>
                     <xsl:text>
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e136"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e136-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e136, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario12-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>the inline markup should be transformed.</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e136"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting an address in the lines style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario13</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting an address in the lines style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d172e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="address" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d172e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d172e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d172e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d172e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e156-doc"
                    as="document-node()"
                    select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/verbatim-xspec-001.xml')"/>
      <xsl:variable xmlns:h="http://www.w3.org/1999/xhtml"
                    xmlns:m="http://docbook.org/ns/docbook/modes"
                    xmlns:x="http://www.jenitennison.com/xslt/xspec"
                    name="Q{urn:x-xspec:compile:impl}expect-d73e156"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e156-doc ! ( /* )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e156, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario13-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e156"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a literallayout in the lines style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario14</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a literallayout in the lines style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d180e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="literallayout" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d180e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d180e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d180e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d180e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e162-doc"
                    as="document-node()"
                    select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/verbatim-xspec-002.xml')"/>
      <xsl:variable xmlns:h="http://www.w3.org/1999/xhtml"
                    xmlns:m="http://docbook.org/ns/docbook/modes"
                    xmlns:x="http://www.jenitennison.com/xslt/xspec"
                    name="Q{urn:x-xspec:compile:impl}expect-d73e162"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e162-doc ! ( /* )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e162, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario14-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e162"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a programlisting in the lines style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario15</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a programlisting in the lines style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d188e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d188e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d188e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d188e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d188e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e168-doc"
                    as="document-node()"
                    select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/verbatim-xspec-003.xml')"/>
      <xsl:variable xmlns:h="http://www.w3.org/1999/xhtml"
                    xmlns:m="http://docbook.org/ns/docbook/modes"
                    xmlns:x="http://www.jenitennison.com/xslt/xspec"
                    name="Q{urn:x-xspec:compile:impl}expect-d73e168"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e168-doc ! ( /* )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e168, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario15-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e168"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario16"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a screen in the lines style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario16</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a screen in the lines style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d196e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="screen" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d196e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d196e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d196e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d196e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario16-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario16-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e174-doc"
                    as="document-node()"
                    select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/verbatim-xspec-004.xml')"/>
      <xsl:variable xmlns:h="http://www.w3.org/1999/xhtml"
                    xmlns:m="http://docbook.org/ns/docbook/modes"
                    xmlns:x="http://www.jenitennison.com/xslt/xspec"
                    name="Q{urn:x-xspec:compile:impl}expect-d73e174"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e174-doc ! ( /* )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e174, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario16-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e174"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario17"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a synopsis in the lines style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario17</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a synopsis in the lines style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d204e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="synopsis" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d204e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d204e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d204e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d204e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario17-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario17-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e180-doc"
                    as="document-node()"
                    select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/verbatim-xspec-005.xml')"/>
      <xsl:variable xmlns="http://www.w3.org/1999/xhtml"
                    xmlns:h="http://www.w3.org/1999/xhtml"
                    xmlns:m="http://docbook.org/ns/docbook/modes"
                    xmlns:x="http://www.jenitennison.com/xslt/xspec"
                    name="Q{urn:x-xspec:compile:impl}expect-d73e180"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e180-doc ! ( /* )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e180, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario17-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>you should get all the lines</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e180"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario18"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a verbatim with inline markup in the lines style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario18</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a verbatim with inline markup in the lines style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line </xsl:text>
                  <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>two</xsl:text>
                  </xsl:element>
                  <xsl:text>
Line </xsl:text>
                  <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>end of three
Start of line</xsl:text>
                  </xsl:element>
                  <xsl:text> four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d212e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line </xsl:text>
                  <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>two</xsl:text>
                  </xsl:element>
                  <xsl:text>
Line </xsl:text>
                  <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:text>end of three
Start of line</xsl:text>
                  </xsl:element>
                  <xsl:text> four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d212e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d212e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d212e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d212e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario18-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario18-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>the inline markup should not cross line boundaries.</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e192-doc"
                    as="document-node()"
                    select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/verbatim-xspec-006.xml')"/>
      <xsl:variable xmlns:h="http://www.w3.org/1999/xhtml"
                    xmlns:m="http://docbook.org/ns/docbook/modes"
                    xmlns:x="http://www.jenitennison.com/xslt/xspec"
                    name="Q{urn:x-xspec:compile:impl}expect-d73e192"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e192-doc ! ( /* )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e192, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario18-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>the inline markup should not cross line boundaries.</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e192"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario19"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When converting a verbatim with inline markup in the lines style</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario19</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When converting a verbatim with inline markup in the lines style</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
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
                  <xsl:text>Line one
Line </xsl:text>
                  <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
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
                                    separator="two"/>
                     <xsl:text>two</xsl:text>
                  </xsl:element>
                  <xsl:text>
Line </xsl:text>
                  <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
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
                                    separator="three"/>
                     <xsl:text>end of three
Start of line</xsl:text>
                  </xsl:element>
                  <xsl:text> four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d220e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line </xsl:text>
                  <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
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
                                    separator="two"/>
                     <xsl:text>two</xsl:text>
                  </xsl:element>
                  <xsl:text>
Line </xsl:text>
                  <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
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
                                    separator="three"/>
                     <xsl:text>end of three
Start of line</xsl:text>
                  </xsl:element>
                  <xsl:text> four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d220e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d220e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d220e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d220e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
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
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario19-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario19-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>ID attributes should not be repeated.</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e204-doc"
                    as="document-node()"
                    select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/verbatim-xspec-007.xml')"/>
      <xsl:variable xmlns:h="http://www.w3.org/1999/xhtml"
                    xmlns:m="http://docbook.org/ns/docbook/modes"
                    xmlns:x="http://www.jenitennison.com/xslt/xspec"
                    name="Q{urn:x-xspec:compile:impl}expect-d73e204"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e204-doc ! ( /* )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e204, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario19-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>ID attributes should not be repeated.</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e204"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario20"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When callouts are added to a verbatim element</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario20</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When callouts are added to a verbatim element</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'lines'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">inject</xsl:attribute>
                  <xsl:attribute name="as" namespace="">element()</xsl:attribute>
                  <xsl:element name="areaspec" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="1 1"/>
                        <xsl:text>①</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="2 5"/>
                        <xsl:text>②</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="3 20"/>
                        <xsl:text>③</xsl:text>
                     </xsl:element>
                  </xsl:element>
               </xsl:element>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d228e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d228e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d228e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d228e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:variable name="Q{urn:x-xspec:compile:impl}param-d228e2-doc" as="document-node()">
               <xsl:document>
                  <xsl:element name="areaspec" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="1 1"/>
                        <xsl:text>①</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="2 5"/>
                        <xsl:text>②</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="3 20"/>
                        <xsl:text>③</xsl:text>
                     </xsl:element>
                  </xsl:element>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}inject"
                          as="element()"
                          select="$Q{urn:x-xspec:compile:impl}param-d228e2-doc ! ( node() )"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d228e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}inject"
                               select="$Q{}inject"
                               as="element()"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario20-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario20-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>they should appear in the output</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e219-doc"
                    as="document-node()"
                    select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/verbatim-xspec-008.xml')"/>
      <xsl:variable xmlns:h="http://www.w3.org/1999/xhtml"
                    xmlns:m="http://docbook.org/ns/docbook/modes"
                    xmlns:x="http://www.jenitennison.com/xslt/xspec"
                    name="Q{urn:x-xspec:compile:impl}expect-d73e219"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e219-doc ! ( /* )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e219, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario20-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>they should appear in the output</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e219"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario21"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When callouts are added to a verbatim element</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario21</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When callouts are added to a verbatim element</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'lines'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">inject</xsl:attribute>
                  <xsl:attribute name="as" namespace="">element()</xsl:attribute>
                  <xsl:element name="areaspec" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="1 1"/>
                        <xsl:text>①</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="2 5"/>
                        <xsl:text>②</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="8 8"/>
                        <xsl:text>③</xsl:text>
                     </xsl:element>
                  </xsl:element>
               </xsl:element>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d236e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d236e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d236e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d236e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'lines'"/>
            <xsl:variable name="Q{urn:x-xspec:compile:impl}param-d236e2-doc" as="document-node()">
               <xsl:document>
                  <xsl:element name="areaspec" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="1 1"/>
                        <xsl:text>①</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="2 5"/>
                        <xsl:text>②</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="8 8"/>
                        <xsl:text>③</xsl:text>
                     </xsl:element>
                  </xsl:element>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}inject"
                          as="element()"
                          select="$Q{urn:x-xspec:compile:impl}param-d236e2-doc ! ( node() )"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d236e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}inject"
                               select="$Q{}inject"
                               as="element()"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario21-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario21-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>they can extend the listing</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e233-doc"
                    as="document-node()"
                    select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/verbatim-xspec-009.xml')"/>
      <xsl:variable xmlns:h="http://www.w3.org/1999/xhtml"
                    xmlns:m="http://docbook.org/ns/docbook/modes"
                    xmlns:x="http://www.jenitennison.com/xslt/xspec"
                    name="Q{urn:x-xspec:compile:impl}expect-d73e233"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e233-doc ! ( /* )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e233, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario21-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>they can extend the listing</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e233"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario22"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When callouts are added to a verbatim element</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario22</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When callouts are added to a verbatim element</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">inject</xsl:attribute>
                  <xsl:attribute name="as" namespace="">element()</xsl:attribute>
                  <xsl:element name="areaspec" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="1 1"/>
                        <xsl:text>①</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="2 5"/>
                        <xsl:text>②</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="3 20"/>
                        <xsl:text>③</xsl:text>
                     </xsl:element>
                  </xsl:element>
               </xsl:element>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d244e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d244e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d244e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d244e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:variable name="Q{urn:x-xspec:compile:impl}param-d244e2-doc" as="document-node()">
               <xsl:document>
                  <xsl:element name="areaspec" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="1 1"/>
                        <xsl:text>①</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="2 5"/>
                        <xsl:text>②</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="3 20"/>
                        <xsl:text>③</xsl:text>
                     </xsl:element>
                  </xsl:element>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}inject"
                          as="element()"
                          select="$Q{urn:x-xspec:compile:impl}param-d244e2-doc ! ( node() )"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d244e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}inject"
                               select="$Q{}inject"
                               as="element()"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario22-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario22-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>plain mode also works</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e247-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap programlisting-wrap"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-startinglinenumber"
                              namespace=""
                              select="'', ''"
                              separator="1"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-numberoflines"
                              namespace=""
                              select="'', ''"
                              separator="5"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="language-none long numbered programlisting verbatim"/>
                  <xsl:element name="code" namespace="http://www.w3.org/1999/xhtml">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="id"
                                       namespace=""
                                       select="'', ''"
                                       separator="R_area1"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="class"
                                       namespace=""
                                       select="'', ''"
                                       separator="callout-bug linecolumn"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-line"
                                       namespace=""
                                       select="'', ''"
                                       separator="1"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-column"
                                       namespace=""
                                       select="'', ''"
                                       separator="1"/>
                        <xsl:text>①</xsl:text>
                     </xsl:element>
                     <xsl:text>Line one
Line</xsl:text>
                     <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="id"
                                       namespace=""
                                       select="'', ''"
                                       separator="R_area2"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="class"
                                       namespace=""
                                       select="'', ''"
                                       separator="callout-bug linecolumn"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-line"
                                       namespace=""
                                       select="'', ''"
                                       separator="2"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-column"
                                       namespace=""
                                       select="'', ''"
                                       separator="5"/>
                        <xsl:text>②</xsl:text>
                     </xsl:element>
                     <xsl:text> two
Line three         </xsl:text>
                     <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="id"
                                       namespace=""
                                       select="'', ''"
                                       separator="R_area3"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="class"
                                       namespace=""
                                       select="'', ''"
                                       separator="callout-bug linecolumn"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-line"
                                       namespace=""
                                       select="'', ''"
                                       separator="3"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-column"
                                       namespace=""
                                       select="'', ''"
                                       separator="20"/>
                        <xsl:text>③</xsl:text>
                     </xsl:element>
                     <xsl:text>
Line four
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e247"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e247-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e247, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario22-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>plain mode also works</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e247"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario23"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When callouts are added to a verbatim element</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario23</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When callouts are added to a verbatim element</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">inject</xsl:attribute>
                  <xsl:attribute name="as" namespace="">element()</xsl:attribute>
                  <xsl:element name="areaspec" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="1 1"/>
                        <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                           <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                           <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                           <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                           <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                          xmlns:h="http://www.w3.org/1999/xhtml"
                                          xmlns:m="http://docbook.org/ns/docbook/modes"
                                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                          name="name"
                                          namespace=""
                                          select="'', ''"
                                          separator="one"/>
                           <xsl:text>①</xsl:text>
                        </xsl:element>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="2 5"/>
                        <xsl:element name="span" namespace="http://www.w3.org/1999/xhtml">
                           <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                           <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                           <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                           <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                          xmlns:h="http://www.w3.org/1999/xhtml"
                                          xmlns:m="http://docbook.org/ns/docbook/modes"
                                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                          name="id"
                                          namespace=""
                                          select="'', ''"
                                          separator="two"/>
                           <xsl:text>②</xsl:text>
                        </xsl:element>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="3 20"/>
                        <xsl:element name="span" namespace="http://www.w3.org/1999/xhtml">
                           <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                           <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                           <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                           <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                          xmlns:h="http://www.w3.org/1999/xhtml"
                                          xmlns:m="http://docbook.org/ns/docbook/modes"
                                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                          name="id"
                                          namespace=""
                                          select="'', ''"
                                          separator="three"/>
                           <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                          xmlns:h="http://www.w3.org/1999/xhtml"
                                          xmlns:m="http://docbook.org/ns/docbook/modes"
                                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                          name="class"
                                          namespace=""
                                          select="'', ''"
                                          separator="callout"/>
                           <xsl:text>③</xsl:text>
                        </xsl:element>
                     </xsl:element>
                  </xsl:element>
               </xsl:element>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d252e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d252e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d252e0-doc ! ( node() )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d252e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:variable name="Q{urn:x-xspec:compile:impl}param-d252e2-doc" as="document-node()">
               <xsl:document>
                  <xsl:element name="areaspec" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="1 1"/>
                        <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                           <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                           <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                           <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                           <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                          xmlns:h="http://www.w3.org/1999/xhtml"
                                          xmlns:m="http://docbook.org/ns/docbook/modes"
                                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                          name="name"
                                          namespace=""
                                          select="'', ''"
                                          separator="one"/>
                           <xsl:text>①</xsl:text>
                        </xsl:element>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="2 5"/>
                        <xsl:element name="span" namespace="http://www.w3.org/1999/xhtml">
                           <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                           <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                           <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                           <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                          xmlns:h="http://www.w3.org/1999/xhtml"
                                          xmlns:m="http://docbook.org/ns/docbook/modes"
                                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                          name="id"
                                          namespace=""
                                          select="'', ''"
                                          separator="two"/>
                           <xsl:text>②</xsl:text>
                        </xsl:element>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="3 20"/>
                        <xsl:element name="span" namespace="http://www.w3.org/1999/xhtml">
                           <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                           <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                           <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                           <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                          xmlns:h="http://www.w3.org/1999/xhtml"
                                          xmlns:m="http://docbook.org/ns/docbook/modes"
                                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                          name="id"
                                          namespace=""
                                          select="'', ''"
                                          separator="three"/>
                           <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                          xmlns:h="http://www.w3.org/1999/xhtml"
                                          xmlns:m="http://docbook.org/ns/docbook/modes"
                                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                          name="class"
                                          namespace=""
                                          select="'', ''"
                                          separator="callout"/>
                           <xsl:text>③</xsl:text>
                        </xsl:element>
                     </xsl:element>
                  </xsl:element>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}inject"
                          as="element()"
                          select="$Q{urn:x-xspec:compile:impl}param-d252e2-doc ! ( node() )"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d252e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}inject"
                               select="$Q{}inject"
                               as="element()"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario23-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario23-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>markup can also be inserted</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e276-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap programlisting-wrap"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-startinglinenumber"
                              namespace=""
                              select="'', ''"
                              separator="1"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-numberoflines"
                              namespace=""
                              select="'', ''"
                              separator="5"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="language-none long numbered programlisting verbatim"/>
                  <xsl:element name="code" namespace="http://www.w3.org/1999/xhtml">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="id"
                                       namespace=""
                                       select="'', ''"
                                       separator="R_area1"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="class"
                                       namespace=""
                                       select="'', ''"
                                       separator="callout-bug linecolumn"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-line"
                                       namespace=""
                                       select="'', ''"
                                       separator="1"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-column"
                                       namespace=""
                                       select="'', ''"
                                       separator="1"/>
                        <xsl:text>①</xsl:text>
                     </xsl:element>
                     <xsl:text>Line one
Line</xsl:text>
                     <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="id"
                                       namespace=""
                                       select="'', ''"
                                       separator="R_area2"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="class"
                                       namespace=""
                                       select="'', ''"
                                       separator="callout-bug linecolumn"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-line"
                                       namespace=""
                                       select="'', ''"
                                       separator="2"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-column"
                                       namespace=""
                                       select="'', ''"
                                       separator="5"/>
                        <xsl:text>②</xsl:text>
                     </xsl:element>
                     <xsl:text> two
Line three         </xsl:text>
                     <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="id"
                                       namespace=""
                                       select="'', ''"
                                       separator="R_area3"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="class"
                                       namespace=""
                                       select="'', ''"
                                       separator="callout-bug linecolumn"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-line"
                                       namespace=""
                                       select="'', ''"
                                       separator="3"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-column"
                                       namespace=""
                                       select="'', ''"
                                       separator="20"/>
                        <xsl:text>③</xsl:text>
                     </xsl:element>
                     <xsl:text>
Line four
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e276"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e276-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e276, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario23-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>markup can also be inserted</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e276"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario24"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When callouts are inserted into markup</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario24</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/src/test/xspec/verbatim.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When callouts are inserted into markup</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:attribute name="select" namespace="">/*/*</xsl:attribute>
               <xsl:attribute name="mode" namespace="">m:docbook</xsl:attribute>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">style</xsl:attribute>
                  <xsl:attribute name="select" namespace="">'plain'</xsl:attribute>
               </xsl:element>
               <xsl:element name="x:param" namespace="http://www.jenitennison.com/xslt/xspec">
                  <xsl:namespace name="">http://docbook.org/ns/docbook</xsl:namespace>
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:attribute name="name" namespace="">inject</xsl:attribute>
                  <xsl:attribute name="as" namespace="">element()</xsl:attribute>
                  <xsl:element name="areaspec" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="1 1"/>
                        <xsl:text>①</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="2 5"/>
                        <xsl:text>②</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="3 20"/>
                        <xsl:text>③</xsl:text>
                     </xsl:element>
                  </xsl:element>
               </xsl:element>
               <xsl:element name="div" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:space"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="preserve"/>
                  <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>Line one</xsl:text>
                     </xsl:element>
                     <xsl:text>
</xsl:text>
                     <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>Line two
Line three
Line four</xsl:text>
                     </xsl:element>
                     <xsl:text>
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d260e0-doc"
                       as="document-node()">
            <xsl:document>
               <xsl:element name="div" namespace="http://docbook.org/ns/docbook">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="xml:space"
                                 namespace="http://www.w3.org/XML/1998/namespace"
                                 select="'', ''"
                                 separator="preserve"/>
                  <xsl:element name="programlisting" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>Line one</xsl:text>
                     </xsl:element>
                     <xsl:text>
</xsl:text>
                     <xsl:element name="emphasis" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>Line two
Line three
Line four</xsl:text>
                     </xsl:element>
                     <xsl:text>
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:document>
         </xsl:variable>
         <xsl:variable xmlns="http://docbook.org/ns/docbook"
                       xmlns:h="http://www.w3.org/1999/xhtml"
                       xmlns:m="http://docbook.org/ns/docbook/modes"
                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                       name="Q{urn:x-xspec:compile:impl}context-d260e0"
                       select="$Q{urn:x-xspec:compile:impl}context-d260e0-doc ! ( /*/* )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                       as="item()*"
                       select="$Q{urn:x-xspec:compile:impl}context-d260e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}style"
                          select="'plain'"/>
            <xsl:variable name="Q{urn:x-xspec:compile:impl}param-d260e2-doc" as="document-node()">
               <xsl:document>
                  <xsl:element name="areaspec" namespace="http://docbook.org/ns/docbook">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="1 1"/>
                        <xsl:text>①</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="2 5"/>
                        <xsl:text>②</xsl:text>
                     </xsl:element>
                     <xsl:element name="area" namespace="http://docbook.org/ns/docbook">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://docbook.org/ns/docbook"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="coords"
                                       namespace=""
                                       select="'', ''"
                                       separator="3 20"/>
                        <xsl:text>③</xsl:text>
                     </xsl:element>
                  </xsl:element>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          xmlns:h="http://www.w3.org/1999/xhtml"
                          xmlns:m="http://docbook.org/ns/docbook/modes"
                          xmlns:x="http://www.jenitennison.com/xslt/xspec"
                          name="Q{}inject"
                          as="element()"
                          select="$Q{urn:x-xspec:compile:impl}param-d260e2-doc ! ( node() )"/>
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d260e0"
                                 mode="Q{http://docbook.org/ns/docbook/modes}docbook">
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}style"
                               select="$Q{}style"/>
               <xsl:with-param xmlns="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               xmlns:x="http://www.jenitennison.com/xslt/xspec"
                               name="Q{}inject"
                               select="$Q{}inject"
                               as="element()"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario24-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                            select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario24-expect1"
                 as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                 as="item()*"
                 required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                 as="item()*"
                 required="yes"/>
      <xsl:message>they interrupt that markup</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e309-doc"
                    as="document-node()">
         <xsl:document>
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
               <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
               <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
               <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="class"
                              namespace=""
                              select="'', ''"
                              separator="pre-wrap programlisting-wrap"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-startinglinenumber"
                              namespace=""
                              select="'', ''"
                              separator="1"/>
               <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns:m="http://docbook.org/ns/docbook/modes"
                              xmlns:x="http://www.jenitennison.com/xslt/xspec"
                              name="db-numberoflines"
                              namespace=""
                              select="'', ''"
                              separator="5"/>
               <xsl:element name="pre" namespace="http://www.w3.org/1999/xhtml">
                  <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                  <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                  <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                  <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                 xmlns:h="http://www.w3.org/1999/xhtml"
                                 xmlns:m="http://docbook.org/ns/docbook/modes"
                                 xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                 name="class"
                                 namespace=""
                                 select="'', ''"
                                 separator="language-none long numbered programlisting verbatim"/>
                  <xsl:element name="code" namespace="http://www.w3.org/1999/xhtml">
                     <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                     <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                     <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                     <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="id"
                                       namespace=""
                                       select="'', ''"
                                       separator="R_area1"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="class"
                                       namespace=""
                                       select="'', ''"
                                       separator="callout-bug linecolumn"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-line"
                                       namespace=""
                                       select="'', ''"
                                       separator="1"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-column"
                                       namespace=""
                                       select="'', ''"
                                       separator="1"/>
                        <xsl:text>①</xsl:text>
                     </xsl:element>
                     <xsl:element name="em" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>Line one</xsl:text>
                     </xsl:element>
                     <xsl:text>
</xsl:text>
                     <xsl:element name="em" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>Line</xsl:text>
                     </xsl:element>
                     <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="id"
                                       namespace=""
                                       select="'', ''"
                                       separator="R_area2"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="class"
                                       namespace=""
                                       select="'', ''"
                                       separator="callout-bug linecolumn"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-line"
                                       namespace=""
                                       select="'', ''"
                                       separator="2"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-column"
                                       namespace=""
                                       select="'', ''"
                                       separator="5"/>
                        <xsl:text>②</xsl:text>
                     </xsl:element>
                     <xsl:element name="em" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text> two</xsl:text>
                     </xsl:element>
                     <xsl:text>
</xsl:text>
                     <xsl:element name="em" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>Line three</xsl:text>
                     </xsl:element>
                     <xsl:text>         </xsl:text>
                     <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="id"
                                       namespace=""
                                       select="'', ''"
                                       separator="R_area3"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="class"
                                       namespace=""
                                       select="'', ''"
                                       separator="callout-bug linecolumn"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-line"
                                       namespace=""
                                       select="'', ''"
                                       separator="3"/>
                        <xsl:attribute xmlns="http://www.w3.org/1999/xhtml"
                                       xmlns:h="http://www.w3.org/1999/xhtml"
                                       xmlns:m="http://docbook.org/ns/docbook/modes"
                                       xmlns:x="http://www.jenitennison.com/xslt/xspec"
                                       name="db-column"
                                       namespace=""
                                       select="'', ''"
                                       separator="20"/>
                        <xsl:text>③</xsl:text>
                     </xsl:element>
                     <xsl:text>
</xsl:text>
                     <xsl:element name="em" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:namespace name="h">http://www.w3.org/1999/xhtml</xsl:namespace>
                        <xsl:namespace name="m">http://docbook.org/ns/docbook/modes</xsl:namespace>
                        <xsl:namespace name="x">http://www.jenitennison.com/xslt/xspec</xsl:namespace>
                        <xsl:text>Line four</xsl:text>
                     </xsl:element>
                     <xsl:text>
Line five</xsl:text>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d73e309"
                    select="$Q{urn:x-xspec:compile:impl}expect-d73e309-doc ! ( node() )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                    as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                    select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d73e309, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario24-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                        namespace=""
                        select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>they interrupt that markup</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d73e309"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
</xsl:stylesheet>
