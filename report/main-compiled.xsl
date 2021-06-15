<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:impl="urn:x-xspec:compile:xslt:impl"
                xmlns:test="http://www.jenitennison.com/xslt/unit-test"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="impl">
   <xsl:import href="file:/home/circleci/repo/build/xslt/xspec-driver.xsl"/>
   <xsl:import href="file:/home/circleci/repo/build/xspec-1.6.0/src/compiler/generate-tests-utils.xsl"/>
   <xsl:include href="file:/home/circleci/repo/build/xspec-1.6.0/src/common/xspec-utils.xsl"/>
   <xsl:output name="x:report" method="xml" indent="yes"/>
   <xsl:variable name="x:xspec-uri" as="xs:anyURI">file:/home/circleci/repo/build/xspec/main.xspec</xsl:variable>
   <xsl:template name="x:main">
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('xsl:product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('xsl:product-version')"/>
      </xsl:message>
      <xsl:result-document format="x:report">
         <x:report stylesheet="file:/home/circleci/repo/build/xslt/xspec-driver.xsl"
                   date="{current-dateTime()}"
                   xspec="file:/home/circleci/repo/build/xspec/main.xspec">
            <xsl:call-template xmlns:db="http://docbook.org/ns/docbook"
                               xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                               name="x:scenario1"/>
            <xsl:call-template xmlns:db="http://docbook.org/ns/docbook"
                               xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                               name="x:scenario2"/>
            <xsl:call-template xmlns:db="http://docbook.org/ns/docbook"
                               xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                               name="x:scenario3"/>
            <xsl:call-template xmlns:db="http://docbook.org/ns/docbook"
                               xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                               name="x:scenario4"/>
            <xsl:call-template xmlns:db="http://docbook.org/ns/docbook"
                               xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                               name="x:scenario5"/>
            <xsl:call-template xmlns:db="http://docbook.org/ns/docbook"
                               xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                               name="x:scenario6"/>
            <xsl:call-template xmlns:db="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario7"/>
            <xsl:call-template xmlns:db="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario8"/>
            <xsl:call-template xmlns:db="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario9"/>
            <xsl:call-template xmlns:db="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario10"/>
            <xsl:call-template xmlns:db="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario11"/>
            <xsl:call-template xmlns:db="http://docbook.org/ns/docbook"
                               xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario12"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario13"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario14"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario15"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario16"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario17"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario18"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario19"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario20"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario21"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario22"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario23"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario24"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario25"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario26"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario27"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario28"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario29"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario30"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario31"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario32"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario33"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario34"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario35"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario36"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario37"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario38"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario39"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario40"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario41"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario42"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario43"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario44"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario45"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario46"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario47"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario48"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario49"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario50"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario51"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario52"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario53"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario54"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario55"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario56"/>
            <xsl:call-template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario57"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario58"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario59"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario60"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario61"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario62"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario63"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario64"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario65"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario66"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario67"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario68"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario69"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario70"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario71"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario72"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario73"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario74"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario75"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario76"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario77"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario78"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario79"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario80"/>
            <xsl:call-template xmlns:h="http://www.w3.org/1999/xhtml"
                               xmlns:m="http://docbook.org/ns/docbook/modes"
                               name="x:scenario81"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                 name="x:scenario1">
      <xsl:message>when formatting a single copyright year</xsl:message>
      <x:scenario id="scenario1"
                  xspec="file:/home/circleci/repo/build/xspec/copyright.xspec">
         <x:label>when formatting a single copyright year</x:label>
         <x:call>
            <xsl:attribute name="function">fp:collapse-years</xsl:attribute>
            <x:param>
               <xsl:attribute name="as">element()+</xsl:attribute>
               <db:year>
                  <xsl:text>1999</xsl:text>
               </db:year>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d16e1-doc" as="document-node()">
               <xsl:document>
                  <db:year>
                     <xsl:text>1999</xsl:text>
                  </db:year>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:param-d16e1" as="element()+">
               <xsl:for-each select="$impl:param-d16e1-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:sequence select="fp:collapse-years($impl:param-d16e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario1-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                 name="x:scenario1-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>a single year</xsl:message>
      <xsl:variable name="impl:expect-d15e18-doc" as="document-node()">
         <xsl:document>
            <span>
               <xsl:attribute name="class" select="'', ''" separator="copyright-years"/>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>1999</xsl:text>
               </span>
            </span>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e18" as="item()*">
         <xsl:for-each select="$impl:expect-d15e18-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e18, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario1-expect1" successful="{$impl:successful}">
         <x:label>a single year</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e18"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                 name="x:scenario2">
      <xsl:message>when formatting a single copyright year range</xsl:message>
      <x:scenario id="scenario2"
                  xspec="file:/home/circleci/repo/build/xspec/copyright.xspec">
         <x:label>when formatting a single copyright year range</x:label>
         <x:call>
            <xsl:attribute name="function">fp:collapse-years</xsl:attribute>
            <x:param>
               <xsl:attribute name="as">element()+</xsl:attribute>
               <db:year>
                  <xsl:text>1999</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2000</xsl:text>
               </db:year>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d22e1-doc" as="document-node()">
               <xsl:document>
                  <db:year>
                     <xsl:text>1999</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2000</xsl:text>
                  </db:year>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:param-d22e1" as="element()+">
               <xsl:for-each select="$impl:param-d22e1-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:sequence select="fp:collapse-years($impl:param-d22e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario2-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                 name="x:scenario2-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>a single range</xsl:message>
      <xsl:variable name="impl:expect-d15e33-doc" as="document-node()">
         <xsl:document>
            <span>
               <xsl:attribute name="class" select="'', ''" separator="copyright-years"/>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>1999</xsl:text>
               </span>
               <xsl:text>–</xsl:text>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2000</xsl:text>
               </span>
            </span>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e33" as="item()*">
         <xsl:for-each select="$impl:expect-d15e33-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e33, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario2-expect1" successful="{$impl:successful}">
         <x:label>a single range</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e33"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                 name="x:scenario3">
      <xsl:message>when formatting a year range and a non-range year</xsl:message>
      <x:scenario id="scenario3"
                  xspec="file:/home/circleci/repo/build/xspec/copyright.xspec">
         <x:label>when formatting a year range and a non-range year</x:label>
         <x:call>
            <xsl:attribute name="function">fp:collapse-years</xsl:attribute>
            <x:param>
               <xsl:attribute name="as">element()+</xsl:attribute>
               <db:year>
                  <xsl:text>1999</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2000</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2020</xsl:text>
               </db:year>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d28e1-doc" as="document-node()">
               <xsl:document>
                  <db:year>
                     <xsl:text>1999</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2000</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2020</xsl:text>
                  </db:year>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:param-d28e1" as="element()+">
               <xsl:for-each select="$impl:param-d28e1-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:sequence select="fp:collapse-years($impl:param-d28e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario3-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                 name="x:scenario3-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>a range and a year</xsl:message>
      <xsl:variable name="impl:expect-d15e55-doc" as="document-node()">
         <xsl:document>
            <span>
               <xsl:attribute name="class" select="'', ''" separator="copyright-years"/>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>1999</xsl:text>
               </span>
               <xsl:text>–</xsl:text>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2000</xsl:text>
               </span>
               <xsl:text>, </xsl:text>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2020</xsl:text>
               </span>
            </span>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e55" as="item()*">
         <xsl:for-each select="$impl:expect-d15e55-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e55, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario3-expect1" successful="{$impl:successful}">
         <x:label>a range and a year</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e55"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                 name="x:scenario4">
      <xsl:message>when formatting two ranges</xsl:message>
      <x:scenario id="scenario4"
                  xspec="file:/home/circleci/repo/build/xspec/copyright.xspec">
         <x:label>when formatting two ranges</x:label>
         <x:call>
            <xsl:attribute name="function">fp:collapse-years</xsl:attribute>
            <x:param>
               <xsl:attribute name="as">element()+</xsl:attribute>
               <db:year>
                  <xsl:text>1999</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2000</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2001</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2002</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2015</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2016</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2017</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2018</xsl:text>
               </db:year>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d34e1-doc" as="document-node()">
               <xsl:document>
                  <db:year>
                     <xsl:text>1999</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2000</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2001</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2002</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2015</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2016</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2017</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2018</xsl:text>
                  </db:year>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:param-d34e1" as="element()+">
               <xsl:for-each select="$impl:param-d34e1-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:sequence select="fp:collapse-years($impl:param-d34e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario4-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                 name="x:scenario4-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>two ranges</xsl:message>
      <xsl:variable name="impl:expect-d15e97-doc" as="document-node()">
         <xsl:document>
            <span>
               <xsl:attribute name="class" select="'', ''" separator="copyright-years"/>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>1999</xsl:text>
               </span>
               <xsl:text>–</xsl:text>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2002</xsl:text>
               </span>
               <xsl:text>, </xsl:text>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2015</xsl:text>
               </span>
               <xsl:text>–</xsl:text>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2018</xsl:text>
               </span>
            </span>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e97" as="item()*">
         <xsl:for-each select="$impl:expect-d15e97-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e97, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario4-expect1" successful="{$impl:successful}">
         <x:label>two ranges</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e97"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                 name="x:scenario5">
      <xsl:message>a range interrupted</xsl:message>
      <x:scenario id="scenario5"
                  xspec="file:/home/circleci/repo/build/xspec/copyright.xspec">
         <x:label>a range interrupted</x:label>
         <x:call>
            <xsl:attribute name="function">fp:collapse-years</xsl:attribute>
            <x:param>
               <xsl:attribute name="as">element()+</xsl:attribute>
               <db:year>
                  <xsl:text>2000</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2001</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2002</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2003</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2004</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2006</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2007</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2008</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2009</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2010</xsl:text>
               </db:year>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d40e1-doc" as="document-node()">
               <xsl:document>
                  <db:year>
                     <xsl:text>2000</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2001</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2002</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2003</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2004</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2006</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2007</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2008</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2009</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2010</xsl:text>
                  </db:year>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:param-d40e1" as="element()+">
               <xsl:for-each select="$impl:param-d40e1-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:sequence select="fp:collapse-years($impl:param-d40e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario5-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                 name="x:scenario5-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>two ranges</xsl:message>
      <xsl:variable name="impl:expect-d15e150-doc" as="document-node()">
         <xsl:document>
            <span>
               <xsl:attribute name="class" select="'', ''" separator="copyright-years"/>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2000</xsl:text>
               </span>
               <xsl:text>–</xsl:text>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2004</xsl:text>
               </span>
               <xsl:text>, </xsl:text>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2006</xsl:text>
               </span>
               <xsl:text>–</xsl:text>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2010</xsl:text>
               </span>
            </span>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e150" as="item()*">
         <xsl:for-each select="$impl:expect-d15e150-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e150, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario5-expect1" successful="{$impl:successful}">
         <x:label>two ranges</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e150"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                 name="x:scenario6">
      <xsl:message>a range interrupted by a non-numeric year</xsl:message>
      <x:scenario id="scenario6"
                  xspec="file:/home/circleci/repo/build/xspec/copyright.xspec">
         <x:label>a range interrupted by a non-numeric year</x:label>
         <x:call>
            <xsl:attribute name="function">fp:collapse-years</xsl:attribute>
            <x:param>
               <xsl:attribute name="as">element()+</xsl:attribute>
               <db:year>
                  <xsl:text>2000</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2001</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2002</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2003</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2004</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>Spoon!</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2006</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2007</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2008</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2009</xsl:text>
               </db:year>
               <db:year>
                  <xsl:text>2010</xsl:text>
               </db:year>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d46e1-doc" as="document-node()">
               <xsl:document>
                  <db:year>
                     <xsl:text>2000</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2001</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2002</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2003</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2004</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>Spoon!</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2006</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2007</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2008</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2009</xsl:text>
                  </db:year>
                  <db:year>
                     <xsl:text>2010</xsl:text>
                  </db:year>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:param-d46e1" as="element()+">
               <xsl:for-each select="$impl:param-d46e1-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:sequence select="fp:collapse-years($impl:param-d46e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario6-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                 name="x:scenario6-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>two ranges</xsl:message>
      <xsl:variable name="impl:expect-d15e206-doc" as="document-node()">
         <xsl:document>
            <span>
               <xsl:attribute name="class" select="'', ''" separator="copyright-years"/>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2000</xsl:text>
               </span>
               <xsl:text>–</xsl:text>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2004</xsl:text>
               </span>
               <xsl:text>, </xsl:text>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>Spoon!</xsl:text>
               </span>
               <xsl:text>, </xsl:text>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2006</xsl:text>
               </span>
               <xsl:text>–</xsl:text>
               <span>
                  <xsl:attribute name="class" select="'', ''" separator="year"/>
                  <xsl:text>2010</xsl:text>
               </span>
            </span>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e206" as="item()*">
         <xsl:for-each select="$impl:expect-d15e206-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e206, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario6-expect1" successful="{$impl:successful}">
         <x:label>two ranges</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e206"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario7">
      <xsl:message>When transforming a date of 'today'</xsl:message>
      <x:scenario id="scenario7" xspec="file:/home/circleci/repo/build/xspec/dates.xspec">
         <x:label>When transforming a date of 'today'</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/dates.001.xml</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <xsl:attribute name="select">//db:para[@xml:id='today']/db:date</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d52e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/dates.001.xml</xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d52e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d52e0-uri)"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d52e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d52e0-doc">
                  <xsl:sequence select="//db:para[@xml:id='today']/db:date"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d52e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario7-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario7-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect a verbatim copy</xsl:message>
      <xsl:variable name="impl:expect-d15e236-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/dates.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d15e236-doc"
                    as="document-node()"
                    select="doc($impl:expect-d15e236-uri)"/>
      <xsl:variable name="impl:expect-d15e236" as="item()*">
         <xsl:for-each select="$impl:expect-d15e236-doc">
            <xsl:sequence select="//h:p[@id='today']/h:span"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e236, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario7-expect1" successful="{$impl:successful}">
         <x:label>expect a verbatim copy</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e236"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario8">
      <xsl:message>When transforming an ISO 8601 date</xsl:message>
      <x:scenario id="scenario8" xspec="file:/home/circleci/repo/build/xspec/dates.xspec">
         <x:label>When transforming an ISO 8601 date</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/dates.001.xml</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <xsl:attribute name="select">//db:para[@xml:id='date']/db:date</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d58e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/dates.001.xml</xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d58e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d58e0-uri)"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d58e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d58e0-doc">
                  <xsl:sequence select="//db:para[@xml:id='date']/db:date"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d58e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario8-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario8-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect a formatted date</xsl:message>
      <xsl:variable name="impl:expect-d15e239-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/dates.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d15e239-doc"
                    as="document-node()"
                    select="doc($impl:expect-d15e239-uri)"/>
      <xsl:variable name="impl:expect-d15e239" as="item()*">
         <xsl:for-each select="$impl:expect-d15e239-doc">
            <xsl:sequence select="//h:p[@id='date']/h:span"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e239, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario8-expect1" successful="{$impl:successful}">
         <x:label>expect a formatted date</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e239"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario9">
      <xsl:message>When transforming an ISO 8601 date time in the morning</xsl:message>
      <x:scenario id="scenario9" xspec="file:/home/circleci/repo/build/xspec/dates.xspec">
         <x:label>When transforming an ISO 8601 date time in the morning</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/dates.001.xml</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <xsl:attribute name="select">//db:para[@xml:id='amtime']/db:date</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d64e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/dates.001.xml</xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d64e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d64e0-uri)"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d64e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d64e0-doc">
                  <xsl:sequence select="//db:para[@xml:id='amtime']/db:date"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d64e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario9-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario9-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect formatted date time</xsl:message>
      <xsl:variable name="impl:expect-d15e242-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/dates.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d15e242-doc"
                    as="document-node()"
                    select="doc($impl:expect-d15e242-uri)"/>
      <xsl:variable name="impl:expect-d15e242" as="item()*">
         <xsl:for-each select="$impl:expect-d15e242-doc">
            <xsl:sequence select="//h:p[@id='amtime']/h:span"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e242, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario9-expect1" successful="{$impl:successful}">
         <x:label>expect formatted date time</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e242"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario10">
      <xsl:message>When transforming an ISO 8601 date time in the afternoon</xsl:message>
      <x:scenario id="scenario10"
                  xspec="file:/home/circleci/repo/build/xspec/dates.xspec">
         <x:label>When transforming an ISO 8601 date time in the afternoon</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/dates.001.xml</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <xsl:attribute name="select">//db:para[@xml:id='pmtime']/db:date</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d70e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/dates.001.xml</xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d70e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d70e0-uri)"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d70e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d70e0-doc">
                  <xsl:sequence select="//db:para[@xml:id='pmtime']/db:date"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d70e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario10-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario10-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect a formatted date time</xsl:message>
      <xsl:variable name="impl:expect-d15e246-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/dates.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d15e246-doc"
                    as="document-node()"
                    select="doc($impl:expect-d15e246-uri)"/>
      <xsl:variable name="impl:expect-d15e246" as="item()*">
         <xsl:for-each select="$impl:expect-d15e246-doc">
            <xsl:sequence select="//h:p[@id='pmtime']/h:span"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e246, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario10-expect1" successful="{$impl:successful}">
         <x:label>expect a formatted date time</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e246"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario11">
      <xsl:message>When transforming a date time with a custom format</xsl:message>
      <x:scenario id="scenario11"
                  xspec="file:/home/circleci/repo/build/xspec/dates.xspec">
         <x:label>When transforming a date time with a custom format</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/dates.001.xml</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <xsl:attribute name="select">//db:para[@xml:id='dtformat']/db:date</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d76e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/dates.001.xml</xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d76e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d76e0-uri)"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d76e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d76e0-doc">
                  <xsl:sequence select="//db:para[@xml:id='dtformat']/db:date"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d76e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario11-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario11-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect the custom format to be used</xsl:message>
      <xsl:variable name="impl:expect-d15e249-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/dates.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d15e249-doc"
                    as="document-node()"
                    select="doc($impl:expect-d15e249-uri)"/>
      <xsl:variable name="impl:expect-d15e249" as="item()*">
         <xsl:for-each select="$impl:expect-d15e249-doc">
            <xsl:sequence select="//h:p[@id='dtformat']/h:span"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e249, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario11-expect1" successful="{$impl:successful}">
         <x:label>expect the custom format to be used</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e249"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario12">
      <xsl:message>When transforming a french date with a custom format</xsl:message>
      <x:scenario id="scenario12"
                  xspec="file:/home/circleci/repo/build/xspec/dates.xspec">
         <x:label>When transforming a french date with a custom format</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/dates.001.xml</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <xsl:attribute name="select">//db:para[@xml:id='dtformat-fr']/db:date</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d82e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/dates.001.xml</xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d82e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d82e0-uri)"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d82e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d82e0-doc">
                  <xsl:sequence select="//db:para[@xml:id='dtformat-fr']/db:date"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d82e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario12-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:db="http://docbook.org/ns/docbook"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario12-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect the result to be in French (maybe)</xsl:message>
      <xsl:variable name="impl:expect-d15e252" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="(starts-with(system-property('xsl:product-version'), 'HE')                    and string(.) = '4:49p.m. / Friday, May 8, 2020')                   or (string(.) = '4:49p.m. / Vendredi, Mai 8, 2020') "
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="(starts-with(system-property('xsl:product-version'), 'HE')                    and string(.) = '4:49p.m. / Friday, May 8, 2020')                   or (string(.) = '4:49p.m. / Vendredi, Mai 8, 2020') "
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e252, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario12-expect1" successful="{$impl:successful}">
         <x:label>expect the result to be in French (maybe)</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e252"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">(starts-with(system-property('xsl:product-version'), 'HE')                    and string(.) = '4:49p.m. / Friday, May 8, 2020')                   or (string(.) = '4:49p.m. / Vendredi, Mai 8, 2020') </xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario13">
      <xsl:message>When transforming short funcsynopsis elements in ANSI mode</xsl:message>
      <x:scenario id="scenario13"
                  xspec="file:/home/circleci/repo/build/xspec/funcsynopsis.xspec">
         <x:label>When transforming short funcsynopsis elements in ANSI mode</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/funcsynopsis.001.xml</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <xsl:attribute name="select">//*[@xml:id='ansi1']</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d88e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/funcsynopsis.001.xml</xsl:variable>
            <xsl:variable name="impl:context-d88e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d88e0-uri)"/>
            <xsl:variable name="impl:context-d88e0" as="item()*">
               <xsl:for-each select="$impl:context-d88e0-doc">
                  <xsl:sequence select="//*[@xml:id='ansi1']"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context-d88e0" mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario13-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario13-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect non-tabular ANSI output</xsl:message>
      <xsl:variable name="impl:expect-d15e256-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/funcsynopsis.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d15e256-doc"
                    as="document-node()"
                    select="doc($impl:expect-d15e256-uri)"/>
      <xsl:variable name="impl:expect-d15e256" as="item()*">
         <xsl:for-each select="$impl:expect-d15e256-doc">
            <xsl:sequence select="//h:div[@id='ansi1']"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e256, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario13-expect1" successful="{$impl:successful}">
         <x:label>expect non-tabular ANSI output</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e256"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario14">
      <xsl:message>When transforming longer funcsynopsis elements in ANSI mode</xsl:message>
      <x:scenario id="scenario14"
                  xspec="file:/home/circleci/repo/build/xspec/funcsynopsis.xspec">
         <x:label>When transforming longer funcsynopsis elements in ANSI mode</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/funcsynopsis.001.xml</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <xsl:attribute name="select">//*[@xml:id='ansi2']</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d94e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/funcsynopsis.001.xml</xsl:variable>
            <xsl:variable name="impl:context-d94e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d94e0-uri)"/>
            <xsl:variable name="impl:context-d94e0" as="item()*">
               <xsl:for-each select="$impl:context-d94e0-doc">
                  <xsl:sequence select="//*[@xml:id='ansi2']"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context-d94e0" mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario14-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario14-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect tabular ANSI output</xsl:message>
      <xsl:variable name="impl:expect-d15e259-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/funcsynopsis.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d15e259-doc"
                    as="document-node()"
                    select="doc($impl:expect-d15e259-uri)"/>
      <xsl:variable name="impl:expect-d15e259" as="item()*">
         <xsl:for-each select="$impl:expect-d15e259-doc">
            <xsl:sequence select="//h:div[@id='ansi2']"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e259, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario14-expect1" successful="{$impl:successful}">
         <x:label>expect tabular ANSI output</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e259"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario15">
      <xsl:message>When transforming long funcsynopsis elements in ANSI mode</xsl:message>
      <x:scenario id="scenario15"
                  xspec="file:/home/circleci/repo/build/xspec/funcsynopsis.xspec">
         <x:label>When transforming long funcsynopsis elements in ANSI mode</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/funcsynopsis.001.xml</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <xsl:attribute name="select">//*[@xml:id='ansi3']</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d100e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/funcsynopsis.001.xml</xsl:variable>
            <xsl:variable name="impl:context-d100e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d100e0-uri)"/>
            <xsl:variable name="impl:context-d100e0" as="item()*">
               <xsl:for-each select="$impl:context-d100e0-doc">
                  <xsl:sequence select="//*[@xml:id='ansi3']"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context-d100e0" mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario15-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario15-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect tabular ANSI output</xsl:message>
      <xsl:variable name="impl:expect-d15e262-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/funcsynopsis.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d15e262-doc"
                    as="document-node()"
                    select="doc($impl:expect-d15e262-uri)"/>
      <xsl:variable name="impl:expect-d15e262" as="item()*">
         <xsl:for-each select="$impl:expect-d15e262-doc">
            <xsl:sequence select="//h:div[@id='ansi3']"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e262, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario15-expect1" successful="{$impl:successful}">
         <x:label>expect tabular ANSI output</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e262"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario16">
      <xsl:message>When transforming short funcsynopsis elements in K&amp;R mode</xsl:message>
      <x:scenario id="scenario16"
                  xspec="file:/home/circleci/repo/build/xspec/funcsynopsis.xspec">
         <x:label>When transforming short funcsynopsis elements in K&amp;R mode</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/funcsynopsis.001.xml</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <xsl:attribute name="select">//*[@xml:id='kr1']</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d106e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/funcsynopsis.001.xml</xsl:variable>
            <xsl:variable name="impl:context-d106e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d106e0-uri)"/>
            <xsl:variable name="impl:context-d106e0" as="item()*">
               <xsl:for-each select="$impl:context-d106e0-doc">
                  <xsl:sequence select="//*[@xml:id='kr1']"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context-d106e0" mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario16-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario16-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect non-tabular K&amp;R output</xsl:message>
      <xsl:variable name="impl:expect-d15e265-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/funcsynopsis.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d15e265-doc"
                    as="document-node()"
                    select="doc($impl:expect-d15e265-uri)"/>
      <xsl:variable name="impl:expect-d15e265" as="item()*">
         <xsl:for-each select="$impl:expect-d15e265-doc">
            <xsl:sequence select="//h:div[@id='kr1']"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e265, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario16-expect1" successful="{$impl:successful}">
         <x:label>expect non-tabular K&amp;R output</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e265"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario17">
      <xsl:message>When transforming longer funcsynopsis elements in K&amp;R mode</xsl:message>
      <x:scenario id="scenario17"
                  xspec="file:/home/circleci/repo/build/xspec/funcsynopsis.xspec">
         <x:label>When transforming longer funcsynopsis elements in K&amp;R mode</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/funcsynopsis.001.xml</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <xsl:attribute name="select">//*[@xml:id='kr2']</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d112e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/funcsynopsis.001.xml</xsl:variable>
            <xsl:variable name="impl:context-d112e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d112e0-uri)"/>
            <xsl:variable name="impl:context-d112e0" as="item()*">
               <xsl:for-each select="$impl:context-d112e0-doc">
                  <xsl:sequence select="//*[@xml:id='kr2']"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context-d112e0" mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario17-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario17-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect tabular K&amp;R output</xsl:message>
      <xsl:variable name="impl:expect-d15e268-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/funcsynopsis.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d15e268-doc"
                    as="document-node()"
                    select="doc($impl:expect-d15e268-uri)"/>
      <xsl:variable name="impl:expect-d15e268" as="item()*">
         <xsl:for-each select="$impl:expect-d15e268-doc">
            <xsl:sequence select="//h:div[@id='kr2']"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e268, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario17-expect1" successful="{$impl:successful}">
         <x:label>expect tabular K&amp;R output</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e268"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario18">
      <xsl:message>When transforming long funcsynopsis elements in K&amp;R mode</xsl:message>
      <x:scenario id="scenario18"
                  xspec="file:/home/circleci/repo/build/xspec/funcsynopsis.xspec">
         <x:label>When transforming long funcsynopsis elements in K&amp;R mode</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/funcsynopsis.001.xml</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <xsl:attribute name="select">//*[@xml:id='kr3']</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d118e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/funcsynopsis.001.xml</xsl:variable>
            <xsl:variable name="impl:context-d118e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d118e0-uri)"/>
            <xsl:variable name="impl:context-d118e0" as="item()*">
               <xsl:for-each select="$impl:context-d118e0-doc">
                  <xsl:sequence select="//*[@xml:id='kr3']"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context-d118e0" mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario18-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario18-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect tabular K&amp;R output</xsl:message>
      <xsl:variable name="impl:expect-d15e271-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/funcsynopsis.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d15e271-doc"
                    as="document-node()"
                    select="doc($impl:expect-d15e271-uri)"/>
      <xsl:variable name="impl:expect-d15e271" as="item()*">
         <xsl:for-each select="$impl:expect-d15e271-doc">
            <xsl:sequence select="//h:div[@id='kr3']"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e271, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario18-expect1" successful="{$impl:successful}">
         <x:label>expect tabular K&amp;R output</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e271"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario19">
      <xsl:message>The empty sequence is the length</xsl:message>
      <x:scenario id="scenario19"
                  xspec="file:/home/circleci/repo/build/xspec/functions.xspec">
         <x:label>The empty sequence is the length</x:label>
         <x:call>
            <xsl:attribute name="function">f:spaces</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">()</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d124e1" select="()"/>
            <xsl:sequence select="f:spaces($impl:param-d124e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario19-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario19-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect the empty sequence</xsl:message>
      <xsl:variable name="impl:expect-d15e275" select="()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e275, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario19-expect1" successful="{$impl:successful}">
         <x:label>expect the empty sequence</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e275"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario20">
      <xsl:message>The length is zero</xsl:message>
      <x:scenario id="scenario20"
                  xspec="file:/home/circleci/repo/build/xspec/functions.xspec">
         <x:label>The length is zero</x:label>
         <x:call>
            <xsl:attribute name="function">f:spaces</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">0</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d130e1" select="0"/>
            <xsl:sequence select="f:spaces($impl:param-d130e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario20-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario20-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect the empty string</xsl:message>
      <xsl:variable name="impl:expect-d15e280" select="''"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e280, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario20-expect1" successful="{$impl:successful}">
         <x:label>expect the empty string</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e280"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario21">
      <xsl:message>The length is negative</xsl:message>
      <x:scenario id="scenario21"
                  xspec="file:/home/circleci/repo/build/xspec/functions.xspec">
         <x:label>The length is negative</x:label>
         <x:call>
            <xsl:attribute name="function">f:spaces</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">-3</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d136e1" select="-3"/>
            <xsl:sequence select="f:spaces($impl:param-d136e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario21-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario21-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect the empty sequence</xsl:message>
      <xsl:variable name="impl:expect-d15e284" select="()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e284, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario21-expect1" successful="{$impl:successful}">
         <x:label>expect the empty sequence</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e284"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario22">
      <xsl:message>The length is a positive integer (1)</xsl:message>
      <x:scenario id="scenario22"
                  xspec="file:/home/circleci/repo/build/xspec/functions.xspec">
         <x:label>The length is a positive integer (1)</x:label>
         <x:call>
            <xsl:attribute name="function">f:spaces</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">1</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d142e1" select="1"/>
            <xsl:sequence select="f:spaces($impl:param-d142e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario22-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario22-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect a string of that length</xsl:message>
      <xsl:variable name="impl:expect-d15e288" select="' '"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e288, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario22-expect1" successful="{$impl:successful}">
         <x:label>expect a string of that length</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e288"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario23">
      <xsl:message>The length is a positive integer (12)</xsl:message>
      <x:scenario id="scenario23"
                  xspec="file:/home/circleci/repo/build/xspec/functions.xspec">
         <x:label>The length is a positive integer (12)</x:label>
         <x:call>
            <xsl:attribute name="function">f:spaces</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">12</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d148e1" select="12"/>
            <xsl:sequence select="f:spaces($impl:param-d148e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario23-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario23-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect a string of that length</xsl:message>
      <xsl:variable name="impl:expect-d15e292" select="'            '"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e292, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario23-expect1" successful="{$impl:successful}">
         <x:label>expect a string of that length</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e292"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario24">
      <xsl:message>The length is castable to a positive integer</xsl:message>
      <x:scenario id="scenario24"
                  xspec="file:/home/circleci/repo/build/xspec/functions.xspec">
         <x:label>The length is castable to a positive integer</x:label>
         <x:call>
            <xsl:attribute name="function">f:spaces</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'3'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d154e1" select="'3'"/>
            <xsl:sequence select="f:spaces($impl:param-d154e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario24-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario24-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect a string of that length</xsl:message>
      <xsl:variable name="impl:expect-d15e296" select="'   '"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e296, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario24-expect1" successful="{$impl:successful}">
         <x:label>expect a string of that length</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e296"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario25">
      <xsl:message>The length isn't numeric'</xsl:message>
      <x:scenario id="scenario25"
                  xspec="file:/home/circleci/repo/build/xspec/functions.xspec">
         <x:label>The length isn't numeric'</x:label>
         <x:call>
            <xsl:attribute name="function">f:spaces</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'test'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d160e1" select="'test'"/>
            <xsl:sequence select="f:spaces($impl:param-d160e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario25-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario25-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect a string equal in length to the length of the string value of the length argument</xsl:message>
      <xsl:variable name="impl:expect-d15e300" select="'    '"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e300, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario25-expect1" successful="{$impl:successful}">
         <x:label>expect a string equal in length to the length of the string value of the length argument</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e300"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario26">
      <xsl:message>The length is a sequence of several items'</xsl:message>
      <x:scenario id="scenario26"
                  xspec="file:/home/circleci/repo/build/xspec/functions.xspec">
         <x:label>The length is a sequence of several items'</x:label>
         <x:call>
            <xsl:attribute name="function">f:spaces</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">('a', 'b', '3')</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d166e1" select="('a', 'b', '3')"/>
            <xsl:sequence select="f:spaces($impl:param-d166e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario26-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario26-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect them to be concatenated</xsl:message>
      <xsl:variable name="impl:expect-d15e304" select="'   '"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e304, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario26-expect1" successful="{$impl:successful}">
         <x:label>expect them to be concatenated</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e304"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario27">
      <xsl:message>The length is a sequence of several items'</xsl:message>
      <x:scenario id="scenario27"
                  xspec="file:/home/circleci/repo/build/xspec/functions.xspec">
         <x:label>The length is a sequence of several items'</x:label>
         <x:call>
            <xsl:attribute name="function">f:spaces</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">('0', '1', '0')</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d172e1" select="('0', '1', '0')"/>
            <xsl:sequence select="f:spaces($impl:param-d172e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario27-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario27-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect them to be concatenated</xsl:message>
      <xsl:variable name="impl:expect-d15e308" select="'          '"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e308, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario27-expect1" successful="{$impl:successful}">
         <x:label>expect them to be concatenated</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e308"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario28">
      <xsl:message>When converting an anchor element with an xml:id and roles</xsl:message>
      <x:scenario id="scenario28"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting an anchor element with an xml:id and roles</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <anchor>
               <xsl:attribute name="xml:id" select="'', ''" separator="d1e32"/>
               <xsl:attribute name="role" select="'', ''" separator="a c b"/>
            </anchor>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d178e0-doc"
                          as="document-node()">
               <xsl:document>
                  <anchor>
                     <xsl:attribute name="xml:id" select="'', ''" separator="d1e32"/>
                     <xsl:attribute name="role" select="'', ''" separator="a c b"/>
                  </anchor>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d178e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d178e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d178e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario28-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario28-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario28-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario28-expect4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario28-expect5">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario28-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a single a element</xsl:message>
      <xsl:variable name="impl:expect-d15e316" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(/*) = 1 and /h:span" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(/*) = 1 and /h:span" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e316, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario28-expect1" successful="{$impl:successful}">
         <x:label>it should return a single a element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e316"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">count(/*) = 1 and /h:span</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario28-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="impl:expect-d15e317" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/h:span/@id = 'd1e32'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/h:span/@id = 'd1e32'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e317, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario28-expect2" successful="{$impl:successful}">
         <x:label>it should return the xml:id in the id</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e317"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/h:span/@id = 'd1e32'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario28-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="impl:expect-d15e318" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/h:span/@class = 'a anchor b c'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/h:span/@class = 'a anchor b c'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e318, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario28-expect3" successful="{$impl:successful}">
         <x:label>it should return the roles as classes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e318"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/h:span/@class = 'a anchor b c'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario28-expect4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="impl:expect-d15e319" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e319, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario28-expect4" successful="{$impl:successful}">
         <x:label>it should not return any other attributes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e319"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@* except (/*/@id | /*/@class))</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario28-expect5">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should be empty</xsl:message>
      <xsl:variable name="impl:expect-d15e320" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/node())" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/node())" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e320, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario28-expect5" successful="{$impl:successful}">
         <x:label>it should be empty</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e320"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/node())</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario29">
      <xsl:message>When converting an emphasis element with a bold role</xsl:message>
      <x:scenario id="scenario29"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting an emphasis element with a bold role</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <emphasis>
               <xsl:attribute name="role" select="'', ''" separator="bold"/>
               <xsl:text>This is strongly emphasized</xsl:text>
            </emphasis>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d196e0-doc"
                          as="document-node()">
               <xsl:document>
                  <emphasis>
                     <xsl:attribute name="role" select="'', ''" separator="bold"/>
                     <xsl:text>This is strongly emphasized</xsl:text>
                  </emphasis>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d196e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d196e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d196e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario29-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario29-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a strong element</xsl:message>
      <xsl:variable name="impl:expect-d15e326-doc" as="document-node()">
         <xsl:document>
            <strong>
               <xsl:attribute name="class" select="'', ''" separator="bold"/>
               <xsl:text>This is strongly emphasized</xsl:text>
            </strong>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e326" as="item()*">
         <xsl:for-each select="$impl:expect-d15e326-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e326, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario29-expect1" successful="{$impl:successful}">
         <x:label>it should return a strong element</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e326"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario30">
      <xsl:message>When converting a code element</xsl:message>
      <x:scenario id="scenario30"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting a code element</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <code>
               <xsl:text>This is a code element.</xsl:text>
            </code>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d202e0-doc"
                          as="document-node()">
               <xsl:document>
                  <code>
                     <xsl:text>This is a code element.</xsl:text>
                  </code>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d202e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d202e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d202e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario30-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario30-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario30-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario30-expect4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario30-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a single code element</xsl:message>
      <xsl:variable name="impl:expect-d15e335" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'code' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'code' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e335, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario30-expect1" successful="{$impl:successful}">
         <x:label>it should return a single code element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e335"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">count(/*) = 1 and local-name(/*[1]) = 'code' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario30-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>the name shouldn't become a class</xsl:message>
      <xsl:variable name="impl:expect-d15e336" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@class)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@class)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e336, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario30-expect2" successful="{$impl:successful}">
         <x:label>the name shouldn't become a class</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e336"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@class)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario30-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="impl:expect-d15e337" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@* except /*/@class)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@* except /*/@class)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e337, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario30-expect3" successful="{$impl:successful}">
         <x:label>it should not return any other attributes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e337"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@* except /*/@class)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario30-expect4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the correct text</xsl:message>
      <xsl:variable name="impl:expect-d15e338" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select=". = 'This is a code element.'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select=". = 'This is a code element.'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e338, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario30-expect4" successful="{$impl:successful}">
         <x:label>it should return the correct text</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e338"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">. = 'This is a code element.'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario31">
      <xsl:message>When converting a code element with an xml:id and roles</xsl:message>
      <x:scenario id="scenario31"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting a code element with an xml:id and roles</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <code>
               <xsl:attribute name="xml:id" select="'', ''" separator="d15e0"/>
               <xsl:attribute name="role" select="'', ''" separator="b a b c"/>
               <xsl:text>This is a code element.</xsl:text>
            </code>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d217e0-doc"
                          as="document-node()">
               <xsl:document>
                  <code>
                     <xsl:attribute name="xml:id" select="'', ''" separator="d15e0"/>
                     <xsl:attribute name="role" select="'', ''" separator="b a b c"/>
                     <xsl:text>This is a code element.</xsl:text>
                  </code>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d217e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d217e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d217e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario31-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario31-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario31-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario31-expect4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario31-expect5">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario31-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a single code element</xsl:message>
      <xsl:variable name="impl:expect-d15e344" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'code' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'code' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e344, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario31-expect1" successful="{$impl:successful}">
         <x:label>it should return a single code element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e344"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">count(/*) = 1 and local-name(/*[1]) = 'code' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario31-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="impl:expect-d15e345" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@id = 'd15e0'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@id = 'd15e0'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e345, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario31-expect2" successful="{$impl:successful}">
         <x:label>it should return the xml:id in the id</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e345"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@id = 'd15e0'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario31-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="impl:expect-d15e346" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@class = 'a b c'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@class = 'a b c'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e346, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario31-expect3" successful="{$impl:successful}">
         <x:label>it should return the roles as classes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e346"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@class = 'a b c'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario31-expect4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="impl:expect-d15e347" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e347, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario31-expect4" successful="{$impl:successful}">
         <x:label>it should not return any other attributes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e347"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@* except (/*/@id | /*/@class))</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario31-expect5">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the correct text</xsl:message>
      <xsl:variable name="impl:expect-d15e348" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select=". = 'This is a code element.'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select=". = 'This is a code element.'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e348, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario31-expect5" successful="{$impl:successful}">
         <x:label>it should return the correct text</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e348"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">. = 'This is a code element.'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario32">
      <xsl:message>When converting a quote element</xsl:message>
      <x:scenario id="scenario32"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting a quote element</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <quote>
               <xsl:text>This is a quote element.</xsl:text>
            </quote>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d235e0-doc"
                          as="document-node()">
               <xsl:document>
                  <quote>
                     <xsl:text>This is a quote element.</xsl:text>
                  </quote>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d235e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d235e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d235e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario32-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario32-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario32-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario32-expect4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario32-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a single q element</xsl:message>
      <xsl:variable name="impl:expect-d15e354" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'q' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'q' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e354, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario32-expect1" successful="{$impl:successful}">
         <x:label>it should return a single q element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e354"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">count(/*) = 1 and local-name(/*[1]) = 'q' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario32-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>the name shouldn't become a class</xsl:message>
      <xsl:variable name="impl:expect-d15e355" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@class)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@class)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e355, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario32-expect2" successful="{$impl:successful}">
         <x:label>the name shouldn't become a class</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e355"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@class)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario32-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="impl:expect-d15e356" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@* except /*/@class)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@* except /*/@class)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e356, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario32-expect3" successful="{$impl:successful}">
         <x:label>it should not return any other attributes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e356"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@* except /*/@class)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario32-expect4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the correct text</xsl:message>
      <xsl:variable name="impl:expect-d15e357" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select=". = 'This is a quote element.'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select=". = 'This is a quote element.'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e357, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario32-expect4" successful="{$impl:successful}">
         <x:label>it should return the correct text</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e357"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">. = 'This is a quote element.'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario33">
      <xsl:message>When converting a quote element with an xml:id and roles</xsl:message>
      <x:scenario id="scenario33"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting a quote element with an xml:id and roles</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <quote>
               <xsl:attribute name="xml:id" select="'', ''" separator="d80e0"/>
               <xsl:attribute name="role" select="'', ''" separator="b a b c"/>
               <xsl:text>This is a quote element.</xsl:text>
            </quote>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d250e0-doc"
                          as="document-node()">
               <xsl:document>
                  <quote>
                     <xsl:attribute name="xml:id" select="'', ''" separator="d80e0"/>
                     <xsl:attribute name="role" select="'', ''" separator="b a b c"/>
                     <xsl:text>This is a quote element.</xsl:text>
                  </quote>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d250e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d250e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d250e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario33-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario33-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario33-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario33-expect4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario33-expect5">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario33-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a single q element</xsl:message>
      <xsl:variable name="impl:expect-d15e363" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'q' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'q' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e363, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario33-expect1" successful="{$impl:successful}">
         <x:label>it should return a single q element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e363"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">count(/*) = 1 and local-name(/*[1]) = 'q' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario33-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="impl:expect-d15e364" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@id = 'd80e0'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@id = 'd80e0'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e364, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario33-expect2" successful="{$impl:successful}">
         <x:label>it should return the xml:id in the id</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e364"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@id = 'd80e0'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario33-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="impl:expect-d15e365" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@class = 'a b c'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@class = 'a b c'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e365, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario33-expect3" successful="{$impl:successful}">
         <x:label>it should return the roles as classes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e365"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@class = 'a b c'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario33-expect4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="impl:expect-d15e366" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e366, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario33-expect4" successful="{$impl:successful}">
         <x:label>it should not return any other attributes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e366"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@* except (/*/@id | /*/@class))</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario33-expect5">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the correct text</xsl:message>
      <xsl:variable name="impl:expect-d15e367" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select=". = 'This is a quote element.'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select=". = 'This is a quote element.'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e367, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario33-expect5" successful="{$impl:successful}">
         <x:label>it should return the correct text</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e367"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">. = 'This is a quote element.'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario34">
      <xsl:message>When converting a subscript element</xsl:message>
      <x:scenario id="scenario34"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting a subscript element</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <subscript>
               <xsl:text>This is a subscript element.</xsl:text>
            </subscript>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d268e0-doc"
                          as="document-node()">
               <xsl:document>
                  <subscript>
                     <xsl:text>This is a subscript element.</xsl:text>
                  </subscript>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d268e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d268e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d268e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario34-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario34-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario34-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario34-expect4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario34-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a single sub element</xsl:message>
      <xsl:variable name="impl:expect-d15e373" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'sub' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'sub' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e373, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario34-expect1" successful="{$impl:successful}">
         <x:label>it should return a single sub element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e373"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">count(/*) = 1 and local-name(/*[1]) = 'sub' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario34-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>the name shouldn't become a class</xsl:message>
      <xsl:variable name="impl:expect-d15e374" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@class)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@class)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e374, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario34-expect2" successful="{$impl:successful}">
         <x:label>the name shouldn't become a class</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e374"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@class)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario34-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="impl:expect-d15e375" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@* except /*/@class)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@* except /*/@class)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e375, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario34-expect3" successful="{$impl:successful}">
         <x:label>it should not return any other attributes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e375"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@* except /*/@class)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario34-expect4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the correct text</xsl:message>
      <xsl:variable name="impl:expect-d15e376" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select=". = 'This is a subscript element.'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select=". = 'This is a subscript element.'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e376, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario34-expect4" successful="{$impl:successful}">
         <x:label>it should return the correct text</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e376"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">. = 'This is a subscript element.'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario35">
      <xsl:message>When converting a subscript element with an xml:id and roles</xsl:message>
      <x:scenario id="scenario35"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting a subscript element with an xml:id and roles</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <subscript>
               <xsl:attribute name="xml:id" select="'', ''" separator="d85e0"/>
               <xsl:attribute name="role" select="'', ''" separator="b a b c"/>
               <xsl:text>This is a subscript element.</xsl:text>
            </subscript>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d283e0-doc"
                          as="document-node()">
               <xsl:document>
                  <subscript>
                     <xsl:attribute name="xml:id" select="'', ''" separator="d85e0"/>
                     <xsl:attribute name="role" select="'', ''" separator="b a b c"/>
                     <xsl:text>This is a subscript element.</xsl:text>
                  </subscript>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d283e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d283e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d283e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario35-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario35-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario35-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario35-expect4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario35-expect5">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario35-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a single sub element</xsl:message>
      <xsl:variable name="impl:expect-d15e382" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'sub' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'sub' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e382, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario35-expect1" successful="{$impl:successful}">
         <x:label>it should return a single sub element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e382"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">count(/*) = 1 and local-name(/*[1]) = 'sub' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario35-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="impl:expect-d15e383" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@id = 'd85e0'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@id = 'd85e0'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e383, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario35-expect2" successful="{$impl:successful}">
         <x:label>it should return the xml:id in the id</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e383"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@id = 'd85e0'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario35-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="impl:expect-d15e384" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@class = 'a b c'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@class = 'a b c'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e384, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario35-expect3" successful="{$impl:successful}">
         <x:label>it should return the roles as classes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e384"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@class = 'a b c'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario35-expect4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="impl:expect-d15e385" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e385, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario35-expect4" successful="{$impl:successful}">
         <x:label>it should not return any other attributes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e385"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@* except (/*/@id | /*/@class))</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario35-expect5">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the correct text</xsl:message>
      <xsl:variable name="impl:expect-d15e386" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select=". = 'This is a subscript element.'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select=". = 'This is a subscript element.'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e386, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario35-expect5" successful="{$impl:successful}">
         <x:label>it should return the correct text</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e386"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">. = 'This is a subscript element.'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario36">
      <xsl:message>When converting a superscript element</xsl:message>
      <x:scenario id="scenario36"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting a superscript element</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <superscript>
               <xsl:text>This is a superscript element.</xsl:text>
            </superscript>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d301e0-doc"
                          as="document-node()">
               <xsl:document>
                  <superscript>
                     <xsl:text>This is a superscript element.</xsl:text>
                  </superscript>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d301e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d301e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d301e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario36-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario36-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario36-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario36-expect4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario36-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a single sup element</xsl:message>
      <xsl:variable name="impl:expect-d15e392" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'sup' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'sup' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e392, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario36-expect1" successful="{$impl:successful}">
         <x:label>it should return a single sup element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e392"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">count(/*) = 1 and local-name(/*[1]) = 'sup' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario36-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>the name shouldn't become a class</xsl:message>
      <xsl:variable name="impl:expect-d15e393" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@class)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@class)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e393, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario36-expect2" successful="{$impl:successful}">
         <x:label>the name shouldn't become a class</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e393"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@class)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario36-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="impl:expect-d15e394" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@* except /*/@class)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@* except /*/@class)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e394, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario36-expect3" successful="{$impl:successful}">
         <x:label>it should not return any other attributes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e394"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@* except /*/@class)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario36-expect4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the correct text</xsl:message>
      <xsl:variable name="impl:expect-d15e395" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select=". = 'This is a superscript element.'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select=". = 'This is a superscript element.'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e395, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario36-expect4" successful="{$impl:successful}">
         <x:label>it should return the correct text</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e395"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">. = 'This is a superscript element.'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario37">
      <xsl:message>When converting a superscript element with an xml:id and roles</xsl:message>
      <x:scenario id="scenario37"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting a superscript element with an xml:id and roles</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <superscript>
               <xsl:attribute name="xml:id" select="'', ''" separator="d86e0"/>
               <xsl:attribute name="role" select="'', ''" separator="b a b c"/>
               <xsl:text>This is a superscript element.</xsl:text>
            </superscript>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d316e0-doc"
                          as="document-node()">
               <xsl:document>
                  <superscript>
                     <xsl:attribute name="xml:id" select="'', ''" separator="d86e0"/>
                     <xsl:attribute name="role" select="'', ''" separator="b a b c"/>
                     <xsl:text>This is a superscript element.</xsl:text>
                  </superscript>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d316e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d316e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d316e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario37-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario37-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario37-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario37-expect4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario37-expect5">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario37-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a single sup element</xsl:message>
      <xsl:variable name="impl:expect-d15e401" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'sup' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'sup' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e401, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario37-expect1" successful="{$impl:successful}">
         <x:label>it should return a single sup element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e401"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">count(/*) = 1 and local-name(/*[1]) = 'sup' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario37-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="impl:expect-d15e402" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@id = 'd86e0'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@id = 'd86e0'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e402, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario37-expect2" successful="{$impl:successful}">
         <x:label>it should return the xml:id in the id</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e402"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@id = 'd86e0'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario37-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="impl:expect-d15e403" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@class = 'a b c'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@class = 'a b c'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e403, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario37-expect3" successful="{$impl:successful}">
         <x:label>it should return the roles as classes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e403"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@class = 'a b c'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario37-expect4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="impl:expect-d15e404" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e404, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario37-expect4" successful="{$impl:successful}">
         <x:label>it should not return any other attributes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e404"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@* except (/*/@id | /*/@class))</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario37-expect5">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the correct text</xsl:message>
      <xsl:variable name="impl:expect-d15e405" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select=". = 'This is a superscript element.'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select=". = 'This is a superscript element.'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e405, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario37-expect5" successful="{$impl:successful}">
         <x:label>it should return the correct text</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e405"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">. = 'This is a superscript element.'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario38">
      <xsl:message>When converting a tag element</xsl:message>
      <x:scenario id="scenario38"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting a tag element</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <tag>
               <xsl:text>This is a tag element.</xsl:text>
            </tag>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d334e0-doc"
                          as="document-node()">
               <xsl:document>
                  <tag>
                     <xsl:text>This is a tag element.</xsl:text>
                  </tag>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d334e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d334e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d334e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario38-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario38-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario38-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario38-expect4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario38-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a single code element</xsl:message>
      <xsl:variable name="impl:expect-d15e411" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'code' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'code' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e411, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario38-expect1" successful="{$impl:successful}">
         <x:label>it should return a single code element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e411"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">count(/*) = 1 and local-name(/*[1]) = 'code' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario38-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the DocBook name as the class</xsl:message>
      <xsl:variable name="impl:expect-d15e412" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@class = 'tag tag-element'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@class = 'tag tag-element'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e412, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario38-expect2" successful="{$impl:successful}">
         <x:label>it should return the DocBook name as the class</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e412"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@class = 'tag tag-element'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario38-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="impl:expect-d15e413" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@* except /*/@class)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@* except /*/@class)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e413, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario38-expect3" successful="{$impl:successful}">
         <x:label>it should not return any other attributes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e413"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@* except /*/@class)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario38-expect4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the correct text</xsl:message>
      <xsl:variable name="impl:expect-d15e414" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select=". = 'This is a tag element.'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select=". = 'This is a tag element.'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e414, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario38-expect4" successful="{$impl:successful}">
         <x:label>it should return the correct text</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e414"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">. = 'This is a tag element.'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario39">
      <xsl:message>When converting a tag element with an xml:id and roles</xsl:message>
      <x:scenario id="scenario39"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting a tag element with an xml:id and roles</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <tag>
               <xsl:attribute name="xml:id" select="'', ''" separator="d84e0"/>
               <xsl:attribute name="role" select="'', ''" separator="b a b c"/>
               <xsl:text>This is a tag element.</xsl:text>
            </tag>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d349e0-doc"
                          as="document-node()">
               <xsl:document>
                  <tag>
                     <xsl:attribute name="xml:id" select="'', ''" separator="d84e0"/>
                     <xsl:attribute name="role" select="'', ''" separator="b a b c"/>
                     <xsl:text>This is a tag element.</xsl:text>
                  </tag>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d349e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d349e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d349e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario39-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario39-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario39-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario39-expect4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario39-expect5">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario39-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a single code element</xsl:message>
      <xsl:variable name="impl:expect-d15e421" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'code' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'code' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e421, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario39-expect1" successful="{$impl:successful}">
         <x:label>it should return a single code element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e421"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">count(/*) = 1 and local-name(/*[1]) = 'code' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario39-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="impl:expect-d15e422" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@id = 'd84e0'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@id = 'd84e0'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e422, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario39-expect2" successful="{$impl:successful}">
         <x:label>it should return the xml:id in the id</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e422"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@id = 'd84e0'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario39-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="impl:expect-d15e423" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@class = 'a b c tag tag-element'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@class = 'a b c tag tag-element'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e423, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario39-expect3" successful="{$impl:successful}">
         <x:label>it should return the roles as classes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e423"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@class = 'a b c tag tag-element'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario39-expect4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="impl:expect-d15e424" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e424, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario39-expect4" successful="{$impl:successful}">
         <x:label>it should not return any other attributes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e424"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@* except (/*/@id | /*/@class))</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario39-expect5">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the correct text</xsl:message>
      <xsl:variable name="impl:expect-d15e425" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select=". = 'This is a tag element.'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select=". = 'This is a tag element.'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e425, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario39-expect5" successful="{$impl:successful}">
         <x:label>it should return the correct text</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e425"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">. = 'This is a tag element.'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario40">
      <xsl:message>When converting a personname element</xsl:message>
      <x:scenario id="scenario40"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting a personname element</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <personname>
               <xsl:text>This is a personname element.</xsl:text>
            </personname>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d367e0-doc"
                          as="document-node()">
               <xsl:document>
                  <personname>
                     <xsl:text>This is a personname element.</xsl:text>
                  </personname>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d367e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d367e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d367e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario40-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario40-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario40-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario40-expect4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario40-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a single span element</xsl:message>
      <xsl:variable name="impl:expect-d15e431" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'span' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'span' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e431, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario40-expect1" successful="{$impl:successful}">
         <x:label>it should return a single span element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e431"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">count(/*) = 1 and local-name(/*[1]) = 'span' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario40-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the DocBook name as the class</xsl:message>
      <xsl:variable name="impl:expect-d15e432" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@class = 'first-last personname'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@class = 'first-last personname'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e432, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario40-expect2" successful="{$impl:successful}">
         <x:label>it should return the DocBook name as the class</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e432"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@class = 'first-last personname'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario40-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="impl:expect-d15e433" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@* except /*/@class)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@* except /*/@class)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e433, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario40-expect3" successful="{$impl:successful}">
         <x:label>it should not return any other attributes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e433"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@* except /*/@class)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario40-expect4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the correct text</xsl:message>
      <xsl:variable name="impl:expect-d15e434" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select=". = 'This is a personname element.'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select=". = 'This is a personname element.'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e434, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario40-expect4" successful="{$impl:successful}">
         <x:label>it should return the correct text</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e434"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">. = 'This is a personname element.'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario41">
      <xsl:message>When converting a personname element with an xml:id and roles</xsl:message>
      <x:scenario id="scenario41"
                  xspec="file:/home/circleci/repo/build/xspec/inlines.xspec">
         <x:label>When converting a personname element with an xml:id and roles</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <personname>
               <xsl:attribute name="xml:id" select="'', ''" separator="d71e0"/>
               <xsl:attribute name="role" select="'', ''" separator="b a b c"/>
               <xsl:text>This is a personname element.</xsl:text>
            </personname>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d382e0-doc"
                          as="document-node()">
               <xsl:document>
                  <personname>
                     <xsl:attribute name="xml:id" select="'', ''" separator="d71e0"/>
                     <xsl:attribute name="role" select="'', ''" separator="b a b c"/>
                     <xsl:text>This is a personname element.</xsl:text>
                  </personname>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d382e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d382e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d382e0"
                                 mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario41-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario41-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario41-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario41-expect4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario41-expect5">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario41-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return a single span element</xsl:message>
      <xsl:variable name="impl:expect-d15e440" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'span' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(/*) = 1 and local-name(/*[1]) = 'span' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e440, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario41-expect1" successful="{$impl:successful}">
         <x:label>it should return a single span element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e440"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">count(/*) = 1 and local-name(/*[1]) = 'span' and namespace-uri(/*[1]) = 'http://www.w3.org/1999/xhtml'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario41-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the xml:id in the id</xsl:message>
      <xsl:variable name="impl:expect-d15e441" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@id = 'd71e0'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@id = 'd71e0'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e441, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario41-expect2" successful="{$impl:successful}">
         <x:label>it should return the xml:id in the id</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e441"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@id = 'd71e0'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario41-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the roles as classes</xsl:message>
      <xsl:variable name="impl:expect-d15e442" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="/*/@class = 'a b c first-last personname'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@class = 'a b c first-last personname'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e442, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario41-expect3" successful="{$impl:successful}">
         <x:label>it should return the roles as classes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e442"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@class = 'a b c first-last personname'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario41-expect4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should not return any other attributes</xsl:message>
      <xsl:variable name="impl:expect-d15e443" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="empty(/*/@* except (/*/@id | /*/@class))" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e443, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario41-expect4" successful="{$impl:successful}">
         <x:label>it should not return any other attributes</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e443"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">empty(/*/@* except (/*/@id | /*/@class))</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario41-expect5">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>it should return the correct text</xsl:message>
      <xsl:variable name="impl:expect-d15e444" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select=". = 'This is a personname element.'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select=". = 'This is a personname element.'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d15e444, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario41-expect5" successful="{$impl:successful}">
         <x:label>it should return the correct text</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e444"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">. = 'This is a personname element.'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario42">
      <xsl:message>When transforming classsynopsis.001</xsl:message>
      <x:scenario id="scenario42"
                  xspec="file:/home/circleci/repo/build/xspec/oosynopsis.xspec">
         <x:label>When transforming classsynopsis.001</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/classsynopsis.001.xml</xsl:attribute>
            <xsl:attribute name="select">//*[@xml:id='class']</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d400e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/classsynopsis.001.xml</xsl:variable>
            <xsl:variable name="impl:context-d400e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d400e0-uri)"/>
            <xsl:variable name="impl:context-d400e0" as="item()*">
               <xsl:for-each select="$impl:context-d400e0-doc">
                  <xsl:sequence select="//*[@xml:id='class']"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context-d400e0" mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario42-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario42-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect a class synopsis</xsl:message>
      <xsl:variable name="impl:expect-d15e448-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/classsynopsis.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d15e448-doc"
                    as="document-node()"
                    select="doc($impl:expect-d15e448-uri)"/>
      <xsl:variable name="impl:expect-d15e448" as="item()*">
         <xsl:for-each select="$impl:expect-d15e448-doc">
            <xsl:sequence select="//h:*[@id='class']"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e448, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario42-expect1" successful="{$impl:successful}">
         <x:label>expect a class synopsis</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e448"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario43">
      <xsl:message>When transforming methodsynopsis.001</xsl:message>
      <x:scenario id="scenario43"
                  xspec="file:/home/circleci/repo/build/xspec/oosynopsis.xspec">
         <x:label>When transforming methodsynopsis.001</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/methodsynopsis.001.xml</xsl:attribute>
            <xsl:attribute name="select">//*[@xml:id='class']</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d406e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/methodsynopsis.001.xml</xsl:variable>
            <xsl:variable name="impl:context-d406e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d406e0-uri)"/>
            <xsl:variable name="impl:context-d406e0" as="item()*">
               <xsl:for-each select="$impl:context-d406e0-doc">
                  <xsl:sequence select="//*[@xml:id='class']"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context-d406e0" mode="m:docbook"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario43-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario43-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect a class synopsis</xsl:message>
      <xsl:variable name="impl:expect-d15e451-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/methodsynopsis.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d15e451-doc"
                    as="document-node()"
                    select="doc($impl:expect-d15e451-uri)"/>
      <xsl:variable name="impl:expect-d15e451" as="item()*">
         <xsl:for-each select="$impl:expect-d15e451-doc">
            <xsl:sequence select="//h:*[@id='class']"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e451, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario43-expect1" successful="{$impl:successful}">
         <x:label>expect a class synopsis</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e451"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario44">
      <xsl:message>When computing the length 1.0in</xsl:message>
      <x:scenario id="scenario44"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 1.0in</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'1.0in'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d412e1" select="'1.0in'"/>
            <xsl:sequence select="f:parse-length($impl:param-d412e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario44-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario44-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e455"
                    select="map { 'magnitude': 1.0, 'relative': 0.0, 'unit': 'in' }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e455, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario44-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e455"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario45">
      <xsl:message>When computing the length 1.0m</xsl:message>
      <x:scenario id="scenario45"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 1.0m</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'1.0m'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d418e1" select="'1.0m'"/>
            <xsl:sequence select="f:parse-length($impl:param-d418e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario45-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario45-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e459"
                    select="map { 'magnitude': 1.0, 'relative': 0.0, 'unit': 'm' }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e459, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario45-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e459"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario46">
      <xsl:message>When computing the length 1.0cm</xsl:message>
      <x:scenario id="scenario46"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 1.0cm</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'1.0cm'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d424e1" select="'1.0cm'"/>
            <xsl:sequence select="f:parse-length($impl:param-d424e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario46-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario46-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e463"
                    select="map { 'magnitude': 1.0, 'relative': 0.0, 'unit': 'cm' }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e463, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario46-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e463"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario47">
      <xsl:message>When computing the length 1.0mm</xsl:message>
      <x:scenario id="scenario47"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 1.0mm</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'1.0mm'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d430e1" select="'1.0mm'"/>
            <xsl:sequence select="f:parse-length($impl:param-d430e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario47-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario47-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e467"
                    select="map { 'magnitude': 1.0, 'relative': 0.0, 'unit': 'mm' }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e467, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario47-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e467"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario48">
      <xsl:message>When computing the length 1.0pc</xsl:message>
      <x:scenario id="scenario48"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 1.0pc</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'1.0pc'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d436e1" select="'1.0pc'"/>
            <xsl:sequence select="f:parse-length($impl:param-d436e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario48-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario48-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e471"
                    select="map { 'magnitude': 1.0, 'relative': 0.0, 'unit': 'pc' }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e471, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario48-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e471"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario49">
      <xsl:message>When computing the length 1.0pt</xsl:message>
      <x:scenario id="scenario49"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 1.0pt</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'1.0pt'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d442e1" select="'1.0pt'"/>
            <xsl:sequence select="f:parse-length($impl:param-d442e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario49-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario49-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e476"
                    select="map { 'magnitude': 1.0, 'relative': 0.0, 'unit': 'pt' }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e476, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario49-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e476"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario50">
      <xsl:message>When computing the length 3.14barleycorn</xsl:message>
      <x:scenario id="scenario50"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 3.14barleycorn</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'3.14barleycorn'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d448e1" select="'3.14barleycorn'"/>
            <xsl:sequence select="f:parse-length($impl:param-d448e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario50-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario50-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e480"
                    select="map { 'magnitude': 3.14, 'relative': 0.0, 'unit': 'barleycorn' }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e480, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario50-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e480"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario51">
      <xsl:message>When computing the length 1.0smoot</xsl:message>
      <x:scenario id="scenario51"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 1.0smoot</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'1.0smoot'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d454e1" select="'1.0smoot'"/>
            <xsl:sequence select="f:parse-length($impl:param-d454e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario51-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario51-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e484"
                    select="map { 'magnitude': $default-length-magnitude,                            'relative': 0.0,                             'unit': $default-length-unit }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e484, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario51-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e484"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario52">
      <xsl:message>When computing the length 25%</xsl:message>
      <x:scenario id="scenario52"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 25%</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'25%'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d460e1" select="'25%'"/>
            <xsl:sequence select="f:parse-length($impl:param-d460e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario52-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario52-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e488"
                    select="map { 'magnitude': 25.0, 'relative': 0.0, 'unit': '%' }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e488, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario52-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e488"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario53">
      <xsl:message>When computing the length 100%</xsl:message>
      <x:scenario id="scenario53"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 100%</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'100%'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d466e1" select="'100%'"/>
            <xsl:sequence select="f:parse-length($impl:param-d466e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario53-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario53-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e492"
                    select="map { 'magnitude': 100.0, 'relative': 0.0, 'unit': '%' }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e492, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario53-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e492"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario54">
      <xsl:message>When computing the length 125%</xsl:message>
      <x:scenario id="scenario54"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 125%</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'125%'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d472e1" select="'125%'"/>
            <xsl:sequence select="f:parse-length($impl:param-d472e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario54-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario54-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e496"
                    select="map { 'magnitude': 125.0, 'relative': 0.0, 'unit': '%' }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e496, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario54-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e496"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario55">
      <xsl:message>When computing the length 3*+0.5in</xsl:message>
      <x:scenario id="scenario55"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 3*+0.5in</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'3*+0.5in'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d478e1" select="'3*+0.5in'"/>
            <xsl:sequence select="f:parse-length($impl:param-d478e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario55-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario55-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e500"
                    select="map { 'magnitude': 0.5, 'unit': 'in', 'relative': 3.0 }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e500, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario55-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e500"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario56">
      <xsl:message>When computing the length 75</xsl:message>
      <x:scenario id="scenario56"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 75</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'75'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d484e1" select="'75'"/>
            <xsl:sequence select="f:parse-length($impl:param-d484e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario56-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario56-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e504"
                    select="map { 'magnitude': 75, 'relative': 0.0, 'unit': 'px' }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e504, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario56-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e504"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions" name="x:scenario57">
      <xsl:message>When computing the length 2.5*</xsl:message>
      <x:scenario id="scenario57"
                  xspec="file:/home/circleci/repo/build/xspec/units.xspec">
         <x:label>When computing the length 2.5*</x:label>
         <x:call>
            <xsl:attribute name="function">f:parse-length</xsl:attribute>
            <x:param>
               <xsl:attribute name="select">'2.5*'</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d490e1" select="'2.5*'"/>
            <xsl:sequence select="f:parse-length($impl:param-d490e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario57-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns:f="http://docbook.org/ns/docbook/functions"
                 name="x:scenario57-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>return the correct parse</xsl:message>
      <xsl:variable name="impl:expect-d15e508"
                    select="map { 'magnitude': 0, 'unit': 'px', 'relative': 2.5 }"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e508, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario57-expect1" successful="{$impl:successful}">
         <x:label>return the correct parse</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e508"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario58">
      <xsl:message>When converting an address in the raw style</xsl:message>
      <x:scenario id="scenario58"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting an address in the raw style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'raw'</xsl:attribute>
            </x:param>
            <address>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </address>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d496e0-doc"
                          as="document-node()">
               <xsl:document>
                  <address>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </address>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d496e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d496e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'raw'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d496e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario58-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario58-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e519-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class" select="'', ''" separator="address verbatim"/>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e519" as="item()*">
         <xsl:for-each select="$impl:expect-d15e519-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e519, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario58-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e519"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario59">
      <xsl:message>When converting a literallayout in the raw style</xsl:message>
      <x:scenario id="scenario59"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a literallayout in the raw style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'raw'</xsl:attribute>
            </x:param>
            <literallayout>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </literallayout>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d502e0-doc"
                          as="document-node()">
               <xsl:document>
                  <literallayout>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </literallayout>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d502e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d502e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'raw'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d502e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario59-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario59-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e530-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class" select="'', ''" separator="literallayout verbatim"/>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e530" as="item()*">
         <xsl:for-each select="$impl:expect-d15e530-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e530, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario59-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e530"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario60">
      <xsl:message>When converting a programlisting in the raw style</xsl:message>
      <x:scenario id="scenario60"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a programlisting in the raw style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'raw'</xsl:attribute>
            </x:param>
            <programlisting>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </programlisting>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d508e0-doc"
                          as="document-node()">
               <xsl:document>
                  <programlisting>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </programlisting>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d508e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d508e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'raw'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d508e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario60-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario60-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e541-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="language-none numbered programlisting verbatim"/>
                  <code>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </code>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e541" as="item()*">
         <xsl:for-each select="$impl:expect-d15e541-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e541, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario60-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e541"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario61">
      <xsl:message>When converting a screen in the raw style</xsl:message>
      <x:scenario id="scenario61"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a screen in the raw style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'raw'</xsl:attribute>
            </x:param>
            <screen>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </screen>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d514e0-doc"
                          as="document-node()">
               <xsl:document>
                  <screen>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </screen>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d514e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d514e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'raw'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d514e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario61-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario61-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e553-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class" select="'', ''" separator="screen verbatim"/>
                  <code>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </code>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e553" as="item()*">
         <xsl:for-each select="$impl:expect-d15e553-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e553, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario61-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e553"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario62">
      <xsl:message>When converting a synopsis in the raw style</xsl:message>
      <x:scenario id="scenario62"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a synopsis in the raw style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'raw'</xsl:attribute>
            </x:param>
            <synopsis>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </synopsis>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d520e0-doc"
                          as="document-node()">
               <xsl:document>
                  <synopsis>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </synopsis>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d520e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d520e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'raw'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d520e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario62-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario62-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e565-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class" select="'', ''" separator="synopsis verbatim"/>
                  <code>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </code>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e565" as="item()*">
         <xsl:for-each select="$impl:expect-d15e565-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e565, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario62-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e565"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario63">
      <xsl:message>When converting a verbatim with inline markup in the raw style</xsl:message>
      <x:scenario id="scenario63"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a verbatim with inline markup in the raw style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'raw'</xsl:attribute>
            </x:param>
            <programlisting>
               <xsl:text>Line one
Line </xsl:text>
               <emphasis>
                  <xsl:text>two</xsl:text>
               </emphasis>
               <xsl:text>
Line </xsl:text>
               <emphasis>
                  <xsl:text>end of three
start of four</xsl:text>
               </emphasis>
               <xsl:text>
Line five</xsl:text>
            </programlisting>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d526e0-doc"
                          as="document-node()">
               <xsl:document>
                  <programlisting>
                     <xsl:text>Line one
Line </xsl:text>
                     <emphasis>
                        <xsl:text>two</xsl:text>
                     </emphasis>
                     <xsl:text>
Line </xsl:text>
                     <emphasis>
                        <xsl:text>end of three
start of four</xsl:text>
                     </emphasis>
                     <xsl:text>
Line five</xsl:text>
                  </programlisting>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d526e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d526e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'raw'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d526e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario63-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario63-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>the inline markup should be transformed.</xsl:message>
      <xsl:variable name="impl:expect-d15e587-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="language-none numbered programlisting verbatim"/>
                  <code>
                     <xsl:text>Line one
Line </xsl:text>
                     <em>
                        <xsl:text>two</xsl:text>
                     </em>
                     <xsl:text>
Line </xsl:text>
                     <em>
                        <xsl:text>end of three
start of four</xsl:text>
                     </em>
                     <xsl:text>
Line five</xsl:text>
                  </code>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e587" as="item()*">
         <xsl:for-each select="$impl:expect-d15e587-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e587, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario63-expect1" successful="{$impl:successful}">
         <x:label>the inline markup should be transformed.</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e587"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario64">
      <xsl:message>When converting an address in the plain style</xsl:message>
      <x:scenario id="scenario64"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting an address in the plain style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'plain'</xsl:attribute>
            </x:param>
            <address>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </address>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d532e0-doc"
                          as="document-node()">
               <xsl:document>
                  <address>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </address>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d532e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d532e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'plain'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d532e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario64-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario64-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e610-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class" select="'', ''" separator="address verbatim"/>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e610" as="item()*">
         <xsl:for-each select="$impl:expect-d15e610-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e610, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario64-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e610"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario65">
      <xsl:message>When converting a literallayout in the plain style</xsl:message>
      <x:scenario id="scenario65"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a literallayout in the plain style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'plain'</xsl:attribute>
            </x:param>
            <literallayout>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </literallayout>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d538e0-doc"
                          as="document-node()">
               <xsl:document>
                  <literallayout>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </literallayout>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d538e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d538e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'plain'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d538e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario65-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario65-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e621-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class" select="'', ''" separator="literallayout verbatim"/>
                  <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e621" as="item()*">
         <xsl:for-each select="$impl:expect-d15e621-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e621, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario65-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e621"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario66">
      <xsl:message>When converting a programlisting in the plain style</xsl:message>
      <x:scenario id="scenario66"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a programlisting in the plain style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'plain'</xsl:attribute>
            </x:param>
            <programlisting>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </programlisting>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d544e0-doc"
                          as="document-node()">
               <xsl:document>
                  <programlisting>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </programlisting>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d544e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d544e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'plain'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d544e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario66-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario66-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e632-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="language-none numbered programlisting verbatim"/>
                  <code>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </code>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e632" as="item()*">
         <xsl:for-each select="$impl:expect-d15e632-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e632, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario66-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e632"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario67">
      <xsl:message>When converting a screen in the plain style</xsl:message>
      <x:scenario id="scenario67"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a screen in the plain style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'plain'</xsl:attribute>
            </x:param>
            <screen>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </screen>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d550e0-doc"
                          as="document-node()">
               <xsl:document>
                  <screen>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </screen>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d550e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d550e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'plain'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d550e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario67-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario67-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e644-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class" select="'', ''" separator="screen verbatim"/>
                  <code>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </code>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e644" as="item()*">
         <xsl:for-each select="$impl:expect-d15e644-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e644, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario67-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e644"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario68">
      <xsl:message>When converting a synopsis in the plain style</xsl:message>
      <x:scenario id="scenario68"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a synopsis in the plain style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'plain'</xsl:attribute>
            </x:param>
            <synopsis>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </synopsis>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d556e0-doc"
                          as="document-node()">
               <xsl:document>
                  <synopsis>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </synopsis>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d556e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d556e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'plain'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d556e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario68-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario68-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e657-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class" select="'', ''" separator="synopsis verbatim"/>
                  <code>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </code>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e657" as="item()*">
         <xsl:for-each select="$impl:expect-d15e657-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e657, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario68-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e657"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario69">
      <xsl:message>When converting a verbatim with inline markup in the plain style</xsl:message>
      <x:scenario id="scenario69"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a verbatim with inline markup in the plain style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="select">/*/*</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'plain'</xsl:attribute>
            </x:param>
            <div>
               <xsl:attribute name="xml:space" select="'', ''" separator="preserve"/>
               <programlisting>
                  <xsl:text>Line one
Line </xsl:text>
                  <emphasis>
                     <xsl:text>two</xsl:text>
                  </emphasis>
                  <xsl:text>
Line </xsl:text>
                  <emphasis>
                     <xsl:text>end of three
start of four</xsl:text>
                  </emphasis>
                  <xsl:text>
Line five</xsl:text>
               </programlisting>
            </div>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d562e0-doc"
                          as="document-node()">
               <xsl:document>
                  <div>
                     <xsl:attribute name="xml:space" select="'', ''" separator="preserve"/>
                     <programlisting>
                        <xsl:text>Line one
Line </xsl:text>
                        <emphasis>
                           <xsl:text>two</xsl:text>
                        </emphasis>
                        <xsl:text>
Line </xsl:text>
                        <emphasis>
                           <xsl:text>end of three
start of four</xsl:text>
                        </emphasis>
                        <xsl:text>
Line five</xsl:text>
                     </programlisting>
                  </div>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d562e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d562e0-doc">
                  <xsl:sequence select="/*/*"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'plain'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d562e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario69-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario69-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>the inline markup should be transformed.</xsl:message>
      <xsl:variable name="impl:expect-d15e681-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="language-none numbered programlisting verbatim"/>
                  <code>
                     <xsl:text>Line one
Line </xsl:text>
                     <em>
                        <xsl:text>two</xsl:text>
                     </em>
                     <xsl:text>
Line </xsl:text>
                     <em>
                        <xsl:text>end of three</xsl:text>
                     </em>
                     <xsl:text>
</xsl:text>
                     <em>
                        <xsl:text>start of four</xsl:text>
                     </em>
                     <xsl:text>
Line five</xsl:text>
                  </code>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e681" as="item()*">
         <xsl:for-each select="$impl:expect-d15e681-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e681, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario69-expect1" successful="{$impl:successful}">
         <x:label>the inline markup should be transformed.</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e681"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario70">
      <xsl:message>When converting an address in the lines style</xsl:message>
      <x:scenario id="scenario70"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting an address in the lines style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'lines'</xsl:attribute>
            </x:param>
            <address>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </address>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d568e0-doc"
                          as="document-node()">
               <xsl:document>
                  <address>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </address>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d568e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d568e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'lines'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d568e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario70-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario70-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e709-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class" select="'', ''" separator="address verbatim verblines"/>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <xsl:text>Line one</xsl:text>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <xsl:text>Line two</xsl:text>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="3"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <xsl:text>Line three</xsl:text>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="4"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <xsl:text>Line four</xsl:text>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="5"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <xsl:text>Line five</xsl:text>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e709" as="item()*">
         <xsl:for-each select="$impl:expect-d15e709-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e709, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario70-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e709"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario71">
      <xsl:message>When converting a literallayout in the lines style</xsl:message>
      <x:scenario id="scenario71"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a literallayout in the lines style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'lines'</xsl:attribute>
            </x:param>
            <literallayout>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </literallayout>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d574e0-doc"
                          as="document-node()">
               <xsl:document>
                  <literallayout>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </literallayout>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d574e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d574e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'lines'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d574e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario71-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario71-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e753-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="literallayout verbatim verblines"/>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <xsl:text>Line one</xsl:text>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <xsl:text>Line two</xsl:text>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="3"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <xsl:text>Line three</xsl:text>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="4"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <xsl:text>Line four</xsl:text>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="5"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <xsl:text>Line five</xsl:text>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e753" as="item()*">
         <xsl:for-each select="$impl:expect-d15e753-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e753, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario71-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e753"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario72">
      <xsl:message>When converting a programlisting in the lines style</xsl:message>
      <x:scenario id="scenario72"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a programlisting in the lines style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'lines'</xsl:attribute>
            </x:param>
            <programlisting>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </programlisting>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d580e0-doc"
                          as="document-node()">
               <xsl:document>
                  <programlisting>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </programlisting>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d580e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d580e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'lines'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d580e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario72-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario72-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e797-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <xsl:attribute name="db-startinglinenumber" select="'', ''" separator="1"/>
               <xsl:attribute name="db-numberoflines" select="'', ''" separator="5"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="language-none long numbered programlisting verbatim verblines"/>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                        <xsl:text>1</xsl:text>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line one</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line two</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="3"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line three</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="4"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line four</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="5"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                        <xsl:text>5</xsl:text>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line five</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e797" as="item()*">
         <xsl:for-each select="$impl:expect-d15e797-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e797, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario72-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e797"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario73">
      <xsl:message>When converting a screen in the lines style</xsl:message>
      <x:scenario id="scenario73"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a screen in the lines style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'lines'</xsl:attribute>
            </x:param>
            <screen>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </screen>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d586e0-doc"
                          as="document-node()">
               <xsl:document>
                  <screen>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </screen>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d586e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d586e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'lines'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d586e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario73-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario73-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e850-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class" select="'', ''" separator="screen verbatim verblines"/>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line one</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line two</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="3"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line three</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="4"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line four</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="5"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line five</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e850" as="item()*">
         <xsl:for-each select="$impl:expect-d15e850-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e850, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario73-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e850"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario74">
      <xsl:message>When converting a synopsis in the lines style</xsl:message>
      <x:scenario id="scenario74"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a synopsis in the lines style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'lines'</xsl:attribute>
            </x:param>
            <synopsis>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </synopsis>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d592e0-doc"
                          as="document-node()">
               <xsl:document>
                  <synopsis>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </synopsis>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d592e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d592e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'lines'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d592e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario74-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario74-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>you should get all the lines</xsl:message>
      <xsl:variable name="impl:expect-d15e899-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="synopsis verbatim verblines"/>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line one</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line two</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="3"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line three</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="4"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line four</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="5"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line five</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e899" as="item()*">
         <xsl:for-each select="$impl:expect-d15e899-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e899, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario74-expect1" successful="{$impl:successful}">
         <x:label>you should get all the lines</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e899"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario75">
      <xsl:message>When converting a verbatim with inline markup in the lines style</xsl:message>
      <x:scenario id="scenario75"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a verbatim with inline markup in the lines style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'lines'</xsl:attribute>
            </x:param>
            <programlisting>
               <xsl:text>Line one
Line </xsl:text>
               <emphasis>
                  <xsl:text>two</xsl:text>
               </emphasis>
               <xsl:text>
Line </xsl:text>
               <emphasis>
                  <xsl:text>end of three
Start of line</xsl:text>
               </emphasis>
               <xsl:text> four
Line five</xsl:text>
            </programlisting>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d598e0-doc"
                          as="document-node()">
               <xsl:document>
                  <programlisting>
                     <xsl:text>Line one
Line </xsl:text>
                     <emphasis>
                        <xsl:text>two</xsl:text>
                     </emphasis>
                     <xsl:text>
Line </xsl:text>
                     <emphasis>
                        <xsl:text>end of three
Start of line</xsl:text>
                     </emphasis>
                     <xsl:text> four
Line five</xsl:text>
                  </programlisting>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d598e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d598e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'lines'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d598e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario75-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario75-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>the inline markup should not cross line boundaries.</xsl:message>
      <xsl:variable name="impl:expect-d15e958-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <xsl:attribute name="db-startinglinenumber" select="'', ''" separator="1"/>
               <xsl:attribute name="db-numberoflines" select="'', ''" separator="5"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="language-none long numbered programlisting verbatim verblines"/>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                        <xsl:text>1</xsl:text>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line one</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line </xsl:text>
                           <em>
                              <xsl:text>two</xsl:text>
                           </em>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="3"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line </xsl:text>
                           <em>
                              <xsl:text>end of three</xsl:text>
                           </em>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="4"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <em>
                              <xsl:text>Start of line</xsl:text>
                           </em>
                           <xsl:text> four</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="5"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                        <xsl:text>5</xsl:text>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line five</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e958" as="item()*">
         <xsl:for-each select="$impl:expect-d15e958-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e958, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario75-expect1" successful="{$impl:successful}">
         <x:label>the inline markup should not cross line boundaries.</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e958"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario76">
      <xsl:message>When converting a verbatim with inline markup in the lines style</xsl:message>
      <x:scenario id="scenario76"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When converting a verbatim with inline markup in the lines style</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'lines'</xsl:attribute>
            </x:param>
            <programlisting>
               <xsl:text>Line one
Line </xsl:text>
               <emphasis>
                  <xsl:attribute name="xml:id" select="'', ''" separator="two"/>
                  <xsl:text>two</xsl:text>
               </emphasis>
               <xsl:text>
Line </xsl:text>
               <emphasis>
                  <xsl:attribute name="xml:id" select="'', ''" separator="three"/>
                  <xsl:text>end of three
Start of line</xsl:text>
               </emphasis>
               <xsl:text> four
Line five</xsl:text>
            </programlisting>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d604e0-doc"
                          as="document-node()">
               <xsl:document>
                  <programlisting>
                     <xsl:text>Line one
Line </xsl:text>
                     <emphasis>
                        <xsl:attribute name="xml:id" select="'', ''" separator="two"/>
                        <xsl:text>two</xsl:text>
                     </emphasis>
                     <xsl:text>
Line </xsl:text>
                     <emphasis>
                        <xsl:attribute name="xml:id" select="'', ''" separator="three"/>
                        <xsl:text>end of three
Start of line</xsl:text>
                     </emphasis>
                     <xsl:text> four
Line five</xsl:text>
                  </programlisting>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d604e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d604e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'lines'"/>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d604e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario76-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario76-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>ID attributes should not be repeated.</xsl:message>
      <xsl:variable name="impl:expect-d15e1030-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <xsl:attribute name="db-startinglinenumber" select="'', ''" separator="1"/>
               <xsl:attribute name="db-numberoflines" select="'', ''" separator="5"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="language-none long numbered programlisting verbatim verblines"/>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                        <xsl:text>1</xsl:text>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line one</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line </xsl:text>
                           <em>
                              <xsl:attribute name="id" select="'', ''" separator="two"/>
                              <xsl:text>two</xsl:text>
                           </em>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="3"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line </xsl:text>
                           <em>
                              <xsl:attribute name="id" select="'', ''" separator="three"/>
                              <xsl:text>end of three</xsl:text>
                           </em>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="4"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <em>
                              <xsl:text>Start of line</xsl:text>
                           </em>
                           <xsl:text> four</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="5"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                        <xsl:text>5</xsl:text>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line five</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e1030" as="item()*">
         <xsl:for-each select="$impl:expect-d15e1030-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e1030, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario76-expect1" successful="{$impl:successful}">
         <x:label>ID attributes should not be repeated.</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e1030"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario77">
      <xsl:message>When callouts are added to a verbatim element</xsl:message>
      <x:scenario id="scenario77"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When callouts are added to a verbatim element</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'lines'</xsl:attribute>
            </x:param>
            <x:param>
               <xsl:attribute name="name">inject</xsl:attribute>
               <xsl:attribute name="as">element()</xsl:attribute>
               <areaspec>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="1 1"/>
                     <xsl:text>①</xsl:text>
                  </area>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="2 5"/>
                     <xsl:text>②</xsl:text>
                  </area>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="3 20"/>
                     <xsl:text>③</xsl:text>
                  </area>
               </areaspec>
            </x:param>
            <programlisting>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </programlisting>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d610e0-doc"
                          as="document-node()">
               <xsl:document>
                  <programlisting>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </programlisting>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d610e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d610e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'lines'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:param-d610e2-doc"
                          as="document-node()">
               <xsl:document>
                  <areaspec>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="1 1"/>
                        <xsl:text>①</xsl:text>
                     </area>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="2 5"/>
                        <xsl:text>②</xsl:text>
                     </area>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="3 20"/>
                        <xsl:text>③</xsl:text>
                     </area>
                  </areaspec>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="inject" as="element()">
               <xsl:for-each select="$impl:param-d610e2-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d610e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
               <xsl:with-param name="inject" select="$inject" as="element()"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario77-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario77-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>they should appear in the output</xsl:message>
      <xsl:variable name="impl:expect-d15e1103-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <xsl:attribute name="db-startinglinenumber" select="'', ''" separator="1"/>
               <xsl:attribute name="db-numberoflines" select="'', ''" separator="5"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="language-none long numbered programlisting verbatim verblines"/>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                        <xsl:text>1</xsl:text>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <a>
                              <xsl:attribute name="id" select="'', ''" separator="R_area1"/>
                              <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                              <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                              <xsl:attribute name="db-column" select="'', ''" separator="1"/>
                              <xsl:text>①</xsl:text>
                           </a>
                           <xsl:text>Line one</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line</xsl:text>
                           <a>
                              <xsl:attribute name="id" select="'', ''" separator="R_area2"/>
                              <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                              <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                              <xsl:attribute name="db-column" select="'', ''" separator="5"/>
                              <xsl:text>②</xsl:text>
                           </a>
                           <xsl:text> two</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="3"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line three         </xsl:text>
                           <a>
                              <xsl:attribute name="id" select="'', ''" separator="R_area3"/>
                              <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                              <xsl:attribute name="db-line" select="'', ''" separator="3"/>
                              <xsl:attribute name="db-column" select="'', ''" separator="20"/>
                              <xsl:text>③</xsl:text>
                           </a>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="4"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line four</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="5"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                        <xsl:text>5</xsl:text>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line five</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e1103" as="item()*">
         <xsl:for-each select="$impl:expect-d15e1103-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e1103, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario77-expect1" successful="{$impl:successful}">
         <x:label>they should appear in the output</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e1103"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario78">
      <xsl:message>When callouts are added to a verbatim element</xsl:message>
      <x:scenario id="scenario78"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When callouts are added to a verbatim element</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'lines'</xsl:attribute>
            </x:param>
            <x:param>
               <xsl:attribute name="name">inject</xsl:attribute>
               <xsl:attribute name="as">element()</xsl:attribute>
               <areaspec>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="1 1"/>
                     <xsl:text>①</xsl:text>
                  </area>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="2 5"/>
                     <xsl:text>②</xsl:text>
                  </area>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="8 8"/>
                     <xsl:text>③</xsl:text>
                  </area>
               </areaspec>
            </x:param>
            <programlisting>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </programlisting>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d616e0-doc"
                          as="document-node()">
               <xsl:document>
                  <programlisting>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </programlisting>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d616e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d616e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'lines'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:param-d616e2-doc"
                          as="document-node()">
               <xsl:document>
                  <areaspec>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="1 1"/>
                        <xsl:text>①</xsl:text>
                     </area>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="2 5"/>
                        <xsl:text>②</xsl:text>
                     </area>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="8 8"/>
                        <xsl:text>③</xsl:text>
                     </area>
                  </areaspec>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="inject" as="element()">
               <xsl:for-each select="$impl:param-d616e2-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d616e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
               <xsl:with-param name="inject" select="$inject" as="element()"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario78-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario78-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>they can extend the listing</xsl:message>
      <xsl:variable name="impl:expect-d15e1179-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <xsl:attribute name="db-startinglinenumber" select="'', ''" separator="1"/>
               <xsl:attribute name="db-numberoflines" select="'', ''" separator="8"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="language-none long numbered programlisting verbatim verblines"/>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                        <xsl:text>1</xsl:text>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <a>
                              <xsl:attribute name="id" select="'', ''" separator="R_area1"/>
                              <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                              <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                              <xsl:attribute name="db-column" select="'', ''" separator="1"/>
                              <xsl:text>①</xsl:text>
                           </a>
                           <xsl:text>Line one</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line</xsl:text>
                           <a>
                              <xsl:attribute name="id" select="'', ''" separator="R_area2"/>
                              <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                              <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                              <xsl:attribute name="db-column" select="'', ''" separator="5"/>
                              <xsl:text>②</xsl:text>
                           </a>
                           <xsl:text> two</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="3"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line three</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="4"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line four</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="5"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                        <xsl:text>5</xsl:text>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>Line five</xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="6"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text> </xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="7"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text> </xsl:text>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
                  <span>
                     <xsl:attribute name="class" select="'', ''" separator="line"/>
                     <xsl:attribute name="db-line" select="'', ''" separator="8"/>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ln"/>
                     </span>
                     <span>
                        <xsl:attribute name="class" select="'', ''" separator="ld"/>
                        <code>
                           <xsl:text>       </xsl:text>
                           <a>
                              <xsl:attribute name="id" select="'', ''" separator="R_area3"/>
                              <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                              <xsl:attribute name="db-line" select="'', ''" separator="8"/>
                              <xsl:attribute name="db-column" select="'', ''" separator="8"/>
                              <xsl:text>③</xsl:text>
                           </a>
                        </code>
                     </span>
                  </span>
                  <xsl:text>
</xsl:text>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e1179" as="item()*">
         <xsl:for-each select="$impl:expect-d15e1179-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e1179, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario78-expect1" successful="{$impl:successful}">
         <x:label>they can extend the listing</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e1179"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario79">
      <xsl:message>When callouts are added to a verbatim element</xsl:message>
      <x:scenario id="scenario79"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When callouts are added to a verbatim element</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'plain'</xsl:attribute>
            </x:param>
            <x:param>
               <xsl:attribute name="name">inject</xsl:attribute>
               <xsl:attribute name="as">element()</xsl:attribute>
               <areaspec>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="1 1"/>
                     <xsl:text>①</xsl:text>
                  </area>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="2 5"/>
                     <xsl:text>②</xsl:text>
                  </area>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="3 20"/>
                     <xsl:text>③</xsl:text>
                  </area>
               </areaspec>
            </x:param>
            <programlisting>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </programlisting>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d622e0-doc"
                          as="document-node()">
               <xsl:document>
                  <programlisting>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </programlisting>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d622e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d622e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'plain'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:param-d622e2-doc"
                          as="document-node()">
               <xsl:document>
                  <areaspec>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="1 1"/>
                        <xsl:text>①</xsl:text>
                     </area>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="2 5"/>
                        <xsl:text>②</xsl:text>
                     </area>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="3 20"/>
                        <xsl:text>③</xsl:text>
                     </area>
                  </areaspec>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="inject" as="element()">
               <xsl:for-each select="$impl:param-d622e2-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d622e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
               <xsl:with-param name="inject" select="$inject" as="element()"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario79-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario79-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>plain mode also works</xsl:message>
      <xsl:variable name="impl:expect-d15e1279-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="language-none numbered programlisting verbatim"/>
                  <code>
                     <a>
                        <xsl:attribute name="id" select="'', ''" separator="R_area1"/>
                        <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                        <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                        <xsl:attribute name="db-column" select="'', ''" separator="1"/>
                        <xsl:text>①</xsl:text>
                     </a>
                     <xsl:text>Line one
Line</xsl:text>
                     <a>
                        <xsl:attribute name="id" select="'', ''" separator="R_area2"/>
                        <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                        <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                        <xsl:attribute name="db-column" select="'', ''" separator="5"/>
                        <xsl:text>②</xsl:text>
                     </a>
                     <xsl:text> two
Line three         </xsl:text>
                     <a>
                        <xsl:attribute name="id" select="'', ''" separator="R_area3"/>
                        <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                        <xsl:attribute name="db-line" select="'', ''" separator="3"/>
                        <xsl:attribute name="db-column" select="'', ''" separator="20"/>
                        <xsl:text>③</xsl:text>
                     </a>
                     <xsl:text>
Line four
Line five</xsl:text>
                  </code>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e1279" as="item()*">
         <xsl:for-each select="$impl:expect-d15e1279-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e1279, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario79-expect1" successful="{$impl:successful}">
         <x:label>plain mode also works</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e1279"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario80">
      <xsl:message>When callouts are added to a verbatim element</xsl:message>
      <x:scenario id="scenario80"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When callouts are added to a verbatim element</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'plain'</xsl:attribute>
            </x:param>
            <x:param>
               <xsl:attribute name="name">inject</xsl:attribute>
               <xsl:attribute name="as">element()</xsl:attribute>
               <areaspec>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="1 1"/>
                     <a xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:attribute name="name" select="'', ''" separator="one"/>
                        <xsl:text>①</xsl:text>
                     </a>
                  </area>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="2 5"/>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:attribute name="id" select="'', ''" separator="two"/>
                        <xsl:text>②</xsl:text>
                     </span>
                  </area>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="3 20"/>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:attribute name="id" select="'', ''" separator="three"/>
                        <xsl:attribute name="class" select="'', ''" separator="callout"/>
                        <xsl:text>③</xsl:text>
                     </span>
                  </area>
               </areaspec>
            </x:param>
            <programlisting>
               <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
            </programlisting>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d628e0-doc"
                          as="document-node()">
               <xsl:document>
                  <programlisting>
                     <xsl:text>Line one
Line two
Line three
Line four
Line five</xsl:text>
                  </programlisting>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d628e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d628e0-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'plain'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:param-d628e2-doc"
                          as="document-node()">
               <xsl:document>
                  <areaspec>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="1 1"/>
                        <a xmlns="http://www.w3.org/1999/xhtml">
                           <xsl:attribute name="name" select="'', ''" separator="one"/>
                           <xsl:text>①</xsl:text>
                        </a>
                     </area>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="2 5"/>
                        <span xmlns="http://www.w3.org/1999/xhtml">
                           <xsl:attribute name="id" select="'', ''" separator="two"/>
                           <xsl:text>②</xsl:text>
                        </span>
                     </area>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="3 20"/>
                        <span xmlns="http://www.w3.org/1999/xhtml">
                           <xsl:attribute name="id" select="'', ''" separator="three"/>
                           <xsl:attribute name="class" select="'', ''" separator="callout"/>
                           <xsl:text>③</xsl:text>
                        </span>
                     </area>
                  </areaspec>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="inject" as="element()">
               <xsl:for-each select="$impl:param-d628e2-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d628e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
               <xsl:with-param name="inject" select="$inject" as="element()"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario80-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario80-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>markup can also be inserted</xsl:message>
      <xsl:variable name="impl:expect-d15e1318-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="language-none numbered programlisting verbatim"/>
                  <code>
                     <a>
                        <xsl:attribute name="id" select="'', ''" separator="R_area1"/>
                        <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                        <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                        <xsl:attribute name="db-column" select="'', ''" separator="1"/>
                        <xsl:text>①</xsl:text>
                     </a>
                     <xsl:text>Line one
Line</xsl:text>
                     <a>
                        <xsl:attribute name="id" select="'', ''" separator="R_area2"/>
                        <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                        <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                        <xsl:attribute name="db-column" select="'', ''" separator="5"/>
                        <xsl:text>②</xsl:text>
                     </a>
                     <xsl:text> two
Line three         </xsl:text>
                     <a>
                        <xsl:attribute name="id" select="'', ''" separator="R_area3"/>
                        <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                        <xsl:attribute name="db-line" select="'', ''" separator="3"/>
                        <xsl:attribute name="db-column" select="'', ''" separator="20"/>
                        <xsl:text>③</xsl:text>
                     </a>
                     <xsl:text>
Line four
Line five</xsl:text>
                  </code>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e1318" as="item()*">
         <xsl:for-each select="$impl:expect-d15e1318-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e1318, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario80-expect1" successful="{$impl:successful}">
         <x:label>markup can also be inserted</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e1318"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario81">
      <xsl:message>When callouts are inserted into markup</xsl:message>
      <x:scenario id="scenario81"
                  xspec="file:/home/circleci/repo/build/xspec/verbatim.xspec">
         <x:label>When callouts are inserted into markup</x:label>
         <x:context xmlns="http://docbook.org/ns/docbook">
            <xsl:attribute name="select">/*/*</xsl:attribute>
            <xsl:attribute name="mode">m:docbook</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">style</xsl:attribute>
               <xsl:attribute name="select">'plain'</xsl:attribute>
            </x:param>
            <x:param>
               <xsl:attribute name="name">inject</xsl:attribute>
               <xsl:attribute name="as">element()</xsl:attribute>
               <areaspec>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="1 1"/>
                     <xsl:text>①</xsl:text>
                  </area>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="2 5"/>
                     <xsl:text>②</xsl:text>
                  </area>
                  <area>
                     <xsl:attribute name="coords" select="'', ''" separator="3 20"/>
                     <xsl:text>③</xsl:text>
                  </area>
               </areaspec>
            </x:param>
            <div>
               <xsl:attribute name="xml:space" select="'', ''" separator="preserve"/>
               <programlisting>
                  <emphasis>
                     <xsl:text>Line one</xsl:text>
                  </emphasis>
                  <xsl:text>
</xsl:text>
                  <emphasis>
                     <xsl:text>Line two
Line three
Line four</xsl:text>
                  </emphasis>
                  <xsl:text>
Line five</xsl:text>
               </programlisting>
            </div>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d634e0-doc"
                          as="document-node()">
               <xsl:document>
                  <div>
                     <xsl:attribute name="xml:space" select="'', ''" separator="preserve"/>
                     <programlisting>
                        <emphasis>
                           <xsl:text>Line one</xsl:text>
                        </emphasis>
                        <xsl:text>
</xsl:text>
                        <emphasis>
                           <xsl:text>Line two
Line three
Line four</xsl:text>
                        </emphasis>
                        <xsl:text>
Line five</xsl:text>
                     </programlisting>
                  </div>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:context-d634e0"
                          as="item()*">
               <xsl:for-each select="$impl:context-d634e0-doc">
                  <xsl:sequence select="/*/*"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="style" select="'plain'"/>
            <xsl:variable xmlns="http://docbook.org/ns/docbook"
                          name="impl:param-d634e2-doc"
                          as="document-node()">
               <xsl:document>
                  <areaspec>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="1 1"/>
                        <xsl:text>①</xsl:text>
                     </area>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="2 5"/>
                        <xsl:text>②</xsl:text>
                     </area>
                     <area>
                        <xsl:attribute name="coords" select="'', ''" separator="3 20"/>
                        <xsl:text>③</xsl:text>
                     </area>
                  </areaspec>
               </xsl:document>
            </xsl:variable>
            <xsl:variable xmlns="http://docbook.org/ns/docbook" name="inject" as="element()">
               <xsl:for-each select="$impl:param-d634e2-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates xmlns="http://docbook.org/ns/docbook"
                                 select="$impl:context-d634e0"
                                 mode="m:docbook">
               <xsl:with-param name="style" select="$style"/>
               <xsl:with-param name="inject" select="$inject" as="element()"/>
            </xsl:apply-templates>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario81-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template xmlns="http://www.w3.org/1999/xhtml"
                 xmlns:h="http://www.w3.org/1999/xhtml"
                 xmlns:m="http://docbook.org/ns/docbook/modes"
                 name="x:scenario81-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>they interrupt that markup</xsl:message>
      <xsl:variable name="impl:expect-d15e1364-doc" as="document-node()">
         <xsl:document>
            <div>
               <xsl:attribute name="class" select="'', ''" separator="pre-wrap"/>
               <pre>
                  <xsl:attribute name="class"
                                 select="'', ''"
                                 separator="language-none numbered programlisting verbatim"/>
                  <code>
                     <a>
                        <xsl:attribute name="id" select="'', ''" separator="R_area1"/>
                        <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                        <xsl:attribute name="db-line" select="'', ''" separator="1"/>
                        <xsl:attribute name="db-column" select="'', ''" separator="1"/>
                        <xsl:text>①</xsl:text>
                     </a>
                     <em>
                        <xsl:text>Line one</xsl:text>
                     </em>
                     <xsl:text>
</xsl:text>
                     <em>
                        <xsl:text>Line</xsl:text>
                     </em>
                     <a>
                        <xsl:attribute name="id" select="'', ''" separator="R_area2"/>
                        <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                        <xsl:attribute name="db-line" select="'', ''" separator="2"/>
                        <xsl:attribute name="db-column" select="'', ''" separator="5"/>
                        <xsl:text>②</xsl:text>
                     </a>
                     <em>
                        <xsl:text> two</xsl:text>
                     </em>
                     <xsl:text>
</xsl:text>
                     <em>
                        <xsl:text>Line three</xsl:text>
                     </em>
                     <xsl:text>         </xsl:text>
                     <a>
                        <xsl:attribute name="id" select="'', ''" separator="R_area3"/>
                        <xsl:attribute name="class" select="'', ''" separator="callout-bug linecolumn"/>
                        <xsl:attribute name="db-line" select="'', ''" separator="3"/>
                        <xsl:attribute name="db-column" select="'', ''" separator="20"/>
                        <xsl:text>③</xsl:text>
                     </a>
                     <xsl:text>
</xsl:text>
                     <em>
                        <xsl:text>Line four</xsl:text>
                     </em>
                     <xsl:text>
Line five</xsl:text>
                  </code>
               </pre>
            </div>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d15e1364" as="item()*">
         <xsl:for-each select="$impl:expect-d15e1364-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d15e1364, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario81-expect1" successful="{$impl:successful}">
         <x:label>they interrupt that markup</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d15e1364"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>
