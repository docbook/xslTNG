<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:ext="http://docbook.org/extensions/xslt"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:mp="http://docbook.org/ns/docbook/modes/private"
                xmlns:t="http://docbook.org/ns/docbook/templates"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:vp="http://docbook.org/ns/docbook/variables/private"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="db ext m map mp t v vp xs"
                version="3.0">

<!-- This will all be in XProc 3.0 eventually, hack for now... -->
<xsl:import href="param.xsl"/>
<xsl:variable name="v:debug" select="tokenize($debug, '\s')" static="yes"/>

<xsl:template match="/">
  <xsl:variable name="source" as="document-node()">
    <xsl:message use-when="'pipeline' = $v:debug"
                 select="'Preprocess: logical structure'"/>
    <xsl:sequence select="transform(map {
      'stylesheet-location': 'transforms/00-logstruct.xsl',
      'source-node': /
      })?output"/>
  </xsl:variable>

  <xsl:variable use-when="function-available('ext:xinclude')"
                name="source" as="document-node()">
    <xsl:message use-when="'pipeline' = $v:debug"
                 select="'Preprocess: xinclude'"/>
    <xsl:sequence select="transform(map {
      'stylesheet-location': 'transforms/10-xinclude.xsl',
      'source-node': $source
      })?output"/>
  </xsl:variable>

  <xsl:variable name="source" as="document-node()">
    <xsl:choose>
      <xsl:when test="namespace-uri($source/*) = ''">
        <xsl:message use-when="'pipeline' = $v:debug"
                     select="'Preprocess: DocBook 4.x to 5.0'"/>
        <xsl:sequence select="transform(map {
                              'stylesheet-location': 'transforms/20-db4to5.xsl',
                              'source-node': $source,
                              'stylesheet-params': map {
                                  QName('', 'base-uri'): base-uri($source/*)
                                }
                              })?output"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$source"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="source" as="document-node()">
    <xsl:message use-when="'pipeline' = $v:debug"
                 select="'Preprocess: transclude'"/>
    <xsl:sequence select="transform(map {
      'stylesheet-location': 'transforms/30-transclude.xsl',
      'source-node': $source,
      'stylesheet-params': map {
         QName('', 'psep'): $transclusion-prefix-separator
        }
      })?output"/>
  </xsl:variable>

  <!-- Profiling *isn't* done with an external transform
       because dynamic-profiling needs (potentially needs)
       access to all of the in-scope variables and parameters
       in this stylesheet -->

  <xsl:variable name="source" as="document-node()">
    <xsl:message use-when="'pipeline' = $v:debug"
                 select="'Preprocess: profile'"/>
    <xsl:apply-templates select="$source" mode="m:profile"/>
  </xsl:variable>

  <xsl:variable name="source" as="document-node()">
    <xsl:message use-when="'pipeline' = $v:debug"
                 select="'Preprocess: normalize'"/>
    <xsl:sequence select="transform(map {
      'stylesheet-location': 'transforms/50-normalize.xsl',
      'source-node': $source,
      'stylesheet-params': map {
         QName('', 'glossary-collection'): $glossary-collection,
         QName('', 'bibliography-collection'): $bibliography-collection,
         QName('', 'annotation-collection'): $annotation-collection
       }
      })?output"/>
  </xsl:variable>

  <xsl:variable name="source" as="document-node()">
    <xsl:message use-when="'pipeline' = $v:debug"
                 select="'Preprocess: annotations'"/>
    <xsl:sequence select="transform(map {
      'stylesheet-location': 'transforms/60-annotations.xsl',
      'source-node': $source
      })?output"/>
  </xsl:variable>

  <xsl:variable name="source" as="document-node()">
    <xsl:message use-when="'pipeline' = $v:debug"
                 select="'Preprocess: xlinkbase'"/>
    <xsl:sequence select="transform(map {
                          'stylesheet-location': 'transforms/70-xlinkbase.xsl',
                          'source-node': $source
                          })?output"/>
  </xsl:variable>

  <xsl:variable name="source" as="document-node()">
    <xsl:choose>
      <xsl:when test="exists($local-conventions)">
        <xsl:message use-when="'pipeline' = $v:debug"
                     select="'Preprocess: local-conventions'"/>
        <xsl:sequence select="transform(map {
                              'stylesheet-location': $local-conventions,
                              'source-node': $source
                              })?output"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$source"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable use-when="function-available('ext:validate-with-relax-ng')"
                name="source" as="document-node()">
    <xsl:choose>
      <xsl:when test="normalize-space($relax-ng-grammar) != ''">
        <xsl:message use-when="'pipeline' = $v:debug"
                     select="'Preprocess: validate'"/>
        <xsl:sequence
            select="ext:validate-with-relax-ng($source, $relax-ng-grammar)?document"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$source"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:if use-when="not(function-available('ext:validate-with-relax-ng'))"
          test="normalize-space($relax-ng-grammar) != ''">
    <xsl:message select="'Ignoring validation, extension unavailable'"/>
  </xsl:if>

  <xsl:sequence select="$source"/>
</xsl:template>

</xsl:stylesheet>
