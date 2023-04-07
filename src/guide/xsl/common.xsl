<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:a="http://nwalsh.com/ns/xslt/analysis"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:fg="http://docbook.org/ns/guide/functions"
                xmlns:h="http://www.w3.org/1999/xhtml"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:mg="http://docbook.org/ns/guide/modes"
                xmlns:t="http://docbook.org/ns/docbook/templates"
                xmlns:tg="http://docbook.org/ns/guide/templates"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                default-mode="m:docbook"
                exclude-result-prefixes="a db f fg h m map mg t tg v xi xlink xs"
                version="3.0">

<xsl:param name="explorer.xml" as="xs:string" required="yes"/>
<xsl:variable name="explorer" select="doc($explorer.xml)"/>
<!-- Load the whole stylesheet; well, down to one level of nesting -->
<xsl:variable name="main.xsl"
              select="resolve-uri('../../../build/xslt/docbook.xsl', static-base-uri())"/>
<xsl:variable name="param_xsl">
  <main xmlns="">
    <xsl:apply-templates select="doc($main.xsl)/*" mode="mg:collect-imports"/>
  </main>
</xsl:variable>

<xsl:param name="bookVersion" as="xs:string" required="yes"/>
<xsl:param name="xslTNGversion" as="xs:string" required="yes"/>

<!-- ============================================================ -->

<xsl:param name="refentry.generate.name" select="false()"/>
<xsl:param name="refentry.generate.title" select="true()"/>
<xsl:param name="dynamic-profiles" as="xs:string" select="'true'"/>

<xsl:param name="funcsynopsis-default-style" select="'ansi'"/>
<xsl:param name="funcsynopsis-trailing-punctuation" select="''"/>
<xsl:param name="funcsynopsis-table-threshold" select="0"/>

<xsl:param name="chunk-exclude"
           select="('self::db:partintro',
                    'self::*[ancestor::db:partintro]',
                    'self::db:section')"/>

<xsl:param name="sections-inherit-from" select="'component section'"/>

<xsl:param name="section-toc-depth" select="1"/>
<xsl:param name="footnote-numeration" select="('*', '**', '†','‡', '§', '1')"/>

<!-- ============================================================ -->

<xsl:key name="sections" match="db:section" use="db:info/db:biblioid"/>
<xsl:key name="refentry" match="db:refentry"
         use="db:refmeta/db:refmiscinfo[not(@class)]"/>

<xsl:key name="modes" match="a:template" use="@mode"/>
<xsl:key name="functions" match="a:function" use="@name"/>
<xsl:key name="templates" match="a:template" use="@name"/>
<xsl:key name="variables" match="a:stylesheet/a:variable" use="@name"/>
<xsl:key name="a-by-name" match="a:*" use="@name|@mode"/>
<xsl:key name="a-by-id" match="a:*" use="@id"/>
<xsl:key name="things" match="a:*" use="@id"/>
<xsl:key name="used" use="."
         match="a:variable[not(@*)]
                |a:function[not(@*)]
                |a:template[not(@*)]"/>

<!-- ============================================================ -->

