<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:db="http://docbook.org/ns/docbook"
                xmlns:err="http://www.w3.org/2005/xqt-errors" 
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:vp="http://docbook.org/ns/docbook/variables/private"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                version="3.0">
    
<!-- ===================================================================================
|    Functions designed for use independent from the xsTNG Stylesheets 
|    e. g. in Schematron rules  
|=================================================================================== -->

<xsl:variable name="v:pi-db-attributes-are-uris" as="xs:string*"
              select="('glossary-collection', 'bibliography-collection',
                       'annotation-collection')"/>
  
<!-- ====================================================================================
|    Functions for processing instructions and their pseudo attributes
|===================================================================================  -->  

<xsl:variable name="vp:pi-match"
              select="'^.*?(\c+)=[''&quot;](.*?)[''&quot;](.*)$'"/>  
  
<xsl:function name="f:pi" as="xs:string?" visibility="public">
  <xsl:param name="context" as="node()?"/>
  <xsl:param name="property" as="xs:string"/>
  <xsl:sequence select="f:pi($context, $property, ())"/>
</xsl:function>  

<xsl:function name="f:pi" as="xs:string*" visibility="public">
  <xsl:param name="context" as="node()?"/>
  <xsl:param name="property" as="xs:string"/>
  <xsl:param name="default" as="xs:string*"/>
  
  <xsl:choose>
    <xsl:when test="empty($context)">
      <xsl:sequence select="$default"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="fp:pi-from-list(($context/processing-instruction('db'),
                                             root($context)/processing-instruction('db')),
                                            $property, $default)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fp:pi-from-list" as="xs:string*">
  <xsl:param name="pis" as="processing-instruction()*"/>
  <xsl:param name="property" as="xs:string"/>
  <xsl:param name="default" as="xs:string*"/>

  <xsl:variable name="value"
                select="f:pi-attributes($pis)/@*[local-name(.) = $property]/string()"/>

  <xsl:sequence select="if (empty($value))
                        then $default
                        else $value"/>
</xsl:function>

<xsl:function name="f:pi-attributes" as="element()?">
  <xsl:param name="pis" as="processing-instruction()*"/>

  <xsl:variable name="attributes"
    select="fp:pi-attributes($pis, map { })"/>
  
  <xsl:element name="pis" namespace="">
    <xsl:for-each select="map:keys($attributes)">
      <xsl:attribute name="{.}" select="map:get($attributes, .)"/>
    </xsl:for-each>
  </xsl:element>
</xsl:function>  

<xsl:function name="fp:pi-attributes" as="map(*)?">
  <xsl:param name="pis" as="processing-instruction()*"/>
  <xsl:param name="pimap" as="map(*)"/>
  
  <xsl:choose>
    <xsl:when test="empty($pis)">
      <xsl:sequence select="$pimap"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="map"
                    select="fp:pi-pi-attributes($pimap, $pis[1], normalize-space($pis[1]))"/>
      <xsl:sequence select="fp:pi-attributes(subsequence($pis, 2), $map)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>
  
<xsl:function name="fp:pi-pi-attributes" as="map(*)">
  <xsl:param name="pimap" as="map(*)"/>
  <xsl:param name="pi" as="processing-instruction()"/>
  <xsl:param name="text" as="xs:string?"/>

  <xsl:choose>
    <xsl:when test="matches($text, $vp:pi-match)">
      <xsl:variable name="aname" select="replace($text, $vp:pi-match, '$1')"/>
      <xsl:variable name="avalue" select="replace($text, $vp:pi-match, '$2')"/>
      <xsl:variable name="rest" select="replace($text, $vp:pi-match, '$3')"/>

      <xsl:variable name="avalue-resolved"
                    select="if ($aname = $v:pi-db-attributes-are-uris)
                            then tokenize(normalize-space($avalue), '\s+') ! resolve-uri(., base-uri($pi))
                            else $avalue"/>

      <xsl:variable name="list-value"
                    select="if (map:contains($pimap, $aname))
                            then (map:get($pimap, $aname), $avalue-resolved)
                            else $avalue-resolved"/>
      <xsl:sequence
          select="fp:pi-pi-attributes(map:put($pimap, $aname, $list-value), $pi, $rest)"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="$pimap"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<!-- ===================================================================================
