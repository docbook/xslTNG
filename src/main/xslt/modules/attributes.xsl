<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                default-mode="m:docbook"
                exclude-result-prefixes="db f m xs"
                version="3.0">

<xsl:template match="db:article" mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:if test="not(@xml:id) and parent::*">
      <xsl:attribute name="id" select="f:generate-id(.)"/>
    </xsl:if>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr,
                                     (local-name(.),
                                     @status, @otherclass,
                                     if (@otherclass)
                                     then 'otherclass'
                                     else @class),
                                     ())"/>
  <xsl:if test="@label">
    <xsl:attribute name="db-label" select="@label"/>
  </xsl:if>
</xsl:template>

<xsl:template match="db:book|db:part|db:partintro|db:reference|db:refentry
                     |db:dedication|db:acknowledgements|db:colophon
                     |db:preface|db:chapter|db:appendix
                     |db:sect1|db:sect2|db:sect3|db:sect4|db:sect5|db:section
                     |db:topic"
              mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:if test="not(@xml:id) and parent::*">
      <xsl:attribute name="id" select="f:generate-id(.)"/>
    </xsl:if>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>

  <xsl:sequence select="f:attributes(., $attr, (local-name(.), @status), ())"/>
  <xsl:if test="@label">
    <xsl:attribute name="db-label" select="@label"/>
  </xsl:if>
</xsl:template>

<xsl:template match="db:orderedlist" mode="m:attributes" as="attribute()*">
  <xsl:param name="exclude-classes" as="xs:string*"/>

  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr,
                                     (local-name(.),
                                      if (@inheritnum = 'inherit')
                                      then 'inheritnum'
                                      else ()),
                                      ())"/>
</xsl:template>

<xsl:template match="db:listitem|db:para|db:member
                    |db:tbody|db:thead|db:tfoot"
              mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr, (), local-name(.))"/>
</xsl:template>

<xsl:template match="db:simplelist" mode="m:attributes" as="attribute()*">
  <xsl:param name="extra-classes" as="xs:string*"/>
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr, (local-name(.), $extra-classes), ())"/>
</xsl:template>

<xsl:template match="db:variablelist" mode="m:attributes" as="attribute()*">
  <xsl:param name="term-length" as="item()?"/>
  <xsl:param name="exclude-id" as="xs:boolean" select="false()"/>

  <xsl:variable name="long"
                select="if ($term-length castable as xs:integer
                            and xs:integer($term-length)
                                gt $variablelist-termlength-threshold)
                        then 'long-terms'
                        else ()"/>

  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="if ($exclude-id)
                                 then @* except @xml:id
                                 else @*"/>
    <xsl:if test="@termlength">
      <xsl:attribute name="db-termlength" select="@termlength"/>
    </xsl:if>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>

  <xsl:sequence select="f:attributes(., $attr, (local-name(.), $long), ())"/>
</xsl:template>

<xsl:template match="db:glossentry" mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:if test="not(@xml:id) and parent::*">
      <xsl:attribute name="id" select="f:generate-id(.)"/>
    </xsl:if>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr, (local-name(.)), ())"/>
</xsl:template>

<xsl:template match="db:bridgehead" mode="m:attributes" as="attribute()*">
  <xsl:param name="extra-classes" as="xs:string*"/>
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr, (local-name(.), $extra-classes), ())"/>
</xsl:template>

<xsl:template match="db:table[db:tgroup]|db:informaltable[db:tgroup]"
              mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:if test="not(@xml:id) and parent::*">
      <xsl:attribute name="id" select="f:generate-id(.)"/>
    </xsl:if>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:variable name="pgwide" as="xs:string?">
    <xsl:if test="@pgwide and @pgwide != '0'">
      <xsl:sequence select="'pgwide'"/>
    </xsl:if>
  </xsl:variable>
  <xsl:variable name="landscape" as="xs:string?">
    <xsl:if test="@orient = 'land'">
      <xsl:sequence select="'landscape'"/>
    </xsl:if>
  </xsl:variable>
  <xsl:variable name="style"
                select="tokenize(@tabstyle)"/>

  <xsl:sequence select="f:attributes(., $attr,
                                     (local-name(.), $pgwide, $landscape, $style), ())"/>
</xsl:template>

<xsl:template match="db:table[not(db:tgroup)]|db:informaltable[not(db:tgroup)]"
              mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@* except @xml:id"/>
    <xsl:copy-of
        select="@* except (@xml:id|@xml:lang|@xml:base|@version
                           |@pgwide|@orient|@tabstyle)"/>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>

  <xsl:variable name="pgwide" as="xs:string?">
    <xsl:if test="@pgwide and @pgwide != '0'">
      <xsl:sequence select="'pgwide'"/>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="landscape" as="xs:string?">
    <xsl:if test="@orient = 'land'">
      <xsl:sequence select="'landscape'"/>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="style"
                select="tokenize(@tabstyle)"/>

  <xsl:sequence select="f:attributes(., $attr,
                                     (local-name(.), $pgwide, $landscape, $style), ())"/>
