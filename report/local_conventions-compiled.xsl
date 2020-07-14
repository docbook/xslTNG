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
   <xsl:variable name="x:xspec-uri" as="xs:anyURI">file:/home/circleci/repo/build/xspec/local_conventions.xspec</xsl:variable>
   <xsl:param name="local-conventions"
              select="resolve-uri('../src/test/resources/local.xsl')"/>
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
                   xspec="file:/home/circleci/repo/build/xspec/local_conventions.xspec">
            <xsl:call-template name="x:scenario1"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:scenario1">
      <xsl:message>When transforming local.001</xsl:message>
      <x:scenario id="scenario1"
                  xspec="file:/home/circleci/repo/build/xspec/local_conventions.xspec">
         <x:label>When transforming local.001</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/local.001.xml</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d8e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/local.001.xml</xsl:variable>
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
         <xsl:call-template name="x:scenario1-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:scenario1-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect the local conventions to be handled</xsl:message>
      <xsl:variable name="impl:expect-d7e5-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/local.001.html</xsl:variable>
      <xsl:variable name="impl:expect-d7e5-doc"
                    as="document-node()"
                    select="doc($impl:expect-d7e5-uri)"/>
      <xsl:variable name="impl:expect-d7e5" as="item()*">
         <xsl:for-each select="$impl:expect-d7e5-doc">
            <xsl:sequence select="."/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d7e5, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario1-expect1" successful="{$impl:successful}">
         <x:label>expect the local conventions to be handled</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d7e5"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>