|   Support for automatic glossary and glossary-collection
|=================================================================================== -->

<!-- all glossentries for $term (glossterm, firstterm) 
     taking into account external glossaries 
     if designated by a db PI with glossary-collection pseudo attribute. -->
<xsl:function name="f:glossentries" as="element(db:glossentry)*">
  <xsl:param name="term" as="element()"/>
  <xsl:sequence select="f:glossentries($term, f:pi(root($term), 'glossary-collection')[1])"/>
</xsl:function>

<!-- all glossentries for $term (glossterm, firstterm) 
     taking into account external glossaries 
     if designated by a sequence of URIs in $collection. 
     glossentries from the internal glossary are first in the result sequence-->
<xsl:function name="f:glossentries" as="element(db:glossentry)*">
  <xsl:param name="term" as="element()"/>
  <xsl:param name="collection" as="xs:string?"/>

  <xsl:choose>
    <xsl:when test="$term/self::db:glossterm or $term/self::db:firstterm">
      <xsl:sequence select="
          let $internal-glossaries := root($term)//db:glossary
          return
            fp:glossentries-in-glossaries($term, $internal-glossaries),
          fp:glossentries-in-glossaries($term, fp:external-glossaries($collection))"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message
          select="'Warning: f:glossentries must not be called with ' || local-name($term) || ' as $term.'"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<!-- returns external glossaries referenced by URIs in the $collection string -->
<xsl:function name="fp:external-glossaries" as="element(db:glossary)*" cache="yes">
  <xsl:param name="collection" as="xs:string?"/>
 
  <xsl:if test="$collection ne ''">
    <xsl:variable name="glossaries" as="element(db:glossary)*">
      <xsl:for-each select="tokenize($collection, '\s+')">
        <!-- n.b. there's nothing to resolve a relative URI against here; values
             set by the db processing instruction are made absolute against the PI.
             Values from elsewhere should be made absolute before calling this function. -->
        <xsl:try>
          <xsl:sequence select="doc(xs:anyURI(.))/db:glossary"/>
          <xsl:catch>
            <xsl:message select="'Failed to load glossary: ' || ."/>
            <xsl:message select="'    ' || $err:description"/>
          </xsl:catch>
        </xsl:try>
      </xsl:for-each>
    </xsl:variable>
    <!--
    <xsl:message select="count($glossaries) || ' external glossaries loaded from collection ' || $collection"/>
    -->
    <xsl:sequence select="$glossaries"/>
  </xsl:if>
</xsl:function>

<!-- returns all glossentries in the sequence of $glossaries for $term, if any -->
<xsl:function name="fp:glossentries-in-glossaries" as="element(db:glossentry)*">
  <xsl:param name="term" as="element()"/>
  <xsl:param name="glossaries" as="element(db:glossary)*"/>
  <xsl:sequence select="$glossaries ! fp:glossentries-in-glossary($term, .)"/>
</xsl:function>

<!-- returns all glossentries in one $glossary for $term, if any  -->
<xsl:function name="fp:glossentries-in-glossary" as="element(db:glossentry)*" cache="yes">
  <xsl:param name="term" as="element()"/>
  <xsl:param name="glossary" as="element(db:glossary)"/>
  <xsl:sequence select="$glossary//db:glossentry[db:glossterm eq fp:baseform($term)]"/>
</xsl:function>

<xsl:function name="fp:baseform" as="xs:string">
  <xsl:param name="element" as="element()"/>
  <xsl:sequence select="($element/@baseform, xs:string($element))[1] ! normalize-space(.)"/>
</xsl:function>
  
</xsl:stylesheet>