</xsl:template>

<xsl:template match="db:row"
              mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr, (), ())"/>
</xsl:template>

<xsl:template match="db:imagedata|db:videodata|db:audiodata"
              mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr, (), local-name(.))"/>
</xsl:template>

<xsl:template match="db:note|db:tip|db:important|db:caution|db:warning|db:danger"
              mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr, (local-name(.), 'admonition'), ())"/>
</xsl:template>  

<xsl:template match="db:programlisting|db:screen|db:address|db:literallayout
                     |db:synopsis|db:funcsynopsisinfo|db:classsynopsisinfo"
              mode="m:attributes" as="attribute()*">
  <xsl:param name="style" as="xs:string" select="f:verbatim-style(.)"/>
  <xsl:param name="numbered" as="xs:boolean" select="f:verbatim-numbered(.)"/>
  <xsl:param name="long" as="xs:boolean" select="false()"/>

  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>

  <xsl:variable name="lang" as="xs:string?"
                select="if (@language)
                        then 'language-' || @language
                        else if (self::db:programlisting)
                             then 'language-none'
                             else ()"/>

  <xsl:variable name="style" as="xs:string*"
                select="if ($style = 'lines')
                        then ('verbatim', 'verblines')
                        else 'verbatim'"/>

  <xsl:variable name="long" as="xs:string?"
                select="if ($long and $numbered)
                        then 'long'
                        else ()"/>

  <xsl:variable name="numbered" as="xs:string?"
                select="if ($numbered)
                        then 'numbered'
                        else ()"/>

  <xsl:sequence
      select="f:attributes(., $attr,
                 (local-name(.), $lang, @class, $style, $numbered, $long), ())"/>
</xsl:template>

<xsl:template match="db:lhs" mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr, ('production'), ())"/>
</xsl:template>

<xsl:template match="db:rhs" mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="if (preceding-sibling::db:rhs)
                        then f:attributes(., $attr, ('production'), ())
                        else f:attributes(., $attr)"/>
</xsl:template>

<xsl:template match="db:personname" mode="m:attributes" as="attribute()*">
  <xsl:param name="style" as="xs:string?" select="()"/>
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr, (local-name(.), $style), ())"/>
</xsl:template>

<xsl:template match="db:link" mode="m:attributes" as="attribute()*">
  <xsl:param name="title" as="xs:string?" select="()"/>
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:if test="exists($title)">
      <xsl:attribute name="title" select="$title"/>
    </xsl:if>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr)"/>
</xsl:template>

<xsl:template match="db:formalgroup
                     |db:figure|db:informalfigure
                     |db:example|db:informalexample
                     |db:equation|db:informalequation"
              mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:if test="not(@xml:id) and parent::*">
      <xsl:attribute name="id" select="f:generate-id(.)"/>
    </xsl:if>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>

  <xsl:variable name="class"
                select="if (@floatstyle)
                        then if (@floatstyle = 'float')
                             then 'float' || $default-float-style
                             else 'float' || @floatstyle
                        else ()"/>

  <xsl:variable name="pgwide" as="xs:string?">
    <xsl:if test="@pgwide and @pgwide != '0'">
      <xsl:sequence select="'pgwide'"/>
    </xsl:if>
  </xsl:variable>

  <xsl:sequence select="f:attributes(., $attr, (local-name(.), $pgwide, $class), ())"/>
</xsl:template>

<xsl:template match="db:qandaset|db:qandadiv|db:qandaentry|db:question|db:answer
                     |db:index|db:indexdiv|db:bibliography|db:bibliodiv
                     |db:glossary|db:lgossdiv"
              mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:if test="not(@xml:id) and parent::*">
      <xsl:attribute name="id" select="f:generate-id(.)"/>
    </xsl:if>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr)"/>
</xsl:template>

<xsl:template match="db:annotation" mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:if test="not(@xml:id) and parent::*">
      <xsl:attribute name="id" select="f:generate-id(.)"/>
    </xsl:if>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>

  <xsl:sequence select="f:attributes(., $attr, ('annotation-wrapper'), ())"/>
</xsl:template>

<xsl:template match="*" mode="m:attributes" as="attribute()*">
  <xsl:variable name="attr" as="attribute()*">
    <xsl:apply-templates select="@*"/>
    <xsl:sequence select="f:chunk(.)"/>
  </xsl:variable>
  <xsl:sequence select="f:attributes(., $attr)"/>
</xsl:template>


<!-- ============================================================ -->

<xsl:template match="@*">
  <!-- by default, attributes are suppressed -->
</xsl:template>

<xsl:template match="@xml:id">
  <xsl:attribute name="id" select="."/>
</xsl:template>

<xsl:template match="@xml:lang">
  <xsl:attribute name="lang" select="."/>
</xsl:template>

<xsl:template match="@dir">
  <xsl:attribute name="dir" select="."/>
</xsl:template>

</xsl:stylesheet>
