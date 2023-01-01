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

<xsl:variable name="v:user-xref-groups" as="element()*"/>

<xsl:variable name="v:xref-groups" as="element()+"
              xmlns:db="http://docbook.org/ns/docbook">
  <xsl:sequence select="$v:user-xref-groups"/>

  <crossref xpath="self::db:section[ancestor::db:preface]"
            group="xref"
            template="section-in-preface"/>

  <crossref xpath="self::db:section"
            group="xref-number-and-title"/>

  <crossref xpath="self::db:chapter|self::db:appendix"
            group="xref-number-and-title"/>

  <crossref xpath="self::db:part|self::db:reference"
            group="xref-number-and-title"/>

  <crossref xpath="self::db:figure|self::db:example|self::db:table
                   |self::db:procedure|self::db:equation
                   |self::db:formalgroup"
            group="xref-number-and-title"/>

  <crossref xpath="self::*"
            group="xref"/>
</xsl:variable>

<!-- ============================================================ -->

<xsl:template match="*" mode="m:crossref">
  <xsl:param name="context" as="xs:string?"/>
  <xsl:param name="template" as="xs:string?"/>

  <xsl:variable name="this" select="."/>
  <xsl:variable name="prop" as="element()?">
    <xsl:iterate select="$v:xref-groups">
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

  <xsl:variable name="context"
                select="($context, $prop/@group/string())[1]"/>
  <xsl:variable name="template"
                select="($template, $prop/@template/string(), local-name(.))[1]"/>

  <xsl:variable name="template"
                select="fp:localization-template(., $context, $template)"/>

  <!--
  <xsl:message select="local-name(.), $context, $template"/>
  -->

  <xsl:variable name="label" as="item()*">
    <xsl:if test="$template/lt:label">
      <xsl:apply-templates select="." mode="m:crossref-label"/>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="title" as="node()*">
    <xsl:if test="$template/lt:content">
      <xsl:apply-templates select="." mode="m:crossref-title">
        <xsl:with-param name="purpose" select="'xref'"/>
      </xsl:apply-templates>
    </xsl:if>
  </xsl:variable>

  <xsl:apply-templates select="$template" mode="mp:localization">
    <xsl:with-param name="context" select="."/>
    <xsl:with-param name="label" select="$label"/>
    <xsl:with-param name="content" select="$title"/>
  </xsl:apply-templates>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="*" mode="m:crossref-prefix">
  <xsl:param name="label" as="item()*" required="yes"/>
  <xsl:param name="number" as="item()*" required="yes"/>
  <xsl:param name="title" as="item()*" required="yes"/>

  <xsl:variable name="properties" select="fp:crossref-properties(.)"/>

  <xsl:choose>
    <xsl:when test="$properties?prefix-key">
      <span class="prefix">
        <xsl:sequence
            select="fp:localization-template(., 'xref', $properties?prefix-key)"/>
        <span class="sep"> </span>
      </span>
    </xsl:when>
    <xsl:when test="$properties?prefix">
      <span class="prefix">
        <xsl:sequence select="$properties?prefix"/>
        <span class="sep"> </span>
      </span>
    </xsl:when>
    <xsl:otherwise/>
  </xsl:choose>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="*" mode="m:crossref-label" as="item()*">
  <xsl:apply-templates select="." mode="m:headline-label">
    <xsl:with-param name="purpose" select="'xref'"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="db:varlistentry" mode="m:crossref-label" as="item()*">
  <xsl:apply-templates select="db:term[1]"/>
</xsl:template>

<xsl:template match="db:answer" mode="m:crossref-label" as="item()*">
  <xsl:variable name="label"
                select="ancestor::db:qandaset[@defaultlabel][1]/@defaultlabel/string()"/>
  <xsl:variable name="label"
                select="if ($label)
                        then $label
                        else $qandaset-default-label"/>

  <xsl:choose>
    <xsl:when test="$label = 'none' or $label='number'">
      <xsl:apply-templates select="preceding-sibling::db:question"
                           mode="m:crossref-label"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:next-match/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:bibliomixed|db:biblioentry" mode="m:crossref-label">
  <xsl:choose>
    <xsl:when test="node()[1]/self::db:abbrev
                    or (node()[1]/text()
                        and normalize-space(node()[1]) = ''
                        and node()[2]/self::db:abbrev)">
      <xsl:apply-templates select="db:abbrev[1]"/>
    </xsl:when>
    <xsl:when test="@xml:id">
      <xsl:value-of select="@xml:id"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:next-match/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="*" mode="m:crossref-number">
  <xsl:apply-templates select="." mode="m:headline-number">
    <xsl:with-param name="purpose" select="'crossref'"/>
  </xsl:apply-templates>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="*" mode="m:crossref-number-separator">
  <xsl:param name="number" as="item()*" required="yes"/>
  <xsl:param name="title" as="item()*" required="yes"/>
  <xsl:text>, </xsl:text>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="*" mode="m:crossref-title">
  <xsl:apply-templates select="(db:info/db:titleabbrev, db:info/db:title)[1]"
                       mode="m:title">
    <xsl:with-param name="purpose" select="'crossref'"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="db:bridgehead" mode="m:crossref-title">
  <xsl:apply-templates select="." mode="m:title"/>
