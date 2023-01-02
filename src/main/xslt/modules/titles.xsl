<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:dbe="http://docbook.org/ns/docbook/errors"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                xmlns:l="http://docbook.org/ns/docbook/l10n"
                xmlns:lt="http://docbook.org/ns/docbook/l10n/templates"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:mp="http://docbook.org/ns/docbook/modes/private"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:vp="http://docbook.org/ns/docbook/variables/private"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                default-mode="m:docbook"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:variable name="v:user-title-groups" as="element()*"/>

<xsl:variable name="v:title-groups" as="element()+"
              xmlns:db="http://docbook.org/ns/docbook">
  <xsl:sequence select="$v:user-title-groups"/>

  <title xpath="self::db:section[ancestor::db:preface]"
         group="title-unnumbered"/>

  <title xpath="self::db:section|self::db:sect1
                |self::db:sect2|self::db:sect3|self::db:sect4|self::db:sect5
                |self::db:refsection|self::db:refsect1|self::db:refsect2|self::db:refsect3"
         group="{if (f:is-true($section-numbers))
                   then 'title-numbered'
                   else 'title-unnumbered'}"/>

  <title xpath="self::db:article"
         group="title"/>

  <title xpath="self::db:preface"
         group="title"/>

  <title xpath="self::db:part|self::db:reference|self::db:chapter|self::db:appendix"
         group="title-numbered"/>

  <title xpath="self::db:figure[parent::db:formalgroup]
                |self::db:table[parent::db:formalgroup]
                |self::db:equation[parent::db:formalgroup]
                |self::db:example[parent::db:formalgroup]"
         group="subfigure-title"/>

  <title xpath="self::db:figure|self::db:table|self::db:equation|self::db:example"
         group="title"/>

  <title xpath="self::db:formalgroup"
         group="title"/>

  <title xpath="self::db:step|self::db:listitem[parent::db:orderedlist]"
         group="title-unnumbered"/>

  <title xpath="self::db:glosssee|self::db:glossseealso"
         group="title-unnumbered"/>

  <title xpath="self::db:see|self::db:seealso"
         group="title-unnumbered"/>

  <title xpath="self::db:question|self::db:answer"
         group="title-numbered"/>

  <title xpath="self::*"
         group="title"/>
</xsl:variable>

<!-- ============================================================ -->

<xsl:template match="*" mode="m:headline">
  <xsl:param name="purpose" as="xs:string" required="yes"/>

  <xsl:variable name="this" select="."/>
  <xsl:variable name="prop" as="element()?">
    <xsl:iterate select="$v:title-groups">
      <xsl:variable name="test" as="element()*">
        <xsl:evaluate context-item="$this" xpath="@xpath"/>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="$test">
          <xsl:sequence select="."/>
          <xsl:break/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:next-iteration/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:iterate>
  </xsl:variable>

  <xsl:variable name="template"
                select="if ($purpose = 'lot')
                        then fp:localization-template(., 'list-of-titles')
                        else fp:localization-template(., $prop/@group)"/>

  <!--
  <xsl:message select="local-name(.), $purpose, $template"/>
  -->

  <xsl:variable name="label" as="item()*">
    <xsl:if test="$template/lt:label">
      <xsl:apply-templates select="." mode="m:headline-label"/>
    </xsl:if>
  </xsl:variable>

  <xsl:if test="$vp:olinkdb">
    <xsl:attribute name="db-label" select="$label"/>
  </xsl:if>

  <xsl:variable name="title" as="node()*">
    <xsl:if test="$template/lt:content">
      <xsl:apply-templates select="." mode="m:headline-title">
        <xsl:with-param name="purpose" select="$purpose"/>
      </xsl:apply-templates>
    </xsl:if>
  </xsl:variable>

  <xsl:apply-templates select="$template" mode="mp:localization">
    <xsl:with-param name="context" select="."/>
    <xsl:with-param name="label" select="$label"/>
    <xsl:with-param name="content" select="$title"/>
  </xsl:apply-templates>
</xsl:template>