<xsl:template match="db:book" mode="m:generate-titlepage">
  <header>
    <div class="cover">
      <div class="image">
        <img src="media/cover.png"/>
      </div>
      <div class="text">
        <div class="fill">
          <h1><xsl:value-of select="db:info/db:title"/></h1>
          <div class="authorgroup">
            <span class="label">
              <xsl:text>Author: </xsl:text>
            </span>
            <xsl:apply-templates select="db:info/db:author"/>
          </div>
          <div class="version">
            <xsl:text>Version </xsl:text>
            <xsl:sequence select="$bookVersion"/>
          </div>
          <div class="date">
            <xsl:text>Updated: </xsl:text>
            <xsl:apply-templates select="db:info/db:pubdate"/>
          </div>
          <xsl:if test="$output-media = 'print'">
            <xsl:apply-templates select="db:info/db:revhistory"/>
          </xsl:if>
          <p class="copyright">
            <a href="copyright{$html-extension}">Copyright</a>
            <xsl:text> &#xA9; </xsl:text>
            <xsl:value-of select="/db:book/db:info/db:copyright/db:year[1]"/>
            <xsl:if test="/db:book/db:info/db:copyright/db:year[2]">
              <xsl:text>–</xsl:text>
              <xsl:value-of select="/db:book/db:info/db:copyright/db:year[last()]"/>
            </xsl:if>
            <xsl:text> </xsl:text>
            <xsl:value-of select="/db:book/db:info/db:copyright/db:holder"/>
            <xsl:text>.</xsl:text>
          </p>
        </div>
      </div>
    </div>
  </header>
  <xsl:if test="$output-media = 'screen'">
    <details>
      <summary>Revision history</summary>
      <xsl:apply-templates select="db:info/db:revhistory"/>
    </details>
  </xsl:if>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="db:refnamediv">
  <xsl:for-each select="../db:refmeta/db:refmiscinfo[not(@class)]">
    <div id="{../../db:refnamediv/db:refclass}-{fg:checksum(.)}"/>
  </xsl:for-each>

  <xsl:next-match/>

  <xsl:variable name="obsolete"
                select="../db:refmeta/db:refmiscinfo[@otherclass='obsolete']"/>

  <xsl:choose>
    <xsl:when test="empty($obsolete)">
      <xsl:call-template name="tg:detail"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="db:refclass = 'mode'">
        <p>
          <xsl:text>Obsolete as of version </xsl:text>
          <xsl:apply-templates select="$obsolete/node()"/>
          <xsl:text>.</xsl:text>
        </p>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>

  <xsl:variable
      name="objects"
      select="key('a-by-name', ../db:refmeta/db:refmiscinfo[not(@class)], $explorer)"/>

  <xsl:choose>
    <xsl:when test="exists($obsolete) and empty($objects)"/>
    <xsl:when test="db:refclass = 'function' and $objects/self::a:function">
      <xsl:variable name="synopsis">
        <refsynopsisdiv xmlns="http://docbook.org/ns/docbook">
          <xsl:attribute name="xml:id" select="'_refsynopsisdiv-'||generate-id(.)"/>
          <xsl:for-each select="$objects/self::a:function">
            <funcsynopsis>
              <funcprototype>
                <funcdef>
                  <function>
                    <xsl:sequence select="substring-before(@display-name, '#')"/>
                  </function>
                  <xsl:if test="@as">
                    <type>
                      <xsl:sequence select="@as/string()"/>
                    </type>
                  </xsl:if>
                </funcdef>
                <xsl:choose>
                  <xsl:when test="a:param">
                    <xsl:for-each select="a:param">
                      <paramdef>
                        <parameter>
                          <xsl:value-of select="@name/string()"/>
                        </parameter>
                        <xsl:if test="@as">
                          <type>
                            <xsl:value-of select="@as/string()"/>
                          </type>
                        </xsl:if>
                      </paramdef>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <void/>
                  </xsl:otherwise>
                </xsl:choose>
              </funcprototype>
            </funcsynopsis>
          </xsl:for-each>
        </refsynopsisdiv>
      </xsl:variable>
      <xsl:apply-templates select="$synopsis/node()"/>
    </xsl:when>
    <xsl:when test="db:refclass = 'variable' and $objects/self::a:variable">
      <xsl:variable name="synopsis">
        <xsl:variable name="initializer"
                      select="empty(db:refclass[contains-token(@role, 'noinitializer')])"/>
        <refsynopsisdiv xmlns="http://docbook.org/ns/docbook">
          <xsl:attribute name="xml:id" select="'_refsynopsisdiv-'||generate-id(.)"/>
          <xsl:for-each select="$objects/self::a:variable">
            <xsl:variable name="dname"
                          select="@display-name/string()"/>
            <xsl:variable name="decl"
                          select="$param_xsl//xsl:param[@name=$dname]
                                  |$param_xsl//xsl:variable[@name=$dname]"/>

            <xsl:if test="count($decl) != 1">
              <xsl:message select="count($decl), ': ', $dname"/>
            </xsl:if>

            <fieldsynopsis>
              <xsl:if test="@as">
                <type>
                  <xsl:sequence select="@as/string()"/>
                </type>
              </xsl:if>
              <varname>
                <xsl:value-of select="@display-name/string()"/>
              </varname>
              <xsl:if test="$decl and $initializer">
                <initializer>
                  <xsl:sequence select="$decl/@select/string()"/>
                </initializer>
              </xsl:if>
            </fieldsynopsis>
            <xsl:if test="not($decl/@select) and count($decl) = 1 and $initializer">
              <xsl:variable name="content">
                <xsl:apply-templates select="$decl" mode="m:strip-ns"/>
              </xsl:variable>
              <!-- Serialize the content and then excise the xmlns:xsl namespace -->
              <xsl:variable name="content"
                            select="serialize($content, map { 'indent': true() })"/>
              <xsl:variable
                  name="content"
                  select="replace($content,
                          '\s+xmlns:xsl=.http://www.w3.org/1999/XSL/Transform.&#10;\s*',
                          ' ')"/>
              <!-- in case there wasn't a newline after it... -->
              <xsl:variable
                  name="content"
                  select="replace($content,
                          '\s+xmlns:xsl=.http://www.w3.org/1999/XSL/Transform.\s*',
                          ' ')"/>
              <programlisting language="xml" linenumbering="unnumbered">
                <xsl:sequence select="$content"/>
              </programlisting>
            </xsl:if>
          </xsl:for-each>
        </refsynopsisdiv>
      </xsl:variable>
      <xsl:apply-templates select="$synopsis/node()"/>
    </xsl:when>
    <xsl:when test="db:refclass = 'template' and $objects/self::a:template">
      <xsl:variable name="synopsis">
        <refsynopsisdiv xmlns="http://docbook.org/ns/docbook">
          <xsl:attribute name="xml:id" select="'_refsynopsisdiv-'||generate-id(.)"/>
          <xsl:for-each select="$objects">
            <xsl:variable name="param" as="element()*">
              <xsl:for-each select="a:param[not(starts-with(@name, 'vp:'))]">
                <!-- XSLT Explorer doesn't pass us the select expressions -->
                <wrapper xsl:expand-text="yes">
                  <xsl:text>  &lt;xsl:param name="{@name/string()}"</xsl:text>
                  <xsl:if test="@as">
                    <xsl:text> as="{@as/string()}"</xsl:text>
                  </xsl:if>
                  <xsl:if test="@select">
                    <xsl:text> select="{@select/string()}"</xsl:text>
                  </xsl:if>
                  <xsl:text>/&gt;</xsl:text>
                </wrapper>
              </xsl:for-each>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="$param">
                <synopsis xsl:expand-text="yes"
                          ><xsl:processing-instruction name="db" select="' verbatim-style=''plain'''"/>&lt;xsl:template name="{@display-name}"&gt;
                <xsl:sequence select="string-join($param ! string(.), '&#10;')"/>
                &lt;/xsl:template&gt;</synopsis>
              </xsl:when>
              <xsl:otherwise>
                <synopsis xsl:expand-text="yes"
                          ><xsl:processing-instruction name="db" select="' verbatim-style=''plain'''"/>&lt;xsl:template name="{@display-name}"/&gt;</synopsis>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </refsynopsisdiv>
      </xsl:variable>
      <xsl:apply-templates select="$synopsis/node()"/>
    </xsl:when>
    <xsl:when test="db:refclass = 'param'"/>
    <xsl:when test="db:refclass = 'mode'"/>
    <xsl:when test="db:refclass = 'pi'"/>
    <xsl:when test="db:refclass = 'function'"/>
    <xsl:otherwise>
      <xsl:message select="'No match in refnamediv: ' || db:refname[1]"/>
      <xsl:message select="., $objects"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:fieldsynopsis">
  <xsl:if test="empty(following-sibling::db:programlisting)">
    <div class="pre-wrap">
      <pre>
        <xsl:apply-templates select="db:varname"/>
        <xsl:if test="db:type">
          <code class="gen"> as </code>
          <xsl:apply-templates select="db:type"/>
        </xsl:if>
        <xsl:if test="db:initializer">
          <code class="gen"> := </code>
          <xsl:sequence select="normalize-space(db:initializer)"/>
        </xsl:if>
      </pre>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template match="db:refentrytitle">
  <xsl:variable name="obsolete"
                select="../db:refmiscinfo[@otherclass='obsolete']"/>

  <xsl:choose>
    <xsl:when test="exists($obsolete)">
      <xsl:variable name="name">
        <xsl:next-match/>
      </xsl:variable>
      <span class="obsolete">
        <xsl:sequence select="$name"/>
      </span>
    </xsl:when>
    <xsl:otherwise>
      <xsl:next-match/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:parameter[not(ancestor::db:refsynopsisdiv)]">
  <a href="#p_{normalize-space(.)}">
    <code class="paramname">$<xsl:apply-templates/></code>
  </a>
