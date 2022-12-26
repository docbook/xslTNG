<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                xmlns:l="http://docbook.org/ns/docbook/l10n"
                xmlns:lt="http://docbook.org/ns/docbook/l10n/templates"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:mp="http://docbook.org/ns/docbook/modes/private"
                xmlns:n="http://docbook.org/ns/docbook/l10n/number"
                xmlns:t="http://docbook.org/ns/docbook/l10n/title"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:vp="http://docbook.org/ns/docbook/variables/private"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                default-mode="m:docbook"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:function name="f:languages" as="xs:string+" cache="yes">
  <xsl:param name="context" as="document-node()"/>

  <xsl:variable name="always"
                select="('en', $default-language, $gentext-language)"/>

  <xsl:sequence
      select="if (exists($gentext-language))
              then distinct-values($always)
              else distinct-values(($always, $context//@xml:lang))"/>
</xsl:function>  

<xsl:function name="f:in-scope-language" as="xs:string" cache="yes">
  <xsl:param name="target" as="node()"/>
  <xsl:sequence select="($target/ancestor-or-self::*[@xml:lang][1]/@xml:lang,
                         $default-language)[1]"/>
</xsl:function>  

<!-- ============================================================ -->

<xsl:function name="fp:localization" as="element(l:l10n)" cache="yes">
  <xsl:param name="language" as="xs:string"/>

  <xsl:variable name="fn-region" select="lower-case($language) =&gt; replace('-', '_')"/>
  <xsl:variable name="fn" select="if (contains($fn-region, '_'))
                                  then substring-before($fn-region, '_')
                                  else ()"/>

  <xsl:choose>
    <xsl:when test="doc-available('../locale/' || $fn-region || '.xml')">
      <xsl:sequence select="doc('../locale/' || $fn-region || '.xml')/l:l10n"/>
    </xsl:when>
    <xsl:when test="exists($fn) and doc-available('../locale/' || $fn || '.xml')">
      <xsl:sequence select="doc('../locale/' || $fn || '.xml')/l:l10n"/>
    </xsl:when>
    <xsl:when test="$language != $default-language">
      <xsl:sequence select="fp:localization($default-language)"/>
    </xsl:when>
    <xsl:when test="doc-available('../locale/en.xml')">
      <xsl:sequence select="doc('../locale/en.xml')/l:l10n"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message terminate="yes"
                   select="'Failed to load localization or fallback localization'"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<!-- ============================================================ -->

<xsl:function name="fp:localization-template" as="item()*">
  <xsl:param name="node" as="element()"/>
  <xsl:param name="group" as="xs:string"/>
  <xsl:sequence select="fp:localization-template($node, $group, ())"/>
</xsl:function>

<xsl:function name="fp:localization-template" as="item()*">
  <xsl:param name="node" as="element()"/>
  <xsl:param name="group" as="xs:string"/>
  <xsl:param name="key" as="xs:string?"/>

  <xsl:variable name="lang" select="f:l10n-language($node)"/>

  <xsl:choose>
    <xsl:when test="exists(fp:lookup-localization-template($node, $lang, $group, $key))">
      <xsl:sequence select="fp:lookup-localization-template($node, $lang, $group, $key)"/>
    </xsl:when>
    <xsl:when test="exists(fp:lookup-localization-template($node, $default-language, $group, $key))">
      <xsl:if test="f:is-true($warn-about-missing-localizations)">
        <xsl:variable name="dkey" select="($key, local-name($node))[1]"/>
        <xsl:message expand-text="yes"
        >No localization for {$group}/{$dkey} in {$lang}, using {$default-language}</xsl:message>
      </xsl:if>
      <xsl:sequence select="fp:lookup-localization-template($node, $default-language, $group, $key)"/>
    </xsl:when>
    <xsl:when test="exists(fp:lookup-localization-template($node, 'en', $group, $key))">
      <xsl:if test="f:is-true($warn-about-missing-localizations)">
        <xsl:variable name="dkey" select="($key, local-name($node))[1]"/>
        <xsl:message expand-text="yes"
        >No localization for {$group}/{$dkey} in {$lang}, using en</xsl:message>
      </xsl:if>
      <xsl:sequence select="fp:lookup-localization-template($node, 'en', $group, $key)"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="f:is-true($warn-about-missing-localizations)">
        <xsl:variable name="dkey" select="($key, local-name($node))[1]"/>
        <xsl:message expand-text="yes"
        >No localization for {$group}/{$dkey} in {$lang}, using "MISSING"</xsl:message>
      </xsl:if>
      <lt:text>MISSING</lt:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fp:lookup-localization-template" as="element(l:template)?" cache="yes">
  <xsl:param name="node" as="element()"/>
  <xsl:param name="lang" as="xs:string"/>
  <xsl:param name="group" as="xs:string"/>
  <xsl:param name="key" as="xs:string?"/>

  <xsl:variable name="l10n" select="fp:localization($lang)"/>

  <xsl:variable name="templates"
                select="$l10n/l:group[@name=$group]"/>

  <xsl:variable name="path"
                select="'/' || string-join($node/ancestor-or-self::* ! local-name(.), '/')"/>

  <xsl:variable name="templates" as="element(l:template)*">
    <xsl:for-each select="$templates/l:template">
      <xsl:choose>
        <xsl:when test="@key = '_default'">
          <xsl:sequence select="."/>
        </xsl:when>
        <xsl:when test="exists($key) and @key = $key">
          <xsl:sequence select="."/>
        </xsl:when>
        <xsl:when test="empty($key) and @key = local-name($node)">
          <xsl:sequence select="."/>
        </xsl:when>
        <xsl:when test="starts-with(@key, '/') and @key = $path">
          <xsl:sequence select="."/>
        </xsl:when>
        <xsl:when test="contains(@key, '/') and ends-with($path, '/'||@key)">
          <xsl:sequence select="."/>
        </xsl:when>
        <xsl:otherwise/>
      </xsl:choose>
    </xsl:for-each>
  </xsl:variable>

  <xsl:sequence select="$templates[1]"/>
</xsl:function>

<!-- ============================================================ -->

<xsl:function name="fp:localization-list" as="item()*">
  <xsl:param name="node" as="element()"/>
  <xsl:param name="name" as="xs:string"/>

  <xsl:variable name="lang" select="f:l10n-language($node)"/>

  <xsl:choose>
    <xsl:when test="exists(fp:lookup-localization-list($node, $lang, $name))">
      <xsl:sequence select="fp:lookup-localization-list($node, $lang, $name)"/>
    </xsl:when>
    <xsl:when test="exists(fp:lookup-localization-list($node, $default-language, $name))">
      <xsl:if test="f:is-true($warn-about-missing-localizations)">
        <xsl:message expand-text="yes"
        >No localization list for {$name} in {$lang}, using {$default-language}</xsl:message>
      </xsl:if>
      <xsl:sequence select="fp:lookup-localization-list($node, $default-language, $name)"/>
    </xsl:when>
    <xsl:when test="exists(fp:lookup-localization-list($node, 'en', $name))">
      <xsl:if test="f:is-true($warn-about-missing-localizations)">
        <xsl:message expand-text="yes"
        >No localization list for {$name}in {$lang}, using en</xsl:message>
      </xsl:if>
      <xsl:sequence select="fp:lookup-localization-list($node, 'en', $name)"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="f:is-true($warn-about-missing-localizations)">
        <xsl:message expand-text="yes"
        >No localization list for {$name} in {$lang}, using "MISSING"</xsl:message>
      </xsl:if>
      <lt:text>MISSING</lt:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fp:lookup-localization-list" as="element(l:list)?" cache="yes">
  <xsl:param name="node" as="element()"/>
  <xsl:param name="lang" as="xs:string"/>
  <xsl:param name="name" as="xs:string"/>

  <xsl:variable name="l10n" select="fp:localization($lang)"/>

  <xsl:choose>
    <xsl:when test="$l10n/l:list[@name=$name]">
      <xsl:sequence select="$l10n/l:list[@name=$name]"/>
    </xsl:when>
    <xsl:when test="$l10n/l:list[@name='_default']">
      <xsl:sequence select="$l10n/l:list[@name='_default']"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<!-- ============================================================ -->

<xsl:function name="fp:localization-property" as="xs:string">
  <xsl:param name="node" as="element()"/>
  <xsl:param name="properties" as="xs:string"/>
  <xsl:param name="key" as="xs:string"/>

  <xsl:variable name="lang" select="f:l10n-language($node)"/>

  <xsl:choose>
    <xsl:when test="exists(fp:lookup-localization-property($node, $lang, $properties, $key))">
      <xsl:sequence select="fp:lookup-localization-property($node, $lang, $properties, $key)"/>
    </xsl:when>
    <xsl:when test="exists(fp:lookup-localization-property($node, $default-language, $properties, $key))">
      <xsl:if test="f:is-true($warn-about-missing-localizations)">
        <xsl:message expand-text="yes"
        >No localization for {$properties}/{$key} in {$lang}, using {$default-language}</xsl:message>
      </xsl:if>
      <xsl:sequence select="fp:lookup-localization-property($node, $default-language, $properties, $key)"/>
    </xsl:when>
    <xsl:when test="exists(fp:lookup-localization-property($node, 'en', $properties, $key))">
      <xsl:if test="f:is-true($warn-about-missing-localizations)">
        <xsl:message expand-text="yes"
        >No localization for {$properties}/{$key} in {$lang}, using en</xsl:message>
      </xsl:if>
      <xsl:sequence select="fp:lookup-localization-property($node, 'en', $properties, $key)"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="f:is-true($warn-about-missing-localizations)">
        <xsl:message expand-text="yes"
        >No localization for {$properties}/{$key} in {$lang}, using "MISSING"</xsl:message>
      </xsl:if>
        <xsl:sequence select="'MISSING'"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fp:lookup-localization-property" as="xs:string?">
  <xsl:param name="node" as="element()"/>
  <xsl:param name="lang" as="xs:string"/>
  <xsl:param name="properties" as="xs:string"/>
  <xsl:param name="key" as="xs:string"/>

  <xsl:variable name="l10n" select="fp:localization($lang)"/>
  <xsl:variable name="props"
                select="$l10n/l:properties[@name=$properties]"/>
  <xsl:variable name="property"
                select="($props/l:property[@name = $key],
                        $props/l:property[@name = '_default'])[1]"/>

  <xsl:sequence select="$property/@value/string()"/>
</xsl:function>

<!-- ============================================================ -->

<xsl:function name="fp:gentext-token" as="item()*">
  <xsl:param name="lang" as="xs:string"/>
  <xsl:param name="token" as="xs:string"/>

  <xsl:variable name="l10n" select="fp:localization($lang)"/>
  <xsl:sequence select="($l10n/l:gentext/l:token[@key=$token])[1]/node()"/>
</xsl:function>

<!-- ============================================================ -->

<xsl:template match="*" mode="m:gentext">
  <xsl:param name="group" as="xs:string"/>
  <xsl:param name="key" as="xs:string" select="local-name(.)"/>
  <xsl:param name="content" as="item()*" select="()"/>

  <xsl:variable name="template"
                select="fp:localization-template(., $group, $key)"/>

  <xsl:apply-templates select="$template" mode="mp:localization">
    <xsl:with-param name="context" select="."/>
    <xsl:with-param name="content" select="$content"/>
    <xsl:with-param name="group" select="$group"/>
    <xsl:with-param name="key" select="$key"/>
  </xsl:apply-templates>
</xsl:template>

</xsl:stylesheet>
