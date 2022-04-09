<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://docbook.org/ns/docbook"
                xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:l="http://docbook.org/ns/docbook/l10n"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:output method="xml" encoding="utf-8"
            indent="yes"/>

<xsl:variable name="locale" select="/*"/>

<xsl:template match="/">
  <xsl:apply-templates select="locale"/>
</xsl:template>

<xsl:template match="locale">
  <article>
    <info>
      <title>
        <xsl:text>Localization file for </xsl:text>
        <xsl:sequence select="@english-language-name/string()"/>
      </title>
      <bibliomisc role="language">
        <xsl:value-of select="@language/string()"/>
      </bibliomisc>
      <bibliomisc role="language-name" xml:lang="en">
        <xsl:value-of select="@english-language-name/string()"/>
      </bibliomisc>
      <xsl:apply-templates select="doc:localeinfo/*" mode="copyinfo"/>
      <style xmlns="http://www.w3.org/1999/xhtml">
        .error { background-color: red; color: yellow; }
        table { border: 1px solid #a0a0a0; }
        thead { background-color: black; color: white; }
        thead th, thead td { border: 1px solid black; }
        tbody th, tbody td { border: 1px solid #a0a0a0; }
      </style>
    </info>

    <section xml:id="title">
      <title>Generated titles</title>
      <segmentedlist>
        <segtitle>key</segtitle>
        <segtitle>tokens</segtitle>
        <xsl:for-each select="('Abstract',
                               'Acknowledgements',
                               'Bibliography',
                               'Caution',
                               'Danger',
                               'Dedication',
                               'Glossary',
                               'Important',
                               'Index',
                               'LegalNotice',
                               'ListofEquations',
                               'ListofExamples',
                               'ListofFigures',
                               'ListofProcedures',
                               'ListofTables',
                               'ListofUnknown',
                               'MsgAud',
                               'MsgLevel',
                               'MsgOrig',
                               'Note',
                               'RevHistory',
                               'SetIndex',
                               'TableOfContents',
                               'Tip',
                               'Warning')">
          <xsl:variable name="key" select="."/>
          <seglistitem>
            <seg><xsl:sequence select="lower-case($key)"/></seg>
            <xsl:sequence select="f:genseg($key, 'No title for')"/>
          </seglistitem>
        </xsl:for-each>
      </segmentedlist>
    </section>

    <section xml:id="label">
      <title>Generated labels</title>
      <segmentedlist>
        <segtitle>key</segtitle>
        <segtitle>tokens</segtitle>
        <xsl:for-each select="('Abstract',
                               'Appendix',
                               'Chapter',
                               'Equation',
                               'Example',
                               'Figure',
                               'Glossary',
                               'GlossSee',
                               'GlossSeeAlso',
                               'Index',
                               'LegalNotice',
                               'Part',
                               'Procedure',
                               'Reference',
                               'RefName',
                               'Section',
                               'See',
                               'SeeAlso',
                               'Step',
                               'subfigure',
                               'subtable',
                               'subequation',
                               'subexample',
                               'Table')">
          <xsl:variable name="key" select="."/>
          <seglistitem>
            <seg><xsl:sequence select="lower-case($key)"/></seg>
            <xsl:sequence select="f:genseg($key, 'No label for')"/>
          </seglistitem>
        </xsl:for-each>
        <seglistitem>
          <seg>edited-by</seg>
          <xsl:sequence select="f:genseg('Editedby', 'No label for')"/>
        </seglistitem>
      </segmentedlist>
    </section>

    <section xml:id="xref">
      <title>Cross-reference labels</title>
      <segmentedlist>
        <segtitle>key</segtitle>
        <segtitle>tokens</segtitle>
        <xsl:for-each select="('Abstract',
                               'Appendix',
                               'Chapter',
                               'Equation',
                               'Example',
                               'Figure',
                               'Glossary',
                               'GlossSee',
                               'GlossSeeAlso',
                               'Index',
                               'LegalNotice',
                               'Part',
                               'Procedure',
                               'Reference',
                               'RefName',
                               'Section',
                               'see',
                               'seealso',
                               'sectioncalled',
                               'step',
                               'Table')">
          <xsl:variable name="key" select="."/>
          <seglistitem>
            <seg><xsl:sequence select="lower-case($key)"/></seg>
            <xsl:sequence select="f:genseg($key, 'No label for')"/>
          </seglistitem>
        </xsl:for-each>
        <seglistitem>
          <seg>edited-by</seg>
          <xsl:sequence select="f:genseg('Editedby', 'No label for')"/>
        </seglistitem>
      </segmentedlist>
    </section>

    <section xml:id="iso690">
      <title>ISO 690 separators</title>

      <xsl:variable name="iso690" select="context[@name='iso690']"/>
      <segmentedlist>
        <segtitle>key</segtitle>
        <segtitle>tokens</segtitle>
          <xsl:for-each select="$iso690/template">
            <seglistitem>
              <seg><xsl:sequence select="@name/string()"/></seg>
              <seg>
                <xsl:sequence select="node()"/>
              </seg>
            </seglistitem>
          </xsl:for-each>
      </segmentedlist>
    </section>

    <section xml:id="label-separator">
      <title>Label separators</title>
      <segmentedlist>
        <segtitle>key</segtitle>
        <segtitle>tokens</segtitle>
        <seglistitem>
          <seg>_default</seg>
          <seg> </seg>
        </seglistitem>
      </segmentedlist>
    </section>

    <section xml:id="number-separator">
      <title>Number separators</title>
      <segmentedlist>
        <segtitle>key</segtitle>
        <segtitle>tokens</segtitle>
        <seglistitem>
          <seg>_default</seg>
          <seg>. </seg>
        </seglistitem>
      </segmentedlist>
    </section>

    <section xml:id="intra-number-separator">
      <title>Intra-number separators</title>
      <segmentedlist>
        <segtitle>key</segtitle>
        <segtitle>tokens</segtitle>
        <seglistitem>
          <seg>_default</seg>
          <seg>.</seg>
        </seglistitem>
      </segmentedlist>
    </section>

    <section xml:id="number-format">
      <title>Number format</title>
      <segmentedlist>
        <segtitle>key</segtitle>
        <segtitle>tokens</segtitle>
        <seglistitem>
          <seg>_default</seg>
          <seg>1</seg>
        </seglistitem>
        <seglistitem>
          <seg>appendix</seg>
          <seg>A</seg>
        </seglistitem>
        <seglistitem>
          <seg>part</seg>
          <seg>I</seg>
        </seglistitem>
        <seglistitem>
          <seg>reference</seg>
          <seg>I</seg>
        </seglistitem>
      </segmentedlist>
    </section>

    <section xml:id="separator">
      <title>Separators</title>
      <segmentedlist>
        <segtitle>key</segtitle>
        <segtitle>tokens</segtitle>
        <seglistitem>
          <seg>author-sep</seg>
          <seg>
            <xsl:sequence select="f:gentext('listcomma')"/>
            <xsl:text> </xsl:text>
          </seg>
        </seglistitem>
        <seglistitem>
          <seg>author-sep2</seg>
          <seg>
            <xsl:text> </xsl:text>
            <xsl:sequence select="f:gentext('and')"/>
            <xsl:text> </xsl:text>
          </seg>
        </seglistitem>
        <seglistitem>
          <seg>author-seplast</seg>
          <seg>
            <xsl:sequence select="f:gentext('lastlistcomma')"/>
            <xsl:text> </xsl:text>
            <xsl:sequence select="f:gentext('and')"/>
            <xsl:text> </xsl:text>
          </seg>
        </seglistitem>
        <seglistitem>
          <seg>refname-sep</seg>
          <seg>
            <xsl:sequence select="f:gentext('listcomma')"/>
            <xsl:text> </xsl:text>
          </seg>
        </seglistitem>
        <seglistitem>
          <seg>refpurpose-sep</seg>
          <seg> — </seg>
        </seglistitem>
        <seglistitem>
          <seg>term-sep</seg>
          <seg>
            <xsl:sequence select="f:gentext('listcomma')"/>
            <xsl:text> </xsl:text>
          </seg>
        </seglistitem>
        <seglistitem>
          <seg>term-sep2</seg>
          <seg>
            <xsl:sequence select="f:gentext('listcomma')"/>
            <xsl:text> </xsl:text>
          </seg>
        </seglistitem>
        <seglistitem>
          <seg>term-seplast</seg>
          <seg>
            <xsl:sequence select="f:gentext('listcomma')"/>
            <xsl:text> </xsl:text>
          </seg>
        </seglistitem>
        <seglistitem>
          <seg>glossterm-sep</seg>
          <seg>
            <xsl:sequence select="f:gentext('listcomma')"/>
            <xsl:text> </xsl:text>
          </seg>
        </seglistitem>
        <seglistitem>
          <seg>xlink-arclist-before</seg>
          <seg> [</seg>
        </seglistitem>
        <seglistitem>
          <seg>xlink-arclist-after</seg>
          <seg>] </seg>
        </seglistitem>
        <seglistitem>
          <seg>xlink-arclist-titlesep</seg>
          <seg>: </seg>
        </seglistitem>
        <seglistitem>
          <seg>xlink-arclist-sep</seg>
          <seg>
            <xsl:sequence select="f:gentext('listcomma')"/>
            <xsl:text> </xsl:text>
          </seg>
        </seglistitem>
      </segmentedlist>
    </section>

    <section xml:id="style">
      <title>Styles</title>
      <segmentedlist>
        <segtitle>key</segtitle>
        <segtitle>tokens</segtitle>
        <seglistitem>
          <seg>personname</seg>
          <seg>
            <xsl:variable name="template"
                          select="context[@name='styles']/template[@name='person-name']"/>
            <xsl:choose>
              <xsl:when test="exists($template)">
                <xsl:sequence select="$template/node()"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:message select="'Missing style: personname'"/>
                <xsl:text>???PERSONNAME???</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </seg>
        </seglistitem>
      </segmentedlist>
    </section>

    <section xml:id="keycap">
      <title>Keycaps</title>
      <segmentedlist>
        <segtitle>key</segtitle>
        <segtitle>tokens</segtitle>
        <xsl:for-each select="context[@name='keycap']/template">
          <seglistitem>
            <seg><xsl:sequence select="@name/string()"/></seg>
            <seg><xsl:sequence select="node()"/></seg>
          </seglistitem>
        </xsl:for-each>
      </segmentedlist>
    </section>

    <section xml:id="letters">
      <title>Letters</title>
      <segmentedlist>
        <segtitle>group</segtitle>
        <segtitle>letters</segtitle>
        <xsl:for-each-group select="letters/l" group-by="@i">
          <seglistitem>
            <seg><xsl:sequence select="current-grouping-key()"/></seg>
            <seg>
              <simplelist type="inline">
                <xsl:for-each select="current-group()">
                  <member><xsl:sequence select="node()"/></member>
                </xsl:for-each>
              </simplelist>
            </seg>
          </seglistitem>
        </xsl:for-each-group>
      </segmentedlist>
    </section>
  </article>