<!-- This is a special case, you may need to override it for your locale -->
<xsl:template match="db:formalgroup" mode="m:headline">
  <xsl:param name="purpose" as="xs:string" required="yes"/>
  <xsl:variable name="headline" as="item()*">
    <xsl:next-match>
      <xsl:with-param name="purpose" select="$purpose"/>
    </xsl:next-match>
  </xsl:variable>
  <xsl:sequence select="f:l10n-token(., local-name(*[last()]))"/>
  <xsl:text> </xsl:text>
  <xsl:sequence select="$headline"/>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="*" mode="m:headline-label">
  <xsl:param name="purpose" as="xs:string" select="'title'"/>
  <xsl:apply-templates select="." mode="m:headline-number"/>
</xsl:template>

<xsl:template match="db:appendix" mode="m:headline-label">
  <xsl:param name="purpose" as="xs:string" select="'title'"/>
  <xsl:choose>
    <xsl:when test="not(f:is-true($number-single-appendix))
                    and empty(preceding-sibling::db:appendix)
                    and empty(following-sibling::db:appendix)">
      <xsl:sequence select="()"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:next-match>
        <xsl:with-param name="purpose" select="$purpose"/>
      </xsl:next-match>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:qandaentry" mode="m:headline-label">
  <xsl:param name="purpose" as="xs:string" select="'title'"/>
  <xsl:apply-templates select="db:question" mode="m:headline-label">
    <xsl:with-param name="purpose" select="$purpose"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="db:question" mode="m:headline-label">
  <xsl:param name="purpose" as="xs:string" select="'title'"/>

  <xsl:variable name="label"
                select="ancestor::db:qandaset[@defaultlabel][1]/@defaultlabel/string()"/>
  <xsl:variable name="label"
                select="if ($label)
                        then $label
                        else $qandaset-default-label"/>

  <xsl:choose>
    <xsl:when test="db:label">
      <xsl:apply-templates select="db:label"/>
    </xsl:when>
    <xsl:when test="$label = 'none'"/>
    <xsl:when test="$label = 'number'">
      <xsl:number from="db:qandaset" level="multiple" select=".."
                  count="db:qandaentry|db:qandadiv"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="$label != 'qanda'">
        <xsl:message
            select="'Unexpected qandaset label: ' || $label || ', using qanda'"/>
      </xsl:if>

      <xsl:sequence select="f:l10n-token(., 'question')"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:answer" mode="m:headline-label">
  <xsl:param name="purpose" as="xs:string" select="'title'"/>

  <xsl:variable name="label"
                select="ancestor::db:qandaset[@defaultlabel][1]/@defaultlabel/string()"/>
  <xsl:variable name="label"
                select="if ($label)
                        then $label
                        else $qandaset-default-label"/>

  <xsl:choose>
    <xsl:when test="db:label">
      <xsl:apply-templates select="db:label"/>
    </xsl:when>
    <xsl:when test="$label = 'none' or $label='number'"/>
    <xsl:when test="$label = 'qanda'">
      <xsl:text>A:</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message
          select="'Unexpected qandaset label: ' || $label || ', using qanda'"/>
      <xsl:text>A:</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template match="db:formalgroup" mode="mp:label-number" as="xs:integer">
  <xsl:variable name="ancestor" select="fp:nearest-relevant-ancestor(.)"/>
  <xsl:variable name="prec" as="element()*">
    <xsl:choose>
      <xsl:when test="db:figure">
        <xsl:sequence select="preceding::db:figure[not(parent::db:formalgroup)]
                              |preceding::db:formalgroup[db:figure]"/>
      </xsl:when>
      <xsl:when test="db:table">
        <xsl:sequence select="preceding::db:table[not(parent::db:formalgroup)]
                              |preceding::db:formalgroup[db:table]"/>
      </xsl:when>
      <xsl:when test="db:example">
        <xsl:sequence select="preceding::db:example[not(parent::db:formalgroup)]
                              |preceding::db:formalgroup[db:example]"/>
      </xsl:when>
      <xsl:when test="db:equation">
        <xsl:sequence select="preceding::db:equation[db:info/db:title
                              and not(parent::db:formalgroup)]
                              |preceding::db:formalgroup[db:equation]"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="()"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="desc" as="element()*">
    <xsl:choose>
      <xsl:when test="empty($prec)">
        <div/> <!-- it's irrelevant, it's just something != all the preceding -->
      </xsl:when>
      <xsl:when test="db:figure">
        <xsl:sequence select="$ancestor/descendant::db:figure[not(parent::db:formalgroup)]
                              |$ancestor/descendant::db:formalgroup[db:figure]"/>
      </xsl:when>
      <xsl:when test="db:table">
        <xsl:sequence select="$ancestor/descendant::db:table[not(parent::db:formalgroup)]
                              |$ancestor/descendant::db:formalgroup[db:table]"/>
      </xsl:when>
      <xsl:when test="db:example">
        <xsl:sequence select="$ancestor/descendant::db:example[not(parent::db:formalgroup)]
                              |$ancestor/descendant::db:formalgroup[db:example]"/>
      </xsl:when>
      <xsl:when test="db:equation">
        <xsl:sequence select="$ancestor/descendant::db:equation
                              [db:info/db:title and not(parent::db:formalgroup)]
                              |$ancestor/descendant::db:formalgroup[db:equation]"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="()"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:sequence select="if (empty($prec))
                        then 1
                        else count($prec = $desc)+1"/>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="db:set|db:book|db:part|db:reference" as="item()*"
              mode="mp:headline-number-prefix">
  <xsl:if test="f:is-true($division-numbers-inherit)">
    <xsl:apply-templates select="." mode="m:headline-number"/>
  </xsl:if>
