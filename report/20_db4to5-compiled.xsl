<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:db="http://docbook.org/ns/docbook"
                xmlns:impl="urn:x-xspec:compile:xslt:impl"
                xmlns:t="http://docbook.org/ns/docbook/templates"
                xmlns:test="http://www.jenitennison.com/xslt/unit-test"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="impl">
   <xsl:import href="file:/home/circleci/repo/build/xslt/transforms/20-db4to5.xsl"/>
   <xsl:import href="file:/home/circleci/repo/build/xspec-1.6.0/src/compiler/generate-tests-utils.xsl"/>
   <xsl:include href="file:/home/circleci/repo/build/xspec-1.6.0/src/common/xspec-utils.xsl"/>
   <xsl:output name="x:report" method="xml" indent="yes"/>
   <xsl:variable name="x:xspec-uri" as="xs:anyURI">file:/home/circleci/repo/build/xspec/20_db4to5.xspec</xsl:variable>
   <xsl:template name="x:main">
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('xsl:product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('xsl:product-version')"/>
      </xsl:message>
      <xsl:result-document format="x:report">
         <x:report stylesheet="file:/home/circleci/repo/build/xslt/transforms/20-db4to5.xsl"
                   date="{current-dateTime()}"
                   xspec="file:/home/circleci/repo/build/xspec/20_db4to5.xspec">
            <xsl:call-template name="x:scenario1"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:scenario1">
      <xsl:message>When transorming a db4 document</xsl:message>
      <x:scenario id="scenario1"
                  xspec="file:/home/circleci/repo/build/xspec/20_db4to5.xspec">
         <x:label>When transorming a db4 document</x:label>
         <x:call>
            <xsl:attribute name="template">t:main</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">context</xsl:attribute>
               <book>
                  <bookinfo>
                     <title>
                        <xsl:text>Some Book</xsl:text>
                     </title>
                  </bookinfo>
               </book>
               <chapter>
                  <title>
                     <xsl:text>A Chapter</xsl:text>
                  </title>
                  <para>
                     <xsl:text>Content</xsl:text>
                  </para>
               </chapter>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:param-d8e1-doc" as="document-node()">
               <xsl:document>
                  <book>
                     <bookinfo>
                        <title>
                           <xsl:text>Some Book</xsl:text>
                        </title>
                     </bookinfo>
                  </book>
                  <chapter>
                     <title>
                        <xsl:text>A Chapter</xsl:text>
                     </title>
                     <para>
                        <xsl:text>Content</xsl:text>
                     </para>
                  </chapter>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="context" as="item()*">
               <xsl:for-each select="$impl:param-d8e1-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:call-template name="t:main">
               <xsl:with-param name="context" select="$context"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario1-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario1-expect2">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:scenario1-expect3">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:scenario1-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>the root element to be in the DocBook namespace</xsl:message>
      <xsl:variable name="impl:expect-d7e15" select="()"/>
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
                  <xsl:sequence select="exists(/db:*)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="exists(/db:*)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d7e15, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario1-expect1" successful="{$impl:successful}">
         <x:label>the root element to be in the DocBook namespace</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d7e15"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">exists(/db:*)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:scenario1-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>the root element to have a version attribute</xsl:message>
      <xsl:variable name="impl:expect-d7e16" select="()"/>
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
                  <xsl:sequence select="/*/@version = '5.0'" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/*/@version = '5.0'" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d7e16, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario1-expect2" successful="{$impl:successful}">
         <x:label>the root element to have a version attribute</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d7e16"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">/*/@version = '5.0'</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:scenario1-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>the bookinfo element to be renamed</xsl:message>
      <xsl:variable name="impl:expect-d7e17" select="()"/>
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
                  <xsl:sequence select="exists(/*/db:info)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="exists(/*/db:info)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d7e17, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario1-expect3" successful="{$impl:successful}">
         <x:label>the bookinfo element to be renamed</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d7e17"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">exists(/*/db:info)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>
