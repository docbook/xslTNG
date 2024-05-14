<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:file="http://expath.org/ns/file"
  xmlns:ghost="http://docbook.org/ns/docbook/ephemeral" xmlns:h="http://www.w3.org/1999/xhtml"
  xmlns:mp="http://docbook.org/ns/docbook/modes/private"
  xmlns:t="http://docbook.org/ns/docbook/templates"
  xmlns:tp="http://docbook.org/ns/docbook/templates/private"
  xmlns:v="http://docbook.org/ns/docbook/variables"
  xmlns:vp="http://docbook.org/ns/docbook/variables/private"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="#all" version="3.0">

  <xsl:template name="tp:mediaobjects-copyinstructions">
    <xsl:param name="html" as="document-node()"/>
    <xsl:choose>
      <xsl:when test="$copyinstructions-uri and exists($vp:absolute-mediaobject-output-base-uri)">
        <xsl:variable name="instructions" as="map(*)*">
          <xsl:apply-templates select="$html//h:img[@ghost:sourcefile]"
            mode="mp:mediaobject-copy-instruction"/>
        </xsl:variable>
        <xsl:if test="exists($instructions)" use-when="function-available('file:copy')">
          <xsl:call-template name="tp:copy-mediaobjects">
            <xsl:with-param name="instructions" as="map(*)+" select="$instructions"/>
          </xsl:call-template>
        </xsl:if>
        <xsl:if test="exists($instructions)" use-when="not(function-available('file:copy'))">
          <xsl:call-template name="t:write-copyinstructions">
            <xsl:with-param name="instructions" as="map(*)+" select="$instructions"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$copyinstructions-uri and not($vp:chunk-output-base-uri)">
        <xsl:message
          select="'Can''t construct copy instructions for mediaobjects: Don''t know absolute URI of mediaobject output base.'"
        />
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="tp:copy-mediaobjects" use-when="function-available('file:copy')">
    <xsl:param name="instructions" as="map(xs:string, xs:anyURI)+" required="yes"/>
    <xsl:try>
      <xsl:result-document href="{$vp:copyinstructions-uri}">
        <mediaobjects xmlns="">
          <xsl:for-each select="$instructions">
            <xsl:try>
              <xsl:sequence select="file:copy(.?source, .?destination)"/>
              <copied source="{.?source}" destination="{.?destination}" result='successs'/>
              <xsl:catch>
                <error source="{.?source}" destination="{.?destination}">
                  <xsl:value-of select="$err:description"/>
                </error>
              </xsl:catch>
            </xsl:try>
          </xsl:for-each>
        </mediaobjects>
      </xsl:result-document>
      <xsl:message select="'Wrote ' || $vp:copyinstructions-uri" use-when="$v:debug = 'mediaobject-uris'"/>
      <xsl:catch>
        <xsl:message
          select="'Unable to write copyinstructions to ' || $vp:copyinstructions-uri || ': ' || $err:description"
        />
      </xsl:catch>
    </xsl:try>
  </xsl:template>

  <xsl:template name="t:write-copyinstructions">
    <xsl:param name="instructions" as="map(xs:string, xs:anyURI)+" required="yes"/>
    <xsl:try>
      <xsl:result-document href="{$vp:copyinstructions-uri}">
        <copyinstructions xmlns="">
          <xsl:for-each select="$instructions">
            <copy source="{.?source}" destination="{.?destination}"/>
          </xsl:for-each>
        </copyinstructions>
      </xsl:result-document>
      <xsl:message select="'Wrote ' || $vp:copyinstructions-uri" use-when="$v:debug = 'mediaobject-uris'"/>
      <xsl:catch>
        <xsl:message
          select="'Unable to write copyinstructions to ' || $vp:copyinstructions-uri || ': ' || $err:description"
        />
      </xsl:catch>
    </xsl:try>
  </xsl:template>

  <!-- mp:mediaobject-copy-instruction calculates for some HTML Elements a map which can support copy instructions  -->
  <xsl:mode name="mp:mediaobject-copy-instruction"/>

  <xsl:template match="h:img[@ghost:sourcefile]" mode="mp:mediaobject-copy-instruction"
    as="map(xs:string, xs:anyURI)?">
    <xsl:if test="exists($vp:absolute-mediaobject-output-base-uri)">
      <xsl:variable name="destination" as="xs:anyURI" select="resolve-uri(@src, $vp:absolute-mediaobject-output-base-uri)" />
      <xsl:message
        select="'abs. uri (' || @src || ') &#x2192; ' || $destination" use-when="$v:debug = 'mediaobject-uris'"/>
      <xsl:sequence select="
          map {
            'source': @ghost:sourcefile => xs:anyURI(),
            'destination': $destination
          }"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="node()" mode="mp:mediaobject-copy-instruction" priority="-10"/>

</xsl:stylesheet>
