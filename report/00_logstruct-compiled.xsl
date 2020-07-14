<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:db="http://docbook.org/ns/docbook"
                xmlns:impl="urn:x-xspec:compile:xslt:impl"
                xmlns:test="http://www.jenitennison.com/xslt/unit-test"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="impl">
   <xsl:import href="file:/home/circleci/repo/build/xslt/transforms/00-logstruct.xsl"/>
   <xsl:import href="file:/home/circleci/repo/build/xspec-1.6.0/src/compiler/generate-tests-utils.xsl"/>
   <xsl:include href="file:/home/circleci/repo/build/xspec-1.6.0/src/common/xspec-utils.xsl"/>
   <xsl:output name="x:report" method="xml" indent="yes"/>
   <xsl:variable name="x:xspec-uri" as="xs:anyURI">file:/home/circleci/repo/build/xspec/00_logstruct.xspec</xsl:variable>
   <xsl:template name="x:main">
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('xsl:product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('xsl:product-version')"/>
      </xsl:message>
      <xsl:result-document format="x:report">
         <x:report stylesheet="file:/home/circleci/repo/build/xslt/transforms/00-logstruct.xsl"
                   date="{current-dateTime()}"
                   xspec="file:/home/circleci/repo/build/xspec/00_logstruct.xspec">
            <xsl:call-template name="x:scenario1"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:scenario1">
      <xsl:message>When setting up the logical structure</xsl:message>
      <x:scenario id="scenario1"
                  xspec="file:/home/circleci/repo/build/xspec/00_logstruct.xspec">
         <x:label>When setting up the logical structure </x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/entityref.001.xml</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d8e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/entityref.001.xml</xsl:variable>
            <xsl:variable name="impl:context-d8e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d8e0-uri)"/>
            <xsl:variable name="impl:context-d8e0" as="item()*">
               <xsl:for-each select="$impl:context-d8e0-doc">
                  <xsl:sequence select="."/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context-d8e0"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario1-expect1">
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
   <xsl:template xmlns="http://www.w3.org/1999/xhtml" name="x:scenario1-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect xml:base and entityref resolution</xsl:message>
      <xsl:variable name="impl:expect-d7e4-doc" as="document-node()">
         <xsl:document>
            <article xmlns="http://docbook.org/ns/docbook">
               <xsl:attribute name="version" select="'', ''" separator="5.0"/>
               <xsl:attribute name="xml:base" select="'', ''" separator="..."/>
               <xsl:text>
</xsl:text>
               <title>
                  <xsl:text>Unit test: entityref.001</xsl:text>
               </title>
               <xsl:text>
</xsl:text>
               <mediaobject>
                  <xsl:text>
</xsl:text>
                  <imageobject>
                     <xsl:text>
</xsl:text>
                     <imagedata>
                        <xsl:attribute name="format" select="'', ''" separator="PNG"/>
                        <xsl:attribute name="fileref" select="'', ''" separator="..."/>
                        <xsl:attribute name="width" select="'', ''" separator="6in"/>
                        <xsl:attribute name="align" select="'', ''" separator="right"/>
                     </imagedata>
                     <xsl:text>
</xsl:text>
                  </imageobject>
                  <xsl:text>
</xsl:text>
               </mediaobject>
               <xsl:text>
</xsl:text>
            </article>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expect-d7e4" as="item()*">
         <xsl:for-each select="$impl:expect-d7e4-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d7e4, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario1-expect1" successful="{$impl:successful}">
         <x:label>expect xml:base and entityref resolution</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d7e4"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:scenario1-expect2">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect an xml:base URI</xsl:message>
      <xsl:variable name="impl:expect-d7e26" select="()"/>
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
                  <xsl:sequence select="ends-with(/*/@xml:base, '/xml/entityref.001.xml')" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="ends-with(/*/@xml:base, '/xml/entityref.001.xml')" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d7e26, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario1-expect2" successful="{$impl:successful}">
         <x:label>expect an xml:base URI</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d7e26"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">ends-with(/*/@xml:base, '/xml/entityref.001.xml')</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:scenario1-expect3">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect fileref pointing to image</xsl:message>
      <xsl:variable name="impl:expect-d7e27" select="()"/>
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
                  <xsl:sequence select="ends-with(//db:imagedata/@fileref, '/media/duck-small.png')"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="ends-with(//db:imagedata/@fileref, '/media/duck-small.png')"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expect-d7e27, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario1-expect3" successful="{$impl:successful}">
         <x:label>expect fileref pointing to image</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d7e27"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">ends-with(//db:imagedata/@fileref, '/media/duck-small.png')</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>