</xsl:template>

<xsl:template match="db:preface|db:chapter|db:appendix|db:article|db:topic"
              mode="mp:headline-number-prefix">
  <xsl:param name="inherit" as="xs:boolean"
             select="f:is-true($component-numbers-inherit)"/>
  <xsl:if test="$inherit">
    <xsl:apply-templates select="." mode="m:headline-number"/>
  </xsl:if>
</xsl:template>

<xsl:template match="db:section|db:sect1|db:sect2|db:sect3|db:sect4|db:sect5
                     |db:refsection|db:refsect1|db:refsect2|db:refsect3"
              mode="mp:headline-number-prefix">
  <xsl:if test="f:is-true($section-numbers-inherit)">
    <xsl:apply-templates select="." mode="m:headline-number"/>
  </xsl:if>
</xsl:template>

<xsl:template match="db:formalgroup"
              mode="mp:headline-number-prefix">
  <xsl:apply-templates select="." mode="m:headline-number"/>
</xsl:template>

<xsl:template match="db:orderedlist"
              mode="mp:headline-number-prefix">
  <xsl:apply-templates select="ancestor::db:listitem[parent::db:orderedlist][1]"
                       mode="m:headline-number"/>
</xsl:template>

<xsl:template match="*"
              mode="mp:headline-number-prefix">
  <xsl:sequence select="()"/>
</xsl:template>