</xsl:template>

<xsl:template match="db:varlistentry" mode="m:crossref-title">
  <xsl:apply-templates select="db:term[1]" mode="m:title">
    <xsl:with-param name="purpose" select="'crossref'"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="db:glossentry" mode="m:crossref-label">
  <xsl:apply-templates select="db:glossterm[1]/node()"/>
</xsl:template>

<xsl:template match="db:glossterm" mode="m:crossref-label">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="db:see|db:seealso" mode="m:crossref-label">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="db:area|db:areaset|db:co" mode="m:crossref-label">
  <xsl:apply-templates select="." mode="m:callout-bug"/>
</xsl:template>

<xsl:template match="db:production" mode="m:crossref-title">
  <xsl:apply-templates select="db:lhs[1]" mode="m:title">
    <xsl:with-param name="purpose" select="'crossref'"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="db:refentry" mode="m:crossref-label">
  <xsl:apply-templates select="." mode="m:headline-title">
    <xsl:with-param name="purpose" select="'crossref'"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="db:refnamediv" mode="m:crossref-title">
  <xsl:apply-templates select="db:refname[1]" mode="m:headline-title">
    <xsl:with-param name="purpose" select="'crossref'"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="db:bibliomixed|db:biblioentry" mode="m:crossref-title">
  <xsl:choose>
    <xsl:when test="node()[1]/self::db:abbrev
                    or (node()[1]/text()
                        and normalize-space(node()[1]) = ''
                        and node()[2]/self::db:abbrev)">
      <xsl:apply-templates select="db:abbrev[1]"/>
    </xsl:when>
    <xsl:when test="@xml:id">
      <xsl:value-of select="@xml:id"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="*" mode="m:crossref-suffix">
  <xsl:param name="title" as="item()*" required="yes"/>

  <xsl:sequence select="()"/>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="*" mode="m:crossref-inherit-separator">
  <xsl:param name="title" as="item()*" required="yes"/>
  <xsl:param name="parent" as="item()*" required="yes"/>
  <xsl:variable name="properties" select="fp:crossref-properties(.)"/>
  <xsl:choose>
    <xsl:when test="$properties?inherit-separator-key">
      <xsl:sequence select="error((), 'bang')"/>
    </xsl:when>
    <xsl:when test="$properties?inherit-separator">
      <span class="sep">
        <xsl:text> </xsl:text>
        <xsl:sequence select="$properties?inherit-separator"/>
        <xsl:text> </xsl:text>
      </span>
    </xsl:when>
    <xsl:otherwise/>
  </xsl:choose>
</xsl:template>

<!-- ============================================================ -->

<xsl:function name="fp:document-crossref-properties" as="element()*" cache="yes">
  <xsl:param name="node" as="element()"/>
  <xsl:sequence select="root($node)/*/db:info/v:crossref"/>
</xsl:function>

<xsl:function name="fp:crossref-properties" as="map(*)" cache="yes">
  <xsl:param name="node" as="element()"/>

  <xsl:variable name="prop" as="element()?">
    <xsl:iterate select="(fp:document-crossref-properties($node), $v:xref-groups)">
      <xsl:variable name="test" as="element()*">
        <xsl:evaluate context-item="$node" xpath="@xpath"/>
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

  <xsl:variable name="number" as="xs:boolean"
                select="(exists($prop/@number-format)
                         or (exists($prop/@number) and f:is-true($prop/@number)))
                        and (not(exists($prop/@number)) or f:is-true($prop/@number))"/>

  <xsl:variable name="format" as="xs:string?"
                select="if ($number)
                        then ($prop/@number-format, '1')[1]
                        else ()"/>

  <xsl:variable name="label-toc" as="xs:boolean"
                select="if ($prop/@label-toc)
                        then f:is-true($prop/@label-toc)
                        else f:is-true($prop/@label)"/>

  <xsl:message use-when="false()"
               select="node-name($node), ' ', f:is-true($prop/@label), ' ', $number"/>

  <xsl:sequence select="map {
    'prefix': $prop/@prefix/string(),
    'prefix-key': $prop/@prefix-key/string(),
    'label': f:is-true($prop/@label),
    'label-toc': $label-toc,
    'number': $number,
    'number-format': $format,
    'title': f:is-true($prop/@title),
    'inherit': $prop/@inherit/string(),
    'inherit-separator': $prop/@inherit-separator/string(),
    'suffix': $prop/@suffix/string(),
    'suffix-key': $prop/@suffix-key/string()
    }"/> 
</xsl:function>

</xsl:stylesheet>