</xsl:template>

<xsl:template match="db:parameter">
  <a href="#p_{normalize-space(.)}">
    <code class="paramname">$<xsl:apply-templates/></code>
  </a>
</xsl:template>

<xsl:template match="db:parameter" mode="m:ansi-table">
  <code>
    <xsl:apply-templates select="." mode="m:attributes"/>
    <xsl:text>$</xsl:text>
    <xsl:apply-templates mode="m:ansi-table"/>
  </code>
</xsl:template>

<xsl:template match="db:varname[not(ancestor::db:refsynopsisdiv)]">
  <xsl:variable name="name" select="normalize-space(.)"/>
  <xsl:variable name="name" select="if (starts-with($name, 'v:'))
                                    then substring-after($name, 'v:')
                                    else $name"/>

  <xsl:variable name="id"
                select="if (key('id', 'v_'||$name))
                        then 'v_'||$name
                        else if (key('id', 'p_'||$name))
                             then 'p_'||$name
                             else ()"/>

  <xsl:choose>
    <xsl:when test="empty($id)">
      <xsl:message select="'No refentry for $' || normalize-space(.)"/>
      <xsl:next-match/>
    </xsl:when>
    <xsl:when test="ancestor::db:refentry[@xml:id=$id]">
      <xsl:next-match/>
    </xsl:when>
    <xsl:otherwise>
      <a href="#{$id}">
        <xsl:next-match/>
      </a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:varname">
  <code class="varname">
    <xsl:text>$</xsl:text>
    <xsl:apply-templates/>
  </code>
</xsl:template>

<xsl:template match="db:function">
  <xsl:variable name="id" select="translate(normalize-space(.),':','_')"/>
  <xsl:choose>
    <xsl:when test="ancestor::db:refentry[@xml:id = $id]">
      <code class="funcname"><xsl:apply-templates/>()</code>
    </xsl:when>
    <xsl:otherwise>
      <a href="#{$id}">
        <code class="funcname"><xsl:apply-templates/>()</code>
      </a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:code[contains-token(@role, 'template')]">
  <xsl:variable name="id" select="translate(normalize-space(.),':','_')"/>
  <xsl:choose>
    <xsl:when test="ancestor::db:refentry[@xml:id = $id]">
      <code class="template"><xsl:apply-templates/></code>
    </xsl:when>
    <xsl:otherwise>
      <a href="#{$id}">
        <code class="template"><xsl:apply-templates/></code>
      </a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:code[contains-token(@role, 'mode')]">
  <xsl:variable name="id" select="translate(normalize-space(.),':','_')"/>
  <xsl:choose>
    <xsl:when test="ancestor::db:refentry[@xml:id = $id]">
      <code class="mode"><xsl:apply-templates/></code>
    </xsl:when>
    <xsl:otherwise>
      <a href="#{$id}">
        <code class="mode"><xsl:apply-templates/></code>
      </a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:errorcode">
  <xsl:variable name="id" select="'v_' || translate(normalize-space(.),':','_')"/>
  <xsl:choose>
    <xsl:when test="ancestor::db:refentry[@xml:id = $id]">
      <code class="errorcode"><xsl:apply-templates/></code>
    </xsl:when>
    <xsl:otherwise>
      <a href="#{$id}">
        <code class="errorcode"><xsl:apply-templates/></code>
      </a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:type">
  <code>
    <xsl:apply-templates/>
  </code>