<xsl:template match="db:orderedlist/db:listitem" as="item()*"
              mode="m:headline-number">
  <xsl:variable name="prefix" as="item()*">
    <xsl:apply-templates select="parent::*" mode="mp:headline-number-prefix"/>
  </xsl:variable>

  <xsl:variable name="number" as="xs:integer"
                select="f:orderedlist-item-number(.)[last()]"/>

  <xsl:variable name="format"
                select="f:orderedlist-item-numeration(.)"/>

  <xsl:variable name="formatted-number" as="xs:string?">
    <xsl:if test="exists($format)">
      <xsl:number value="$number" format="{$format}"/>
    </xsl:if>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="exists($prefix) and exists($formatted-number)">
      <xsl:sequence select="$prefix"/>
      <span class="sep">
        <xsl:apply-templates select="." mode="m:gentext">
          <xsl:with-param name="group" select="'number-separator'"/>
        </xsl:apply-templates>
      </span>
      <xsl:sequence select="$formatted-number"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="($prefix, $formatted-number)[1]"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:step" as="item()*"
              mode="m:headline-number">
  <xsl:variable name="prefix" as="item()*">
    <xsl:apply-templates select="parent::*" mode="mp:headline-number-prefix"/>
  </xsl:variable>

  <xsl:variable name="number" as="xs:integer+"
                select="f:step-number(.)"/>

  <xsl:variable name="fnumber" as="xs:string+">
    <xsl:iterate select="reverse($number)">
      <xsl:param name="step" select="."/>
      <xsl:number value="." format="{f:step-numeration($step)}"/>
      <xsl:next-iteration>
        <xsl:with-param name="step" select="$step/ancestor::db:step[1]"/>
      </xsl:next-iteration>
    </xsl:iterate>
  </xsl:variable>

  <xsl:variable name="sep">
    <xsl:apply-templates select="." mode="m:gentext">
      <xsl:with-param name="group" select="'number-separator'"/>
    </xsl:apply-templates>
  </xsl:variable>

  <xsl:variable name="formatted-number" as="xs:string">
    <xsl:sequence select="string-join(reverse($fnumber), string($sep))"/>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="exists($prefix) and exists($formatted-number)">
      <xsl:sequence select="$prefix"/>
      <span class="sep">
        <xsl:apply-templates select="." mode="m:gentext">
          <xsl:with-param name="group" select="'number-separator'"/>
        </xsl:apply-templates>
      </span>
      <xsl:sequence select="$formatted-number"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="($prefix, $formatted-number)[1]"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="*" mode="m:headline-number" as="item()*">
  <xsl:variable name="prefix" as="item()*">
    <xsl:choose>
      <!-- hack to force formal objects to inherit component numeration -->
      <xsl:when test="self::db:figure|self::db:example|self::db:table|self::db:equation
                      and (ancestor::db:chapter or ancestor::db:appendix
                           or ancestor::db:part or ancestor::db:reference)">
        <xsl:apply-templates select="parent::*" mode="mp:headline-number-prefix">
          <xsl:with-param name="inherit" select="true()"/>
        </xsl:apply-templates>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="parent::*" mode="mp:headline-number-prefix"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="number" as="xs:integer">
    <xsl:apply-templates select="." mode="mp:label-number"/>
  </xsl:variable>

  <xsl:variable name="format">
    <xsl:apply-templates select="." mode="m:gentext">
      <xsl:with-param name="group" select="'number-format'"/>
    </xsl:apply-templates>
  </xsl:variable>

  <xsl:variable name="formatted-number" as="xs:string?">
    <xsl:if test="exists($format)">
      <xsl:number value="$number" format="{$format}"/>
    </xsl:if>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="exists($prefix) and exists($formatted-number)">
      <xsl:sequence select="$prefix"/>
      <span class="sep">
        <xsl:apply-templates select="." mode="m:gentext">
          <xsl:with-param name="group" select="'number-separator'"/>
        </xsl:apply-templates>
      </span>
      <xsl:sequence select="$formatted-number"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="($prefix, $formatted-number)[1]"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="*" mode="mp:label-number" as="xs:integer">
  <xsl:sequence select="count(preceding-sibling::*
                              [node-name(.)=node-name(current())]) + 1"/>
</xsl:template>

<xsl:template match="db:figure|db:example|db:table"
              mode="mp:label-number" as="xs:integer">
  <xsl:variable name="count">
    <xsl:number from="db:chapter|db:appendix
                      |db:sect1|db:sect2|db:sect3
                      |db:sect4|db:sect5|db:section"/>
  </xsl:variable>
  <xsl:sequence select="xs:integer(($count, '1')[1])"/>
</xsl:template>

<xsl:template match="db:equation" mode="mp:label-number" as="xs:integer">
  <xsl:variable name="ancestor" select="fp:nearest-relevant-ancestor(.)"/>
  <xsl:variable name="eq"
                select="if (preceding::db:equation[db:info/db:title])
                        then preceding::db:equation[db:info/db:title]
                             = $ancestor/descendant::db:equation[db:info/db:title]
                        else ()"/>
  <xsl:sequence select="count($eq)+1"/>
