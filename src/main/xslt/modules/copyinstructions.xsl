<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:file="http://expath.org/ns/file"
  xmlns:ext="http://docbook.org/extensions/xslt"
  xmlns:ghost="http://docbook.org/ns/docbook/ephemeral" xmlns:h="http://www.w3.org/1999/xhtml"
  xmlns:mp="http://docbook.org/ns/docbook/modes/private"
  xmlns:t="http://docbook.org/ns/docbook/templates"
  xmlns:tp="http://docbook.org/ns/docbook/templates/private"
  xmlns:fp="http://docbook.org/ns/docbook/functions/private"
  xmlns:v="http://docbook.org/ns/docbook/variables"
  xmlns:vp="http://docbook.org/ns/docbook/variables/private"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="#all" version="3.0">

  <!-- Tries to find the absolute URI for the mediaobjects base directory, that is, the URI
   |   where all the relative img/@src pathes have to be resolved against. -->
  <xsl:function name="fp:mediaobject-basedirectory" as="xs:anyURI?">
    <xsl:param name="current-output-directory" as="xs:string?"/>
    <xsl:variable name="result" as="xs:string?">
      <xsl:choose>
        <xsl:when test="exists($v:mediaobject-output-base-uri)">
          <!-- This value is calculated from the $mediaobject-output-base-uri parameter. 
               If the parameter is the empty string, then this value is the empty sequence. 
               Otherwise, this value is the value of the $mediaobject-output-base-uri parameter. 
               The trailing slash is guaranteed.-->
          <xsl:sequence select="
              let $base := ($vp:chunk-output-base-uri, $current-output-directory)[1]
              return
                resolve-uri($v:mediaobject-output-base-uri, $base)"/>
        </xsl:when>
        <xsl:when test="$v:chunk">
          <!-- When chunk is requested, vp:chunk-output-base-uri is what we are looking for.
               A trailing slah is added if neccessary.-->
          <xsl:sequence select="
              if (ends-with($vp:chunk-output-base-uri, '/')) then
                $vp:chunk-output-base-uri
              else
                concat($vp:chunk-output-base-uri, '/')"/>
        </xsl:when>
        <xsl:when test="$current-output-directory">
          <!-- Chunk is not requested, and the base uri for mediaobjects is not explicitly set.
               This might be the simple default case of translating the input into a single HTML file,
               especially when PDF is intended. 
               $current-output-directory is computed in docbook.xsl from fn:current-output-uri() if possible.
               The trailing slash is guaranteed. -->
          <xsl:sequence select="$current-output-directory"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$result gt '' and $result castable as xs:anyURI">
        <xsl:message select="'Base-URI for media files is ' || $result"
          use-when="$v:debug = 'mediaobject-uris'"/>
        <xsl:sequence select="xs:anyURI($result)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message
          select="'Warning: Can''t calculate mediaobjects basedirectory (current output directory is ' || $current-output-directory || ').'"
        />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!-- returns a map with instructions to copy $mediaobjects
   |   from their source to to place where the generated file expects them
   |   taken into account the mediaobject-basedirectory.
   |   Each entry in the map has copy destination as key and copy source as value.
   |   This guarantees only on copy for each mediaobject,
   |   even if it is referenced many times in the generated HTML-->
  <xsl:function name="fp:instructions" as="map(xs:anyURI, xs:anyURI)">
    <xsl:param name="mediaobjects" as="element()*"/>
    <xsl:param name="mediaobject-basedirectory" as="xs:anyURI?"/>
    <xsl:if test="$mediaobject-basedirectory and $mediaobjects">
      <xsl:variable name="entries" as="map(xs:anyURI, xs:anyURI)*">
        <xsl:apply-templates select="$mediaobjects" mode="mp:mediaobject-copy-instruction">
          <xsl:with-param name="mediaobject-basedirectory" select="$mediaobject-basedirectory"/>
        </xsl:apply-templates>
      </xsl:variable>
      <xsl:sequence select="map:merge($entries)"/>
    </xsl:if>
  </xsl:function>

  <!-- Calculates the URI where copyinstructions will be written 
   |   as absolute path from the stylesheet parameter $copyinstructions-uri. 
   |   If $copyinstructions-uri is absolute, it will be returned unchanged.
   |   If it is relative, it will be resolved against ext:cwd() if available, 
   |   $mediaobject-basedirectory otherwise-->
  <xsl:function name="fp:copyinstructions-uri" as="xs:anyURI">
    <xsl:param name="mediaobject-basedirectory" as="xs:anyURI"/>
    <xsl:variable name="base" as="xs:anyURI">
      <xsl:sequence select="ext:cwd()" use-when="function-available('ext:cwd')"/>
      <xsl:sequence select="$mediaobject-basedirectory"
        use-when="not(function-available('ext:cwd'))"/>
    </xsl:variable>
    <xsl:sequence select="resolve-uri($copyinstructions-uri, $base)"/>
  </xsl:function>

  <!-- Manages or supports managing of mediaobjects
   |   - if file:copy is available, perform copy of mediaobjects and write a log file
   |   - otherwise create a file with copy instructions giving source and destination
   ============================================================================== -->
  <xsl:template name="tp:mediaobjects-copyinstructions">
    <xsl:param name="mediaobjects" as="element()*"/>
    <xsl:param name="current-output-directory" as="xs:string?"/>
    <xsl:variable name="mediaobject-basedirectory" as="xs:anyURI?"
      select="fp:mediaobject-basedirectory($current-output-directory)"/>
    <xsl:variable name="instructions" as="map(*)"
      select="fp:instructions($mediaobjects, $mediaobject-basedirectory)"/>
    <xsl:if test="exists(map:keys($instructions))">
      <!-- now we can be sure that $mediaobject-basedirectory exists
       |   because it's a prerequisite for $instructions  -->
      <xsl:call-template name="tp:process-copyinstructions"
        use-when="function-available('file:copy')">
        <xsl:with-param name="instructions" as="map(*)" select="$instructions"/>
        <xsl:with-param name="href" select="fp:copyinstructions-uri($mediaobject-basedirectory)"/>
        <xsl:with-param name="mediaobject-basedirectory" select="$mediaobject-basedirectory"/>
      </xsl:call-template>
      <xsl:call-template name="t:write-copyinstructions"
        use-when="not(function-available('file:copy'))">
        <xsl:with-param name="instructions" as="map(*)" select="$instructions"/>
        <xsl:with-param name="href" select="fp:copyinstructions-uri($mediaobject-basedirectory)"/>
        <xsl:with-param name="mediaobject-basedirectory" select="$mediaobject-basedirectory"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  <!-- Process copy instructions when xpath:file is available -->
  <xsl:template name="tp:process-copyinstructions" use-when="function-available('file:copy')">
    <xsl:param name="instructions" as="map(*)"/>
    <xsl:param name="href" as="xs:anyURI"/>
    <xsl:param name="mediaobject-basedirectory" as="xs:anyURI?" required="no"/>
    <xsl:variable name="timestamp" as="xs:string"
      select="current-dateTime() => format-dateTime('[Y0001]-[M01]-[D01]T[H01]:[m01]:[s02]')"/>
    <xsl:try>
      <xsl:result-document href="{$href}" indent="yes" method="xml" omit-xml-declaration="no">
        <mediaobject-copyinstructions timestamp="{$timestamp}"
          basedirectory="{$mediaobject-basedirectory}" xmlns="">
          <xsl:for-each select="map:keys($instructions)">
            <xsl:variable name="sourcefile" as="xs:anyURI" select="$instructions(.)"/>
            <xsl:variable name="destfile" as="xs:anyURI" select="."/>
            <xsl:choose>
              <xsl:when test="file:exists($sourcefile)">
                <xsl:try>
                  <xsl:sequence select="file:copy($sourcefile, $destfile)"/>
                  <copied source="{$sourcefile}" destination="{$destfile}"/>
                  <xsl:catch>
                    <error source="{$sourcefile}" destination="{$destfile}">
                      <xsl:value-of select="$err:description"/>
                    </error>
                  </xsl:catch>
                </xsl:try>
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="msg" as="xs:string"
                  select="'Sourcefile ' || $sourcefile || ' does not exist.'"/>
                <xsl:message terminate="no" select="$msg"/>
                <error source="{$sourcefile}">
                  <xsl:text>Source File does not exist</xsl:text>
                </error>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </mediaobject-copyinstructions>
      </xsl:result-document>
      <xsl:message select="'Wrote log of mediaobject copy processing to ' || $href"
        use-when="$v:debug = 'mediaobject-uris'"/>
      <xsl:catch>
        <xsl:message
          select="'Warning: unable to write mediaobject copy instructions to file ' || $href || ': ' || $err:description"
        />
      </xsl:catch>
    </xsl:try>
  </xsl:template>
  
  <!-- Write copy instructions when expath:file is not available -->
  <xsl:template name="t:write-copyinstructions">
    <xsl:param name="instructions" as="map(*)"/>
    <xsl:param name="href" as="xs:anyURI"/>
    <xsl:param name="mediaobject-basedirectory" as="xs:anyURI?" required="no"/>
    <xsl:variable name="timestamp" as="xs:string"
      select="current-dateTime() => format-dateTime('[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01]')"/>
    <xsl:try>
      <xsl:result-document href="{$href}" indent="yes" method="xml" omit-xml-declaration="no">
        <mediaobject-copyinstructions timestamp="{$timestamp}"
          basedirectory="{$mediaobject-basedirectory}" xmlns="">
          <xsl:for-each select="map:keys($instructions)">
            <copy source="{$instructions(.)}" destination="{.}"/>
          </xsl:for-each>
        </mediaobject-copyinstructions>
      </xsl:result-document>
      <xsl:message select="'Wrote mediaobject copy instructions to ' || $href"
        use-when="$v:debug = 'mediaobject-uris'"/>
      <xsl:catch>
        <xsl:message
          select="'Warning: unable to write mediaobject copy instructions to file ' || $href || ': ' || $err:description"
        />
      </xsl:catch>
    </xsl:try>
  </xsl:template>
 
  <!-- mp:mediaobject-copy-instruction ==========================================================================
   |   calculates for some HTML Elements an map entry which can support copy instructions
   |   each entry is a map with copy destination as key and copy source as value
   |==========================================================================================================-->
  <xsl:mode name="mp:mediaobject-copy-instruction"/>

  <xsl:template match="h:img[@ghost:sourcefile]" mode="mp:mediaobject-copy-instruction"
    as="map(xs:anyURI, xs:anyURI)?">
    <xsl:param name="mediaobject-basedirectory" as="xs:anyURI"/>
    <xsl:try>
      <xsl:variable name="destination" as="xs:anyURI"
        select="resolve-uri(@src, $mediaobject-basedirectory)"/>
      <xsl:sequence select="map:entry($destination, xs:anyURI(@ghost:sourcefile))"/>
      <xsl:catch>
        <xsl:message
          select="'Warning: can''t create mediaobject copy instruction for ' || @src || ': ' || $err:description"
        />
      </xsl:catch>
    </xsl:try>
  </xsl:template>

  <xsl:template match="node()" mode="mp:mediaobject-copy-instruction" priority="-10">
    <xsl:message
      select="'Warning: mediaobject copyinstruction not yet implemented for ' || local-name() || '.'"
    />
  </xsl:template>

</xsl:stylesheet>