</xsl:template>

<xsl:function name="f:gentext" as="item()*">
  <xsl:param name="key"/>

  <xsl:variable name="item" as="element()*">
    <xsl:evaluate context-item="$locale"
                  xpath="'gentext[@key=''' || $key || ''']'"/>
  </xsl:variable>

  <xsl:variable name="item" as="element()*">
    <xsl:choose>
      <xsl:when test="empty($item)">
        <xsl:evaluate context-item="$locale"
                      xpath="'gentext[@key=''' || lower-case($key) || ''']'"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$item"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$item/@text">
      <xsl:sequence select="$item/@text/string()"/>
    </xsl:when>
    <xsl:when test="$item">
      <xsl:sequence select="$item/node()"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="f:genseg" as="element()">
  <xsl:param name="key"/>
  <xsl:param name="message"/>

  <xsl:variable name="item" select="f:gentext($key)"/>

  <xsl:choose>
    <xsl:when test="exists($item)">
      <seg>
        <xsl:sequence select="$item"/>
      </seg>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message select="$message || ' ' || $key"/>
      <seg role="error">
        <xsl:sequence select="'???' || upper-case($key) || '???'"/>
      </seg>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:template match="element()">
  <xsl:copy>
    <xsl:apply-templates select="@*,node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="attribute()|text()|comment()|processing-instruction()">
  <xsl:copy/>
</xsl:template>

<xsl:template match="element()" mode="copyinfo">
  <xsl:element name="{local-name(.)}" namespace="http://docbook.org/ns/docbook">
    <xsl:apply-templates select="@*,node()" mode="copyinfo"/>
  </xsl:element>
</xsl:template>

<xsl:template match="author" mode="copyinfo">
  <xsl:element name="{local-name(.)}" namespace="http://docbook.org/ns/docbook">
    <xsl:apply-templates select="@*" mode="copyinfo"/>
    <personname xmlns="http://docbook.org/ns/docbook">
      <xsl:apply-templates select="* except affiliation" mode="copyinfo"/>
    </personname>
    <xsl:apply-templates select="affiliation" mode="copyinfo"/>
  </xsl:element>
</xsl:template>

<xsl:template match="attribute()|text()|comment()|processing-instruction()"
              mode="copyinfo">
  <xsl:copy/>
</xsl:template>

</xsl:stylesheet>