</xsl:template>

<!-- Is there a clever XPath I'm overlooking? -->
<xsl:function name="fp:nearest-relevant-ancestor" as="element()">
  <xsl:param name="elem" as="element()"/>
  <xsl:choose>
    <xsl:when test="$elem/self::db:chapter|$elem/self::db:appendix
                    |$elem/self::db:sect1|$elem/self::db:sect2|$elem/self::db:sect3
                    |$elem/self::db:sect4|$elem/self::db:sect5|$elem/self::db:section">
      <xsl:sequence select="$elem"/>
    </xsl:when>
    <xsl:when test="empty($elem/parent::*)">
      <xsl:sequence select="$elem"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="fp:nearest-relevant-ancestor($elem/parent::*)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<!-- ============================================================ -->

<xsl:template match="*" mode="m:headline-title">
  <xsl:param name="purpose" as="xs:string" select="'title'"/>

  <xsl:choose>
    <xsl:when test="$purpose = 'title' or not(db:info/db:titleabbrev)">
      <xsl:apply-templates select="db:info/db:title" mode="m:title">
        <xsl:with-param name="purpose" select="$purpose"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="db:info/db:titleabbrev" mode="m:title">
        <xsl:with-param name="purpose" select="$purpose"/>
      </xsl:apply-templates>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:refentry" mode="m:headline-title">
  <xsl:param name="purpose" as="xs:string" select="'title'"/>
  <xsl:choose>
    <xsl:when test="db:refmeta">
      <xsl:apply-templates select="db:refmeta" mode="m:headline-title">
        <xsl:with-param name="purpose" select="$purpose"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="db:refnamediv/db:refname[1]" mode="m:headline-title">
        <xsl:with-param name="purpose" select="$purpose"/>
      </xsl:apply-templates>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:refmeta" mode="m:headline-title">
  <xsl:param name="purpose" as="xs:string" select="'title'"/>
  <xsl:apply-templates select="db:refentrytitle/node()"/>
  <xsl:apply-templates select="db:manvolnum"/>
</xsl:template>

<xsl:template match="db:refnamediv" mode="m:headline-title">
  <xsl:param name="purpose" as="xs:string" select="'title'"/>
  <xsl:apply-templates select="db:refname[1]" mode="m:headline-title">
    <xsl:with-param name="purpose" select="$purpose"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="db:refname" mode="m:headline-title">
  <xsl:param name="purpose" as="xs:string" select="'title'"/>
  <xsl:apply-templates mode="m:title">
    <xsl:with-param name="purpose" select="$purpose"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="db:question" mode="m:headline-title">
  <xsl:param name="purpose" as="xs:string" select="'title'"/>
  <xsl:apply-templates mode="m:title"
      select="(* except (db:label|db:info|db:tip|db:note|db:danger|db:important
                         |db:caution|db:sidebar|db:figure|db:example
                         |db:procedure|db:table|db:equation)
              )[1]">
    <xsl:with-param name="purpose" select="$purpose"/>
  </xsl:apply-templates>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="db:title|db:titleabbrev" mode="m:title">
  <xsl:param name="purpose" as="xs:string" required="yes"/>

  <xsl:choose>
    <xsl:when test="$purpose = 'title'">
      <xsl:apply-templates/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="title" as="item()*">
        <xsl:apply-templates/>
      </xsl:variable>
      <xsl:apply-templates select="$title" mode="mp:strip-links"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ============================================================ -->

<xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
              match="h:db-footnote|h:db-annotation" mode="mp:strip-links"/>

<xsl:template xmlns:h="http://www.w3.org/1999/xhtml"
              match="h:a" mode="mp:strip-links">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="element()" mode="mp:strip-links">
  <xsl:copy>
    <xsl:apply-templates select="@*,node()" mode="mp:strip-links"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="attribute()|text()|comment()|processing-instruction()"
              mode="mp:strip-links">
  <xsl:copy/>
</xsl:template>

</xsl:stylesheet>