</xsl:template>

<xsl:template match="db:type" mode="m:ansi-table">
  <span class="gen"> as </span>
  <span>
    <xsl:apply-templates select="." mode="m:attributes"/>
    <xsl:apply-templates mode="m:ansi-table"/>
  </span>
</xsl:template>

<xsl:template match="db:funcdef" mode="m:ansi-table">
  <span>
    <xsl:apply-templates select="." mode="m:attributes"/>
    <xsl:apply-templates select="* except db:type" mode="m:ansi-table"/>
  </span>
</xsl:template>

<xsl:template match="db:paramdef" mode="m:ansi-table">
  <td>
    <xsl:apply-templates select="." mode="m:attributes"/>
    <xsl:apply-templates mode="m:ansi-table"/>
    <xsl:choose>
      <xsl:when test="following-sibling::*">
        <xsl:sequence select="','"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="')'"/>
        <xsl:if test="../db:funcdef/db:type">
          <span class="gen"> as </span>
          <xsl:apply-templates select="../db:funcdef/db:type"/>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </td>
</xsl:template>

<xsl:template match="db:void" mode="m:ansi-table">
  <td>
    <span>
      <xsl:apply-templates select="." mode="m:attributes"/>
      <xsl:apply-templates mode="m:ansi-table"/>
    </span>
    <xsl:text>)</xsl:text>
    <xsl:if test="../db:funcdef/db:type">
      <span class="gen"> as </span>
      <xsl:apply-templates select="../db:funcdef/db:type"/>
    </xsl:if>
  </td>
</xsl:template>

<xsl:template match="db:pubdate[not(node())]">
  <xsl:variable name="Z" select="xs:dayTimeDuration('PT0S')"/>
  <time class="pubdate"
        datetime="{format-dateTime(
                    adjust-dateTime-to-timezone(current-dateTime(), $Z),
                    '[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01]Z')}">
    <xsl:sequence select="format-dateTime(current-dateTime(),
                             '[D01] [MNn,*-3] [Y0001]')"/>
  </time>
</xsl:template>

<xsl:template match="processing-instruction('guide-module-index')">
  <xsl:for-each select="$explorer//a:stylesheet[@href]">
    <xsl:sort select="@href"/>
    
    <xsl:variable name="stylesheet" select="."/>
    <xsl:variable name="functions"
                  select="f:public(a:function)"/>
    <xsl:variable name="variables"
                  select="f:public(a:variable[contains-token(@class, 'variable')])"/>
    <xsl:variable name="params"
                  select="f:public(a:variable[contains-token(@class, 'param')])"/>
    <xsl:variable name="templates"
                  select="f:public(a:template[@name])"/>
    <xsl:variable name="modes" as="element(a:mode)*">
      <xsl:for-each select="distinct-values(a:template/@mode/string())">
        <xsl:variable name="mode" select="."/>
        <xsl:variable name="template" select="($stylesheet/a:template[@mode=$mode])[1]"/>
        <a:mode name="{.}" display-name="{$template/@display-mode}"/>
      </xsl:for-each>
    </xsl:variable>

    <xsl:if test="$functions or $variables or $params or $templates or $modes">
      <section>
        <header>
          <h3><xsl:sequence select="@href/string()"/></h3>
          <p>
            <xsl:for-each select="($functions, $variables, $params, $templates, $modes)">
              <xsl:sort select="substring-after(@name, '}')"/>
              <xsl:if test="position() gt 1">, </xsl:if>
              <xsl:apply-templates select="." mode="mg:reference"/>
            </xsl:for-each>
          </p>
        </header>
      </section>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template match="processing-instruction('guide-db-pi')">
  <xsl:variable name="refentries"
                select="//db:refentry
                          [.//db:indexterm
                            [normalize-space(db:primary)='db processing instruction']]"/>
  <p>See also:</p>
  <ul>
    <xsl:for-each select="$refentries">
      <li>
        <a href="#{@xml:id}">
          <xsl:apply-templates select="db:refmeta/db:refentrytitle/node()"/>
        </a>
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>

<xsl:template match="processing-instruction('guide-properties-as-table')">
  <xsl:variable name="prop"
                select="f:object-properties(resolve-uri(., base-uri(root(.)/*)))"/>
  <table class="property-table">
    <thead>
      <tr>
        <th>Property name</th>
        <th>
          <xsl:text>Property value&#x2009;</xsl:text>
          <sup id="ptf1"><a href="#fn.ptf1">a</a></sup>
        </th>
      </tr>
    </thead>
    <tbody>
      <xsl:for-each select="map:keys($prop)">
        <xsl:sort select="."/>
        <xsl:variable name="value"
                      select="string-join(map:get($prop, .) ! string(.), ', ')"/>
        <xsl:variable name="value"
                      select="if (string-length($value) gt 35)
                              then substring($value, 1, 35) || '…'
                              else $value"/>
        <tr>
          <td><xsl:sequence select="."/></td>
          <td><xsl:sequence select="$value"/></td>
        </tr>
      </xsl:for-each>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="2"><sup id="fn.ptf1"><a href="#ptf1">a</a></sup>Some values
        have been truncated to prevent the table from becoming unwieldy.
        These values an be identified by a trailing ellipsis (…).</td>
      </tr>
    </tfoot>
  </table>
