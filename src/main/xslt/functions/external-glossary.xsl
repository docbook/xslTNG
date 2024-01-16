<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://docbook.org/ns/docbook" xmlns:db="http://docbook.org/ns/docbook"
    xmlns:f="http://docbook.org/ns/docbook/functions"
    xmlns:fp="http://docbook.org/ns/docbook/functions/private" xmlns:v="http://docbook.org/ns/docbook/variables"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://docbook.org/ns/docbook" exclude-result-prefixes="f fp xs"
    version="3.0">

    <!-- Functions for external glossaries, see https://xsltng.docbook.org/guide/2.1.9/p_glossary-collection
    |    Designed for the use in DocBook xslTNG transformations,
    |    but also in Schematron Rules which check glossterms while authoring -->
    
    <!-- returns all glossentries for the reference definied in the internal glossary, if any -->
    <xsl:function name="f:glossterm-targets" as="element(glossentry)*">
        <xsl:param name="reference" as="element()"/>
        <xsl:sequence select="f:glossterm-targets($reference, root($reference)/info/v:glossary-collection)"/>
    </xsl:function>

    <!-- returns all glossentries for the reference, 
         beginning with the entry from the internal glossary, 
         followed by entries from glossaries reference by collection -->
    <xsl:function name="f:glossterm-targets" as="element(glossentry)*">
        <xsl:param name="reference" as="element()"/>
        <xsl:param name="collection" as="xs:string?"/>
        <xsl:sequence select="
                let $internal-glossaries := root($reference)//glossary
                return
                    fp:glossterm-targets-in-collection($reference, $internal-glossaries),
                fp:glossterm-targets-in-collection($reference, fp:external-glossaries($collection))"
        />
    </xsl:function>
    
    
    <!-- private (helper) functions ==================================================================== -->

    <!-- returns external glossaries referenced by the collection string -->
    <xsl:function name="fp:external-glossaries" as="element(glossary)*" cache="yes">
        <xsl:param name="collection" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="not($collection)"/>
            <xsl:when test="normalize-space($collection) eq ''"/>
            <xsl:otherwise>
                <xsl:try>
                    <xsl:sequence select="document($collection)//glossary"/>
                    <xsl:catch>
                        <xsl:message
                            select="'Failed to load glossary-collection ' || $collection || ' (' || resolve-uri($collection) || ').'"
                        />
                    </xsl:catch>
                </xsl:try>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!-- returns all glossentries in the glossaries for reference, if any -->
    <xsl:function name="fp:glossterm-targets-in-collection" as="element(glossentry)">
        <xsl:param name="reference" as="element()"/>
        <xsl:param name="glossaries" as="element(glossary)*"/>
        <xsl:sequence select="
                for $g in $glossaries
                return
                    fp:glossterm-targets($reference, $g)"/>
    </xsl:function>

    <!-- returns all glossentries in one glossary for reference, if any  -->
    <xsl:function name="fp:glossterm-targets" as="element(glossentry)*" cache="yes">
        <xsl:param name="reference" as="element()"/>
        <xsl:param name="glossary" as="element(glossary)"/>
        <xsl:variable name="baseform" as="xs:string"
            select="($reference/@baseform, normalize-space($reference))[1]"/>
        <xsl:sequence select="$glossary//glossentry[glossdef eq $baseform]"/>
    </xsl:function>


</xsl:stylesheet>
