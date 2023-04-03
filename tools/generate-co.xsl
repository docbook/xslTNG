<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="db xs"
                version="2.0">

<xsl:param name="style"      select="'lines'"/>
<xsl:param name="highlight"  select="'linecolumn,lines,lineranges-first'"/>
<xsl:param name="numbered"   select="'true'"/>
<xsl:param name="everyNth"   select="'5'"/>
<xsl:param name="minlines"   select="'5'"/>
<xsl:param name="first"      select="'true'"/>

<xsl:output method="xml" encoding="utf-8" indent="no"/>

<xsl:template match="db:programlistingco|db:screenco">
  <xsl:variable name="pseudo-attributes" as="xs:string*" expand-text="yes">
    <xsl:if test="$style">verbatim-style="{$style}"</xsl:if>
    <xsl:if test="$highlight">verbatim-highlight="{$highlight}"</xsl:if>
    <xsl:if test="$numbered">verbatim-numbered="{$numbered}"</xsl:if>
    <xsl:if test="$everyNth">verbatim-number-every-nth="{$everyNth}"</xsl:if>
    <xsl:if test="$first">verbatim-number-first-line="{$first}"</xsl:if>
    <xsl:if test="$minlines">verbatim-number-minlines="{$minlines}"</xsl:if>
  </xsl:variable>

  <para xmlns="http://docbook.org/ns/docbook">These options apply to the
listing that follows:</para>

  <informaltable xmlns="http://docbook.org/ns/docbook" xsl:expand-text="yes">
    <tgroup cols="2">
    <thead>
      <row><entry>Option</entry><entry>Value</entry></row>
    </thead>
    <tbody>
<row><entry>verbatim-style</entry>              <entry>{$style}</entry>     </row>
<row><entry>verbatim-highlight</entry>          <entry>{$highlight}</entry> </row>
<row><entry>verbatim-numbered</entry>           <entry>{$numbered}</entry>  </row>
<row><entry>verbatim-number-every-nth</entry>   <entry>{$everyNth}</entry>  </row>
<row><entry>verbatim-number-first-line</entry>  <entry>{$first}</entry>     </row>
<row><entry>verbatim-number-minlines</entry>    <entry>{$minlines}</entry>  </row>
    </tbody>
    </tgroup>
  </informaltable>

  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:if test="exists($pseudo-attributes)">
      <xsl:processing-instruction name="db"
                                  select="string-join($pseudo-attributes, ' ')"/>
    </xsl:if>
    <xsl:apply-templates select="node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="element()">
  <xsl:copy>
    <xsl:apply-templates select="@*,node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="attribute()|text()|comment()|processing-instruction()">
  <xsl:copy/>
</xsl:template>

</xsl:stylesheet>