</xsl:template>

<!-- ============================================================ -->

<xsl:template name="tg:detail">
  <xsl:variable
      name="objects"
      select="key('a-by-name', ../db:refmeta/db:refmiscinfo[not(@class)], $explorer)"/>

  <div class="a-detail mode-detail">
    <div>
      <div class="prop">
        <xsl:choose>
          <xsl:when test="../db:refnamediv/db:refclass = 'function'">
            <xsl:text>Function:</xsl:text>
          </xsl:when>
          <xsl:when test="../db:refnamediv/db:refclass = 'template'">
            <xsl:text>Template:</xsl:text>
          </xsl:when>
          <xsl:when test="../db:refnamediv/db:refclass = 'variable'">
            <xsl:text>Variable:</xsl:text>
          </xsl:when>
          <xsl:when test="../db:refnamediv/db:refclass = 'param'">
            <xsl:text>Parameter:</xsl:text>
          </xsl:when>
          <xsl:when test="../db:refnamediv/db:refclass = 'mode'">
            <xsl:text>Mode:</xsl:text>
          </xsl:when>
          <xsl:when test="../db:refnamediv/db:refclass = 'pi'">
            <xsl:text>Processing instruction:</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:message select="'Unrecognized refclass:',
                                 ../db:refnamediv/db:refclass/string()"/>
            <xsl:text>???</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </div>
      <div><xsl:sequence select="../db:refmeta/db:refmiscinfo[not(@class)][1]/node()"/></div>
    </div>
    <xsl:for-each select="../db:refmeta/db:refmiscinfo[not(@class)][position() gt 1]">
      <div>
        <div/>
        <div><xsl:sequence select="node()"/></div>
      </div>
    </xsl:for-each>

    <xsl:choose>
      <xsl:when test="contains(../db:refmeta/db:refmiscinfo[not(@class)][1],
                      '{http://docbook.org/extensions/xslt}')">
        <!-- this is an extension function -->
      </xsl:when>
      <xsl:when test="../db:refnamediv/db:refclass = 'pi'">
        <!-- this doesn't have anything to point to -->
      </xsl:when>
      <xsl:when test="empty($objects)">
        <xsl:message select="'Non-existant:',
                             ../db:refmeta/db:refmiscinfo[not(@class)]/string()"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="defined-in" as="element()*">
          <xsl:variable name="ssrefs" select="fg:ssrefs($objects, map{})"/>
          <xsl:for-each select="map:keys($ssrefs)">
            <xsl:sort select="."/>

            <xsl:choose>
              <xsl:when test="count(map:get($ssrefs, .)) gt 1">
                <span>
                  <xsl:sequence select="map:get($ssrefs, .)[1]"/>
                  <xsl:sequence select="' (' || count(map:get($ssrefs, .)) || ')'"/>
                </span>
              </xsl:when>
              <xsl:otherwise>
                <xsl:sequence select="map:get($ssrefs, .)"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="used-by" as="node()*">
          <xsl:apply-templates select="$objects" mode="mg:used-by">
            <xsl:sort select="string(.)"/>
          </xsl:apply-templates>
        </xsl:variable>

        <xsl:variable name="used-by" as="node()*">
          <xsl:for-each-group select="$used-by" group-by="@href">
            <xsl:sequence select="current-group()[1]"/>
          </xsl:for-each-group>
        </xsl:variable>

        <xsl:variable name="used-in" as="xs:string*">
          <xsl:apply-templates select="$objects" mode="mg:used-in">
            <xsl:sort select="string(.)"/>
          </xsl:apply-templates>
        </xsl:variable>
        <xsl:variable name="used-in" select="distinct-values($used-in)"/>

        <div>
          <div class="prop">Defined in:</div>
          <div>
            <xsl:for-each select="$defined-in">
              <xsl:if test="position() gt 1">, </xsl:if>
              <xsl:sequence select="."/>
            </xsl:for-each>
          </div>
        </div>
        <xsl:if test="not(db:refclass = 'mode')">
          <div>
            <div class="prop">Used in:</div>
            <div>
              <xsl:choose>
                <xsl:when test="empty($used-in)">
                  <span class="unused">Not used.</span>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:sequence select="string-join($used-in, ', ')"/>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </xsl:if>
        <xsl:if test="exists($used-by)">
          <div>
            <div class="prop">Used by:</div>
            <div>
              <xsl:for-each select="$used-by">
                <xsl:if test="position() gt 1">, </xsl:if>
                <xsl:sequence select="."/>
              </xsl:for-each>
            </div>
          </div>
        </xsl:if>
        <xsl:if test="$objects/self::a:variable and $objects/@static = 'yes'">
          <div>
            <div class="prop">Static:</div>
            <div>Yes</div>
          </div>
        </xsl:if>
        <xsl:if test="../db:refmeta/db:refmiscinfo[@class='version']">
          <div>
            <div class="prop">Since:</div>
            <div>
              <xsl:apply-templates
                  select="../db:refmeta/db:refmiscinfo[@class='version']/node()"/>
            </div>
          </div>
        </xsl:if>
        <xsl:if test="../db:refmeta/db:refmiscinfo[@otherclass='deprecated']">
          <div>
            <div class="prop">Deprecated since:</div>
            <div>
              <xsl:apply-templates
                  select="../db:refmeta/db:refmiscinfo[@otherclass='deprecated']/node()"/>
            </div>
          </div>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </div>
