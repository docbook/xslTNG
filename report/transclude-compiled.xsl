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
   <xsl:variable name="x:xspec-uri" as="xs:anyURI">file:/home/circleci/repo/build/xspec/transclude.xspec</xsl:variable>
   <xsl:param name="docbook-transclusion" select="'true'"/>
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
                   xspec="file:/home/circleci/repo/build/xspec/transclude.xspec">
            <xsl:call-template name="x:scenario1"/>
            <xsl:call-template name="x:scenario2"/>
            <xsl:call-template name="x:scenario3"/>
            <xsl:call-template name="x:scenario4"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:scenario1">
      <xsl:message>When transcluding with no fixup</xsl:message>
      <x:scenario id="scenario1"
                  xspec="file:/home/circleci/repo/build/xspec/transclude.xspec">
         <x:label>When transcluding with no fixup</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/transclusion.001.xml</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d8e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/transclusion.001.xml</xsl:variable>
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
      <xsl:message>expect it to produce the right results</xsl:message>
      <xsl:variable name="impl:expect-d7e5-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/transclusion.001.html</xsl:variable>
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
         <x:label>expect it to produce the right results</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d7e5"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:scenario2">
      <xsl:message>When transcluding with auto fixup</xsl:message>
      <x:scenario id="scenario2"
                  xspec="file:/home/circleci/repo/build/xspec/transclude.xspec">
         <x:label>When transcluding with auto fixup</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/transclusion.002.xml</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d14e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/transclusion.002.xml</xsl:variable>
            <xsl:variable name="impl:context-d14e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d14e0-uri)"/>
            <xsl:variable name="impl:context-d14e0" as="item()*">
               <xsl:for-each select="$impl:context-d14e0-doc">
                  <xsl:sequence select="."/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context-d14e0"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario2-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:scenario2-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect it to produce the right results</xsl:message>
      <xsl:variable name="impl:expect-d7e8-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/transclusion.002.html</xsl:variable>
      <xsl:variable name="impl:expect-d7e8-doc"
                    as="document-node()"
                    select="doc($impl:expect-d7e8-uri)"/>
      <xsl:variable name="impl:expect-d7e8" as="item()*">
         <xsl:for-each select="$impl:expect-d7e8-doc">
            <xsl:sequence select="."/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d7e8, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario2-expect1" successful="{$impl:successful}">
         <x:label>expect it to produce the right results</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d7e8"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:scenario3">
      <xsl:message>When transcluding with suffix fixup</xsl:message>
      <x:scenario id="scenario3"
                  xspec="file:/home/circleci/repo/build/xspec/transclude.xspec">
         <x:label>When transcluding with suffix fixup</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/transclusion.003.xml</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d20e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/transclusion.003.xml</xsl:variable>
            <xsl:variable name="impl:context-d20e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d20e0-uri)"/>
            <xsl:variable name="impl:context-d20e0" as="item()*">
               <xsl:for-each select="$impl:context-d20e0-doc">
                  <xsl:sequence select="."/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context-d20e0"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario3-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:scenario3-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect it to produce the right results</xsl:message>
      <xsl:variable name="impl:expect-d7e11-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/transclusion.003.html</xsl:variable>
      <xsl:variable name="impl:expect-d7e11-doc"
                    as="document-node()"
                    select="doc($impl:expect-d7e11-uri)"/>
      <xsl:variable name="impl:expect-d7e11" as="item()*">
         <xsl:for-each select="$impl:expect-d7e11-doc">
            <xsl:sequence select="."/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d7e11, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario3-expect1" successful="{$impl:successful}">
         <x:label>expect it to produce the right results</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d7e11"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:scenario4">
      <xsl:message>When transcluding with local suffix fixup</xsl:message>
      <x:scenario id="scenario4"
                  xspec="file:/home/circleci/repo/build/xspec/transclude.xspec">
         <x:label>When transcluding with local suffix fixup</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/circleci/repo/src/test/resources/xml/transclusion.004.xml</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-d26e0-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/xml/transclusion.004.xml</xsl:variable>
            <xsl:variable name="impl:context-d26e0-doc"
                          as="document-node()"
                          select="doc($impl:context-d26e0-uri)"/>
            <xsl:variable name="impl:context-d26e0" as="item()*">
               <xsl:for-each select="$impl:context-d26e0-doc">
                  <xsl:sequence select="."/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context-d26e0"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:scenario4-expect1">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:scenario4-expect1">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>expect it to produce the right results</xsl:message>
      <xsl:variable name="impl:expect-d7e14-uri" as="xs:anyURI">file:/home/circleci/repo/src/test/resources/expected/transclusion.004.html</xsl:variable>
      <xsl:variable name="impl:expect-d7e14-doc"
                    as="document-node()"
                    select="doc($impl:expect-d7e14-uri)"/>
      <xsl:variable name="impl:expect-d7e14" as="item()*">
         <xsl:for-each select="$impl:expect-d7e14-doc">
            <xsl:sequence select="."/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expect-d7e14, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test id="scenario4-expect1" successful="{$impl:successful}">
         <x:label>expect it to produce the right results</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expect-d7e14"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>