</xsl:template>

<xsl:template match="*" mode="mg:used-by" as="node()*">
</xsl:template>

<xsl:template match="a:variable|a:function|a:template"
              mode="mg:used-by" as="node()*">
  <xsl:for-each select="a:used-by">
    <xsl:variable name="referent" select="key('things', ., $explorer)"/>
    <xsl:apply-templates select="$referent" mode="mg:reference"/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="*" mode="mg:used-in">
</xsl:template>

<xsl:template match="a:variable|a:function|a:template"
              mode="mg:used-in" as="xs:string*">
  <xsl:for-each select="a:used-by-module">
    <xsl:variable name="referent" select="key('things', ., $explorer)"/>
    <xsl:apply-templates select="$referent" mode="mg:reference"/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="*" mode="mg:reference" as="element()?">
  <xsl:choose>
    <xsl:when test="contains(@name, '/private')"/>
    <xsl:when test="self::a:template and @name">
      <a class="template" href="#template-{fg:checksum(@name)}">
        <xsl:sequence select="@display-name/string()"/>
      </a>
    </xsl:when>
    <xsl:when test="self::a:template"/>
    <xsl:when test="self::a:function[@name]">
      <a class="function" href="#function-{fg:checksum(@name)}">
        <xsl:sequence select="substring-before(@display-name, '#')||'()'"/>
      </a>
    </xsl:when>
    <xsl:when test="self::a:variable[contains-token(@class, 'param')]">
      <a class="variable" href="#param-{fg:checksum(@name)}">
        <xsl:sequence select="'$'||@display-name/string()"/>
      </a>
    </xsl:when>
    <xsl:when test="self::a:variable[@name]">
      <a class="variable" href="#variable-{fg:checksum(@name)}">
        <xsl:sequence select="'$'||@display-name/string()"/>
      </a>
    </xsl:when>
    <xsl:when test="self::a:stylesheet[@href]">
      <span class="stylesheet">
        <xsl:sequence select="@href/string()"/>
      </span>
    </xsl:when>
    <xsl:when test="self::a:stylesheet">
      <span class="stylesheet">
        <xsl:text>docbook.xsl</xsl:text>
      </span>
    </xsl:when>
    <!-- N.B. These are manufactured in this stylesheet! -->
    <xsl:when test="self::a:mode">
      <a class="mode" href="#mode-{fg:checksum(@name)}">
        <xsl:sequence select="@display-name/string()"/>
      </a>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message select="'Ref: ', ."/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="element()" mode="m:strip-ns">
  <xsl:element name="{local-name(.)}" namespace="">
    <xsl:apply-templates select="@*,node()" mode="m:strip-ns"/>
  </xsl:element>
</xsl:template>

<xsl:template match="xsl:*" mode="m:strip-ns">
  <xsl:element name="{node-name(.)}" namespace="http://www.w3.org/1999/XSL/Transform">
    <xsl:apply-templates select="@*,node()" mode="m:strip-ns"/>
  </xsl:element>
</xsl:template>

<xsl:template match="text()|attribute()|processing-instruction()|comment()"
              mode="m:strip-ns">
  <xsl:copy/>
</xsl:template>

<!-- ============================================================ -->

<xsl:function name="f:undocumented">
  <xsl:param name="names" as="xs:string*"/>
  <xsl:param name="root" as="document-node()"/>
  <xsl:param name="msg" as="xs:string"/>

  <xsl:variable name="namespaces"
                select="distinct-values(
                          $names ! substring-after(substring-before(., '}'), '{'))"/>
  <xsl:for-each select="$namespaces">
    <xsl:sort select="."/>
    <xsl:if test="not(contains(., '/private'))">
      <xsl:variable name="prefix" select="'{'||.||'}'"/>
      <xsl:variable name="names" as="xs:string*">
        <xsl:for-each select="$names[starts-with(., $prefix)]">
          <xsl:sequence select="substring-after(., '}')"/>
        </xsl:for-each>
      </xsl:variable>
      <xsl:for-each select="distinct-values($names)">
        <xsl:sort select="."/>
        <xsl:variable name="ns" select="$prefix || ."/>
        <xsl:if test="not(key('refentry', $ns, $root))">
          <xsl:message select="$msg, $ns"/>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
  </xsl:for-each>
</xsl:function>

<!-- ============================================================ -->

<xsl:function name="f:public" as="element()*">
  <xsl:param name="items" as="element()*"/>
  <xsl:for-each select="$items">
    <xsl:if test="not(contains(@name, '/private'))">
      <xsl:sequence select="."/>
    </xsl:if>
  </xsl:for-each>
</xsl:function>

<!-- ============================================================ -->

<xsl:template name="t:top-nav">
  <xsl:param name="docbook" as="node()" tunnel="yes"/>
  <xsl:param name="chunk" as="xs:boolean"/>
  <xsl:param name="node" as="element()"/>
  <xsl:param name="prev" as="element()?"/>
  <xsl:param name="next" as="element()?"/>
  <xsl:param name="up" as="element()?"/>
  <xsl:param name="top" as="element()?"/>

  <span class="nav">
    <a title="{$docbook/db:book/db:info/db:title}" href="{$top/@db-chunk/string()}">
      <i class="fas fa-home"></i>
    </a>
    <xsl:text>&#160;</xsl:text>

    <xsl:choose>
      <xsl:when test="exists($prev)">
        <a href="{$prev/@db-chunk/string()}" title="{f:title-content($prev)}">
          <i class="fas fa-arrow-left"></i>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <span class="inactive">
          <i class="fas fa-arrow-left"></i>
        </span>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#160;</xsl:text>

    <xsl:choose>
      <xsl:when test="exists($up)">
        <a title="{f:title-content($up)}" href="{$up/@db-chunk/string()}">
          <i class="fas fa-arrow-up"></i>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <span class="inactive">
          <i class="fas fa-arrow-up"></i>
        </span>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#160;</xsl:text>

    <xsl:choose>
      <xsl:when test="exists($next)">
        <a title="{f:title-content($next)}"
           href="{$next/@db-chunk/string()}">
          <i class="fas fa-arrow-right"></i>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <span class="inactive">
          <i class="fas fa-arrow-right"></i>
        </span>
      </xsl:otherwise>
    </xsl:choose>
  </span>
  
  <span class="title">
    <i class="title"><xsl:value-of select="/h:html/h:head/h:title"/></i>
  </span>

  <span class="logo">
    <img src="media/xsltng-inverted.png"/>
  </span>
</xsl:template>

<xsl:template name="t:bottom-nav">
  <xsl:param name="docbook" as="node()" tunnel="yes"/>
  <xsl:param name="chunk" as="xs:boolean"/>
  <xsl:param name="node" as="element()"/>
  <xsl:param name="prev" as="element()?"/>
  <xsl:param name="next" as="element()?"/>
  <xsl:param name="up" as="element()?"/>
  <xsl:param name="top" as="element()?"/>

  <div class="navrow">
    <div class="navleft">
      <xsl:if test="count($prev)>0">
        <a title="{f:title-content($prev)}" href="{$prev/@db-chunk/string()}">
          <i class="fas fa-arrow-left"></i>
        </a>
      </xsl:if>
    </div>
    <div class="navmiddle">
      <xsl:if test="exists($top)">
        <a title="{f:title-content($top)}" href="{$top/@db-chunk/string()}">
          <i class="fas fa-home"></i>
        </a>
      </xsl:if>
    </div>
    <div class="navright">
      <xsl:if test="count($next)>0">
        <a title="{f:title-content($next)}" href="{$next/@db-chunk/string()}">
          <i class="fas fa-arrow-right"></i>
        </a>
      </xsl:if>
    </div>
  </div>

  <div class="navrow">
    <div class="navleft navtitle">
      <xsl:value-of select="f:title-content($prev)"/>
    </div>
    <div class="navmiddle">
      <xsl:if test="count($up) gt 0">
        <a title="{f:title-content($up)}" href="{$up/@db-chunk/string()}">
          <i class="fas fa-arrow-up"></i>
        </a>
      </xsl:if>
    </div>
    <div class="navright navtitle">
      <xsl:value-of select="f:title-content($next)"/>
    </div>
  </div>

  <xsl:variable name="db-node"
                select="key('genid', $node/@db-id, $docbook)"/>

  <div class="infofooter">
    <xsl:variable name="years" select="root($db-node)/db:book/db:info/db:copyright/db:year"/>
    <span class="copyrightfooter">
      <a href="dbcpyright{$html-extension}">Copyright</a>
      <xsl:text> &#xA9; </xsl:text>
      <xsl:value-of select="$years[1]"/>
      <xsl:if test="count($years) gt 1">
        <xsl:text>–</xsl:text>
        <xsl:value-of select="root($db-node)/db:book/db:info/db:copyright/db:year[last()]"/>
      </xsl:if>
      <xsl:text> Norman Walsh.</xsl:text>
    </span>

    <xsl:if test="$db-node/db:info/db:releaseinfo[@role='hash']">
      <xsl:variable name="hash"
                    select="$db-node/db:info/db:releaseinfo[@role='hash']"/>

      <span class="revision">
        <xsl:attribute name="title"
                       select="'git hash: '
                               || substring($hash, 1, 6)
                               || '…'"/>
        <xsl:text>Last revised by </xsl:text>
        <xsl:value-of
            select="substring-before($db-node/db:info/db:releaseinfo[@role='author'],
                                     ' &lt;')"/>
        <xsl:text> on </xsl:text>
        <xsl:for-each select="$db-node/db:info/db:pubdate">
          <!-- hack: there should be only one -->
          <xsl:if test=". castable as xs:dateTime">
            <xsl:value-of select="format-dateTime(. cast as xs:dateTime,
                                                  '[D1] [MNn,*-3] [Y0001]')"/>
          </xsl:if>
        </xsl:for-each>
      </span>
    </xsl:if>
  </div>
</xsl:template>

<xsl:function name="f:title-content" as="node()*">
  <xsl:param name="node" as="element()?"/>

  <xsl:variable name="header" select="($node/h:header, $node/h:article/h:header)[1]"/>

  <xsl:variable name="title" as="element()?"
                select="($header/h:h1,
                         $header/h:h2,
                         $header/h:h3,
                         $header/h:h4,
                         $header/h:h5)[1]"/>

  <xsl:variable name="title" as="element()?"
                select="if (exists($title))
                        then $title
                        else ($node/h:div[@class='refnamediv']
                                 /h:p/h:span[@class='refname'])[1]"/>
 
  <xsl:sequence select="$title/node()"/>
</xsl:function>

<!-- ============================================================ -->

<xsl:template match="*" mode="mg:collect-imports">
  <xsl:sequence select="xsl:param"/>
  <xsl:sequence select="xsl:variable"/>
  <xsl:for-each select="xsl:import">
    <xsl:variable name="xsl" select="doc(resolve-uri(@href, base-uri(.)))"/>
    <import href="{@href}">
      <xsl:apply-templates select="$xsl/*" mode="mg:collect-imports"/>
    </import>
  </xsl:for-each>
</xsl:template>

<!-- ============================================================ -->

<xsl:function name="fg:ssrefs" as="map(xs:string, element()+)">
  <xsl:param name="objects" as="element()*"/>
  <xsl:param name="map" as="map(xs:string, element()+)"/>

  <xsl:choose>
    <xsl:when test="empty($objects)">
      <xsl:sequence select="$map"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="car" select="subsequence($objects, 1, 1)"/>
      <xsl:variable name="cdr" select="subsequence($objects, 2)"/>

      <xsl:variable name="ss" select="$car/ancestor::a:stylesheet[1]"/>
      <xsl:variable name="href" select="if ($ss/@href)
                                        then $ss/@href/string()
                                        else 'docbook.xsl'"/>

      <xsl:variable name="elem" as="element()">
        <xsl:choose>
          <xsl:when test="$car/@line-number">
            <a href="../explorer/#line-{$ss/@id}-{$car/@line-number}">
              <xsl:sequence select="$href"/>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <span>
              <xsl:sequence select="$href"/>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="fg:ssrefs($cdr,
                               map:put($map, $href, (map:get($map, $href), $elem)))"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<!-- ============================================================ -->
<!-- From: https://stackoverflow.com/questions/6753343/using-xsl-to-make-a-hash-of-xml-file -->

<xsl:function name="fg:checksum" as="xs:string">
  <xsl:param name="str" as="xs:string"/>

  <xsl:variable name="codepoints" select="string-to-codepoints($str)"/>
  <xsl:variable name="checksum"
                select="fg:fletcher16($codepoints, count($codepoints), 1, 0, 0)"/>

  <!-- This doesn't need to be hex, I just like hashes in hex... -->
  <xsl:variable name="hex" select="fg:to-hex($checksum)"/>
  <xsl:variable name="hex" select="if (string-length($hex) lt 6)
                                   then substring('000000' || $hex, string-length($hex) + 1)
                                   else $hex"/>

  <!-- Put the first three letters on to avoid^H^H^H^H^Hreduce the
       risk of collisions. It turns out that "persistent-toc-js" and
       "qandadiv-default-toc" checksum the same by this algorithm.
  -->
  <xsl:variable name="prefix"
                select="if (starts-with($str, '{'))
                        then substring-after($str, '}')
                        else $str"/>
  <xsl:variable name="prefix"
                select="if (contains($prefix, '#'))
                        then substring-before($prefix, '#')
                        else $prefix"/>
  <xsl:sequence select="substring($prefix, 1, 3) || fg:to-hex($checksum)"/>
</xsl:function>

<xsl:function name="fg:fletcher16">
  <xsl:param name="str" as="xs:integer*"/>
  <xsl:param name="len" as="xs:integer" />
  <xsl:param name="index" as="xs:integer" />
  <xsl:param name="sum1" as="xs:integer" />
  <xsl:param name="sum2" as="xs:integer"/>
  <xsl:choose>
    <xsl:when test="$index gt $len">
      <xsl:sequence select="$sum2 * 256 + $sum1"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="newSum1" as="xs:integer"
                    select="($sum1 + $str[$index]) mod 255"/>
      <xsl:sequence select="fg:fletcher16($str, $len, $index + 1, $newSum1,
                                          ($sum2 + $newSum1) mod 255)" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<!-- ============================================================ -->
<!-- From: https://www.oxygenxml.com/archives/xsl-list/200902/msg00214.html
     because it was easier than working it out myself. Hi Mike! -->

<xsl:function name="fg:to-hex" as="xs:string">
  <xsl:param name="in" as="xs:integer"/>
  <xsl:sequence
      select="if ($in eq 0) then '0' 
              else concat(if ($in gt 16)
                          then fg:to-hex($in idiv 16)
                          else '',
                          substring('0123456789abcdef', ($in mod 16) + 1, 1))"/>
</xsl:function>

</xsl:stylesheet>
