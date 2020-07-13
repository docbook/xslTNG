<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:dbe="http://docbook.org/ns/docbook/errors"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:fcals="http://docbook.org/ns/docbook/functions/private/cals"
                xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:mp="http://docbook.org/ns/docbook/modes/private"
                xmlns:t="http://docbook.org/ns/docbook/templates"
                xmlns:tp="http://docbook.org/ns/docbook/templates/private"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                default-mode="m:docbook"
                exclude-result-prefixes="array db dbe f fcals fp m map mp t tp v xs"
                version="3.0">

<xsl:template match="db:table[db:tgroup]">
  <figure>
    <xsl:apply-templates select="." mode="m:attributes"/>
    <xsl:apply-templates select="." mode="m:generate-titlepage"/>
    <xsl:if test="'details' = $table-accessibility">
      <xsl:apply-templates select="db:textobject[not(db:phrase)]" mode="m:details"/>
    </xsl:if>
    <xsl:apply-templates select="db:tgroup"/>
    <xsl:if test=".//db:footnote">
      <xsl:call-template name="t:table-footnotes">
        <xsl:with-param name="footnotes" select=".//db:footnote"/>
      </xsl:call-template>
    </xsl:if>
  </figure>
</xsl:template>

<xsl:template match="db:informaltable[db:tgroup]">
  <figure>
    <xsl:apply-templates select="." mode="m:attributes"/>
    <xsl:if test="'details' = $table-accessibility">
      <xsl:apply-templates select="db:textobject[not(db:phrase)]" mode="m:details"/>
    </xsl:if>
    <xsl:apply-templates select="db:tgroup"/>
    <xsl:if test=".//db:footnote">
      <xsl:call-template name="t:table-footnotes">
        <xsl:with-param name="footnotes" select=".//db:footnote"/>
      </xsl:call-template>
    </xsl:if>
  </figure>
</xsl:template>

<xsl:template match="db:tgroup">
  <table>
    <xsl:if test="'summary' = $table-accessibility">
      <xsl:apply-templates select="../db:textobject[db:phrase]" mode="m:details"/>
    </xsl:if>
    <xsl:if test="db:colspec[@colwidth]">
      <xsl:call-template name="tp:cals-colspec"/>
    </xsl:if>
    <xsl:apply-templates select="db:thead"/>
    <xsl:apply-templates select="db:tfoot"/>
    <xsl:apply-templates select="db:tbody"/>
  </table>
</xsl:template>

<xsl:template match="db:tbody|db:thead|db:tfoot">
  <xsl:variable name="this" select="."/>

  <xsl:variable name="structure" as="array(*)">
    <xsl:apply-templates select="db:row[1]" mode="mp:structcals">
      <xsl:with-param name="structure" select="[]"/>
      <xsl:with-param name="rownum" select="1"/>
    </xsl:apply-templates>
  </xsl:variable>

  <xsl:variable name="table-height" select="array:size($structure)"/>

  <xsl:variable name="row-widths" as="xs:integer*">
    <xsl:for-each select="1 to array:size($structure)">
      <xsl:sequence select="array:size($structure(.))"/>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="table-width" select="max($row-widths)"/>

  <xsl:variable name="tgroup-cols" as="xs:integer"
                select="xs:integer(../@cols)"/>

  <xsl:if test="$table-width gt $tgroup-cols">
    <xsl:sequence select="error($dbe:INVALID-CALS, 'Columns exceed @cols')"/>
  </xsl:if>

  <xsl:variable name="table-width" select="max(($table-width, $tgroup-cols))"/>
  
  <xsl:variable name="structure" select="fp:pad-rows($structure, $table-width)"/>

  <!--
  <xsl:result-document href="struct.html">
    <xsl:sequence select="fp:dump-structure($structure)"/>
  </xsl:result-document>
  <xsl:message select="node-name(parent::*)"/>
  <xsl:sequence select="fp:dump-structure-text($structure)"/>
  -->

  <xsl:variable name="table"
                select="(ancestor::db:table|ancestor::db:informaltable)[last()]"/>

  <xsl:element name="{if (self::db:thead)
                      then 'thead'
                      else if (self::db:tfoot)
                           then 'tfoot'
                           else 'tbody'}"
               namespace="http://www.w3.org/1999/xhtml">
    <xsl:for-each select="1 to array:size($structure)">
      <xsl:variable name="rownum" select="."/>
      <xsl:variable name="row" select="$structure(.)"/>
      
      <!--
      <xsl:message select="'ROW: ' || $rownum"/>
      -->

      <tr>
        <xsl:for-each select="1 to array:size($row)">
          <xsl:variable name="colnum" select="."/>
          <xsl:variable name="cell" select="$row(.)"/>
          <xsl:if test="not($cell?span)">
            <xsl:choose>
              <xsl:when test="exists($cell?node)">
                <xsl:apply-templates select="$cell?node">
                  <xsl:with-param name="structure" select="$structure"/>
                  <xsl:with-param name="cell" select="$cell"/>
                  <xsl:with-param name="table" select="$table"/>
                  <xsl:with-param name="table-height" select="$table-height"/>
                  <xsl:with-param name="table-width" select="$table-width"/>
                </xsl:apply-templates>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="tp:cell">
                  <xsl:with-param name="table-part" select="$this"/>
                  <xsl:with-param name="structure" select="$structure"/>
                  <xsl:with-param name="cell" select="map {
                   'rownum': $rownum,
                   'colnum': $colnum,
                   'width': 1,
                   'height': 1,
                   'span': false()
                  }"/>
                  <xsl:with-param name="table" select="$table"/>
                  <xsl:with-param name="table-height" select="$table-height"/>
                  <xsl:with-param name="table-width" select="$table-width"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
        </xsl:for-each>
      </tr>
    </xsl:for-each>
  </xsl:element>
</xsl:template>

<xsl:template match="db:row">
  <tr>
    <xsl:apply-templates/>
  </tr>
</xsl:template>

<xsl:template match="db:entry|db:entrytbl">
  <xsl:param name="structure" as="array(*)"/>
  <xsl:param name="cell" as="map(*)?"/>
  <xsl:param name="table" as="element()"/>
  <xsl:param name="table-width" as="xs:integer"/>
  <xsl:param name="table-height" as="xs:integer"/>

  <xsl:variable name="pi-properties"
                select="f:pi-attributes(./processing-instruction('db'))"/>

  <xsl:call-template name="tp:cell">
    <xsl:with-param name="table-part"
                    select="(ancestor::db:thead
                             |ancestor::db:tbody
                             |ancestor::db:tfoot)[last()]"/>
    <xsl:with-param name="structure" select="$structure"/>
    <xsl:with-param name="cell" select="$cell"/>
    <xsl:with-param name="table" select="$table"/>
    <xsl:with-param name="table-height" select="$table-height"/>
    <xsl:with-param name="table-width" select="$table-width"/>
    <xsl:with-param name="pi-properties" select="$pi-properties"/>
    <xsl:with-param name="td"
                    select="if (parent::*/parent::db:thead)
                            then 'th'
                            else 'td'"/>
    <xsl:with-param name="content" as="item()*">
      <xsl:choose>
        <xsl:when test="self::db:entrytbl">
          <table>
            <xsl:if test="db:colspec[@colwidth]">
              <xsl:call-template name="tp:cals-colspec"/>
            </xsl:if>
            <xsl:apply-templates select="db:thead"/>
            <xsl:apply-templates select="db:tbody"/>
          </table>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="$cell?align = 'char' and not(*)">
              <!-- This is all a bit fiddly. If you want to use ?db? PIs to
                   set the alignment details, they must follow the colspec for
                   the column in question. If there's no PI following the colspec,
                   we fall back to PIs following the tgroup. -->
              <xsl:variable name="piroot"
                            select="fcals:colspec-for-column(ancestor::db:tgroup[1], $cell?colnum)"/>

              <xsl:variable name="pis"
                            select="if (empty($piroot)
                                        or empty($piroot/following-sibling::processing-instruction()))
                                    then ancestor::db:tgroup/node()
                                    else $piroot/following-sibling::node()"/>

              <xsl:variable name="pis" select="fp:only-initial-pis($pis)"/>

              <xsl:variable name="achar-width"
                            select="fp:pi-from-list($pis, 'align-char-width',
                                                    $align-char-width/string())"/>

              <xsl:variable name="achar-width" as="xs:integer?">
                <xsl:choose>
                  <xsl:when test="empty($achar-width)">
                    <xsl:sequence select="()"/>
                  </xsl:when>
                  <xsl:when test="$achar-width castable as xs:integer">
                    <xsl:sequence select="xs:integer($achar-width)"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:message select="'Ignoring align-char-width:', $achar-width"/>
                    <xsl:sequence select="$align-char-width"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>

              <xsl:variable name="achar-pad"
                            select="substring(fp:pi-from-list($pis, 'align-char-pad',
                                                              $align-char-pad), 1, 1)"/>

              <xsl:variable name="content" select="normalize-space(.)"/>
              <xsl:variable name="char"
                            select="if ($cell?char)
                                    then $cell?char
                                    else $align-char-default"/>
              <xsl:variable name="width"
                            select="if (exists($achar-width))
                                    then $achar-width
                                    else fp:align-char-width($structure, $cell?colnum, $char)"/>

              <xsl:variable name="parts"
                            select="f:tokenize-on-char($content, $char)"/>

              <xsl:variable name="before"
                            select="if (contains($content, $char))
                                    then string-join($parts[position() lt last()], $char)
                                    else $content"/>

              <!-- If the pad character is a form space of some sort, use it for
                   padding; otherwise use the alignment character. -->
              <xsl:variable name="before"
                            select="if (contains($content, $char))
                                    then $before || $char
                                    else if (matches($achar-pad, '\p{Zs}'))
                                         then $before || $achar-pad
                                         else $before || $char"/>

              <xsl:variable name="after"
                            select="if (contains($content, $char))
                                    then $parts[last()]
                                    else ''"/>

              <xsl:variable name="after"
                            select="fp:align-char-pad($after, $width, $achar-pad)"/>

              <xsl:message use-when="$v:debug = 'cals-align-char'"
                           select="$cell?rownum,$cell?colnum,$content,':',
                                   $width,':',$char,$before,$after"/>

              <xsl:value-of select="$before || $after"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:function name="fp:only-initial-pis" as="processing-instruction()*">
  <xsl:param name="nodes" as="node()*"/>

  <xsl:iterate select="$nodes">
    <xsl:param name="pis" select="()"/>
    <xsl:choose>
      <xsl:when test="self::processing-instruction()">
        <xsl:next-iteration>
          <xsl:with-param name="pis" select="($pis, .)"/>
        </xsl:next-iteration>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$pis"/>
        <xsl:break/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:iterate>
</xsl:function>

<xsl:function name="fp:align-char-width" as="xs:integer" cache="true">
  <xsl:param name="structure" as="array(*)"/>
  <xsl:param name="colnum" as="xs:integer"/>
  <xsl:param name="char" as="xs:string"/>

  <xsl:variable name="widths" as="xs:integer*">
    <xsl:for-each select="1 to array:size($structure)">
      <xsl:variable name="content" select="$structure(.)($colnum)?node"/>
      <xsl:choose>
        <xsl:when test="$content/*">
          <xsl:sequence select="0"/>
        </xsl:when> 
        <xsl:otherwise>
          <xsl:variable name="content" select="normalize-space($content)"/>
          <xsl:choose>
            <xsl:when test="not(contains($content, $char))">
              <xsl:sequence select="0"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="frag" select="f:tokenize-on-char($content, $char)[last()]"/>
              <xsl:sequence select="string-length($frag)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:variable>

  <xsl:sequence select="max($widths)"/>
</xsl:function>

<xsl:template name="tp:cell">
  <xsl:param name="table-part" as="element()"/>
  <xsl:param name="structure" as="array(*)"/>
  <xsl:param name="cell" as="map(*)" required="yes"/>
  <xsl:param name="table" as="element()"/>
  <xsl:param name="table-width" as="xs:integer"/>
  <xsl:param name="table-height" as="xs:integer"/>
  <xsl:param name="pi-properties" as="element()?"/>
  <xsl:param name="td" as="xs:string" select="'td'"/>
  <xsl:param name="content" as="item()*" select="()"/>

  <xsl:if test="not($cell?span)">
    <xsl:variable name="frame" select="$table/@frame"/>
    <xsl:variable name="btop"
                  select="$frame = 'all' or $frame = 'top' or $frame = 'topbot'"/>

    <!-- bbot:
         1. The frame includes the bottom border
         2. We're in the last row of a section and the cell has a rowsep
            and either this is a thead or it's a tbody and there is a tfoot
    -->
    <xsl:variable name="bbot"
                  select="$frame = 'all' or $frame = 'bot' or $frame = 'topbot'
                          or ($cell?rowsep
                              and $cell?rownum = $table-height
                              and ($table-part/self::db:thead
                                   or ($table-part/self::db:tbody
                                       and $table-part/preceding-sibling::db:tfoot)))"/>
    <xsl:variable name="bleft"
                  select="$frame = 'all' or $frame = 'sides'"/>
    <xsl:variable name="bright"
                  select="$frame = 'all' or $frame = 'sides'"/>

    <xsl:variable name="classes" as="xs:string*">
      <xsl:sequence select="if ($cell?colnum = 1 and $bleft)
                            then 'bleft'
                            else ()"/>
      <xsl:sequence select="if ($cell?rownum = 1 and $btop)
                            then 'btop'
                            else ()"/>
      <xsl:sequence select="f:cals-rowsep($structure, $cell, $bbot)"/>
      <xsl:sequence select="f:cals-colsep($structure, $cell, $bright)"/>
      <xsl:sequence select="if ($cell?node)
                            then ()
                            else 'empty'"/>
      <xsl:sequence select="$cell?align"/>
      <xsl:sequence select="$cell?valign"/>
    </xsl:variable>

    <!--
    <xsl:message select="($cell?rownum||','||$cell?colnum, $classes)"/>
    -->

    <xsl:element name="{$td}" namespace="http://www.w3.org/1999/xhtml">
      <xsl:if test="exists($classes)">
        <xsl:variable name="sorted" as="xs:string+">
          <xsl:for-each select="$classes">
            <xsl:sort select="."/>
            <xsl:sequence select="."/>
          </xsl:for-each>
        </xsl:variable>
        <xsl:attribute name="class" select="string-join($sorted, ' ')"/>
      </xsl:if>
      <xsl:if test="$cell?width gt 1">
        <xsl:attribute name="colspan" select="$cell?width"/>
      </xsl:if>
      <xsl:if test="$cell?height gt 1">
        <xsl:attribute name="rowspan" select="$cell?height"/>
      </xsl:if>
      <xsl:copy-of select="$pi-properties/@style"/>
      <xsl:sequence select="$content"/>
    </xsl:element>
  </xsl:if>
</xsl:template>

<!-- ============================================================ -->

<xsl:template name="tp:cals-colspec">
  <xsl:variable name="tgroup" select="."/>

  <xsl:variable name="widths" as="map(*)*">
    <xsl:for-each select="1 to xs:integer($tgroup/@cols)">
      <xsl:variable name="colspec" select="fcals:colspec-for-column($tgroup, .)"/>
      <xsl:choose>
        <xsl:when test="exists($colspec)">
          <xsl:choose>
            <xsl:when test="$colspec/@colwidth">
              <xsl:sequence select="f:parse-length(string($colspec/@colwidth))"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:sequence select="f:parse-length('1*')"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="f:parse-length('1*')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:variable>

  <!--
  <xsl:for-each select="$widths">
    <xsl:message select="'R:' || .?relative || ' M:' || .?magnitude || ' U:' || .?units"/>
  </xsl:for-each>
  -->

  <xsl:variable name="absolute-width" as="xs:double"
                select="sum($widths ! f:absolute-length(.))"/>

  <xsl:variable name="relative-width" as="xs:double"
                select="sum($widths ! f:relative-length(.))"/>

  <xsl:variable name="absolute-remainder"
                select="f:absolute-length($v:nominal-page-width) - $absolute-width"/>

  <xsl:if test="$absolute-remainder le 0">
    <xsl:message>Table width exceeds nominal width, ignoring relative width</xsl:message>
  </xsl:if>

  <xsl:variable name="absolute-remainder"
                select="if ($absolute-remainder lt 0)
                        then 0
                        else $absolute-remainder"/>

  <xsl:choose>
    <xsl:when test="$relative-width gt 0">
      <xsl:variable name="percent-widths" as="xs:integer*">
        <xsl:for-each select="$widths">
          <xsl:variable name="rel-part"
                        select="if (.?relative and .?relative gt 0)
                                then $absolute-remainder div $relative-width * .?relative
                                else 0"/>
          <xsl:sequence select="xs:integer(floor(($rel-part + f:absolute-length(.))
                                                 div f:absolute-length($v:nominal-page-width)
                                                 * 100.0))"/>
        </xsl:for-each>
      </xsl:variable>

      <!-- because I'm fussy about the details; make sure the sum = 100% -->
      <xsl:variable name="first-width" as="xs:integer">
        <xsl:sequence select="$percent-widths[1] + (100 - sum($percent-widths))"/>
      </xsl:variable>

      <colgroup>
        <xsl:for-each select="($first-width, subsequence($percent-widths, 2))">
          <col style="width: {.}%"/>
        </xsl:for-each>
      </colgroup>
    </xsl:when>
    <xsl:otherwise>
      <colgroup>
        <xsl:for-each select="$widths">
          <col style="width: {f:absolute-length(.)}"/>
        </xsl:for-each>
      </colgroup>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:function name="fcals:colspec-for-column" as="element()?" cache="yes">
  <xsl:param name="tgroup" as="element()"/>
  <xsl:param name="colnum" as="xs:integer"/>
  <xsl:sequence select="fp:colspec-for-colnum($tgroup/db:colspec, $colnum, 1)"/>
</xsl:function>

<xsl:function name="fp:colspec-for-colnum" as="element()?" cache="yes">
  <xsl:param name="colspecs" as="element()*"/>
  <xsl:param name="colnum" as="xs:integer"/>
  <xsl:param name="curcol" as="xs:integer"/>

  <!--
  <xsl:message select="('c4c: ', $colnum, ', ', $curcol, ', ', $colspecs[1])"/>
  -->

  <xsl:choose>
    <xsl:when test="empty($colspecs)">
      <xsl:sequence select="()"/>
    </xsl:when>
    <xsl:when test="normalize-space($colspecs[1]/@colnum) = string($colnum)">
      <xsl:sequence select="$colspecs[1]"/>
    </xsl:when>
    <xsl:when test="normalize-space($colspecs[1]/@colnum)">
      <xsl:sequence
          select="fp:colspec-for-colnum(subsequence($colspecs,2), $colnum,
                                        xs:integer($colspecs[1]/@colnum)+1)"/>
    </xsl:when>
    <xsl:when test="$colnum = $curcol">
      <xsl:sequence select="$colspecs[1]"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence
          select="fp:colspec-for-colnum(subsequence($colspecs,2), $colnum, $curcol + 1)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<!-- ============================================================ -->

<xsl:template match="db:row" mode="mp:structcals" as="array(*)">
  <xsl:param name="structure" as="array(*)" required="yes"/>
  <xsl:param name="rownum" as="xs:integer" required="yes"/>

  <xsl:variable name="structure"
                select="fp:extend-table($structure, $rownum)"/>

  <xsl:variable name="structure" as="array(*)">
    <xsl:apply-templates select="db:entry[1]" mode="mp:structcals">
      <xsl:with-param name="structure" select="$structure"/>
      <xsl:with-param name="rownum" select="$rownum"/>
    </xsl:apply-templates>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="following-sibling::*">
      <xsl:apply-templates select="following-sibling::*[1]"
                           mode="mp:structcals">
        <xsl:with-param name="structure" select="$structure"/>
        <xsl:with-param name="rownum" select="$rownum + 1"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="$structure"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:entry|db:entrytbl" mode="mp:structcals" as="array(*)">
  <xsl:param name="structure" as="array(*)" required="yes"/>
  <xsl:param name="rownum" as="xs:integer" required="yes"/>

  <xsl:variable name="colnum"
                select="fcals:column-number(., $structure, $rownum)"/>

  <xsl:variable name="structure"
                select="fp:place-cell(., $structure, $rownum, $colnum,
                                      fcals:cell-width(., $colnum),
                                      fcals:cell-height(., $colnum))"/>

<!--
  <xsl:variable name="structure" as="array(*)">
    <xsl:apply-templates select="db:entry[1]" mode="mp:structcals">
      <xsl:with-param name="structure" select="$structure"/>
      <xsl:with-param name="row" select="$row + 1"/>
    </xsl:apply-templates>
  </xsl:variable>
-->

  <xsl:choose>
    <xsl:when test="following-sibling::*">
      <xsl:apply-templates select="following-sibling::*[1]"
                           mode="mp:structcals">
        <xsl:with-param name="structure" select="$structure"/>
        <xsl:with-param name="rownum" select="$rownum"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="$structure"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:x-entrytbl" mode="mp:structcals" as="array(*)">
  <xsl:param name="structure" as="array(*)" required="yes"/>
  <xsl:param name="rownum" as="xs:integer" required="yes"/>

  <xsl:choose>
    <xsl:when test="following-sibling::*">
      <xsl:apply-templates select="following-sibling::*[1]"
                           mode="mp:structcals">
        <xsl:with-param name="structure" select="$structure"/>
        <xsl:with-param name="rownum" select="$rownum"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="$structure"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ============================================================ -->

<xsl:function name="fp:find-row-element" as="element()" cache="yes">
  <xsl:param name="row" as="array(*)"/>
  <xsl:choose>
    <xsl:when test="$row(1)?node">
      <xsl:sequence select="$row(1)?node/parent::*"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="fp:find-row-element(array:remove($row, 1))"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<!-- ============================================================ -->

<xsl:function name="f:cals-rowsep" as="xs:string?" cache="yes">
  <xsl:param name="structure" as="array(*)"/>
  <xsl:param name="cell" as="map(*)"/>
  <xsl:param name="last-row-rowsep" as="xs:boolean"/>

  <xsl:variable name="row" select="$cell?rownum + $cell?height - 1"/>

  <xsl:variable name="rowsep"
                select="if ($cell?node)
                        then $cell?rowsep
                        else fcals:empty-cell-rowsep($structure, $cell)"/>

  <!--
  <xsl:message>
    <xsl:value-of select="$cell?rownum"/>, <xsl:value-of select="$cell?colnum"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$row"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="array:size($structure)"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$last-row-rowsep"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$cell?height"/>
    <xsl:text>: </xsl:text>
    <xsl:value-of select="($rowsep and $row lt array:size($structure)
                or ($row eq array:size($structure) and $last-row-rowsep)"/>
  </xsl:message>
  -->

  <xsl:if test="($rowsep and $row lt array:size($structure))
                or ($row eq array:size($structure) and $last-row-rowsep)">
    <xsl:sequence select="'rowsep'"/>
  </xsl:if>
</xsl:function>

<xsl:function name="f:cals-colsep" as="xs:string?" cache="yes">
  <xsl:param name="structure" as="array(*)"/>
  <xsl:param name="cell" as="map(*)"/>
  <xsl:param name="last-col-colsep" as="xs:boolean"/>

  <xsl:variable name="col" select="$cell?colnum + $cell?width - 1"/>

  <xsl:variable name="colsep"
                select="if ($cell?node)
                        then $cell?colsep
                        else fcals:empty-cell-colsep($structure, $cell)"/>

  <!--
  <xsl:message>
    <xsl:value-of select="$cell?node"/>
    <xsl:text>: </xsl:text>
    <xsl:value-of select="$cell?colsep"/>
    <xsl:text>: </xsl:text>
    <xsl:value-of select="$col"/>
    <xsl:text>: </xsl:text>
    <xsl:value-of select="array:size($structure(1))"/>
    <xsl:text>: </xsl:text>
    <xsl:value-of select="$last-col-colsep"/>
    <xsl:text> = </xsl:text>
    <xsl:value-of select="$colsep
                          and ($col lt array:size($structure(1)))
                          or ($col eq array:size($structure(1)) and $last-col-colsep)"/>
  </xsl:message>
  -->

  <xsl:if test="($colsep and $col lt array:size($structure(1)))
                or ($col eq array:size($structure(1)) and $last-col-colsep)">
    <xsl:sequence select="'colsep'"/>
  </xsl:if>
</xsl:function>

<!-- ============================================================ -->

<xsl:function name="fp:extend-table">
  <xsl:param name="structure" as="array(*)" required="yes"/>
  <xsl:param name="rows" as="xs:integer" required="yes"/>

  <xsl:sequence select="if (array:size($structure) lt $rows)
                        then fp:extend-table(array:append($structure, []), $rows)
                        else $structure"/>
</xsl:function>

<xsl:function name="fp:extend-row" as="array(*)">
  <xsl:param name="row" as="array(*)"/>
  <xsl:param name="cols" as="xs:integer"/>

  <xsl:sequence select="if (array:size($row) lt $cols)
                        then fp:extend-row(array:append($row, ()), $cols)
                        else $row"/>
</xsl:function>

<xsl:function name="fp:pad-rows" as="array(*)">
  <xsl:param name="structure" as="array(*)"/>
  <xsl:param name="width" as="xs:integer"/>
  <xsl:sequence select="fp:pad-rows($structure, $width, [])"/>
</xsl:function>

<xsl:function name="fp:pad-rows" as="array(*)">
  <xsl:param name="structure" as="array(*)"/>
  <xsl:param name="width" as="xs:integer"/>
  <xsl:param name="newstructure" as="array(*)"/>

  <xsl:choose>
    <xsl:when test="array:size($structure) = 0">
      <xsl:sequence select="$newstructure"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="fp:pad-rows(array:remove($structure, 1), $width,
                                        array:append($newstructure,
                                          fp:extend-row($structure(1), $width)))"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fp:place-cell">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="structure" as="array(*)" required="yes"/>
  <xsl:param name="rownum" as="xs:integer" required="yes"/>
  <xsl:param name="colnum" as="xs:integer" required="yes"/>
  <xsl:param name="width" as="xs:integer" required="yes"/>
  <xsl:param name="height" as="xs:integer" required="yes"/>

  <xsl:variable name="cell" select="map {
    'node': $node,
    'rownum': $rownum,
    'colnum': $colnum,
    'width': $width,
    'height': $height,
    'colsep': fcals:colsep($node, $colnum),
    'rowsep': fcals:rowsep($node),
    'align': fcals:align($node, $colnum),
    'char': fcals:char($node, $colnum),
    'valign': fcals:valign($node)
  }"/>

  <xsl:variable name="row" select="$structure($rownum)"/>
  <xsl:variable name="row" select="fp:extend-row($row, $colnum)"/>
  <xsl:variable name="row" select="fp:replace-element($row, $colnum, $cell)"/>

  <xsl:variable name="structure"
                select="fp:replace-element($structure, $rownum, $row)"/>

  <xsl:variable name="structure"
                select="if ($width gt 1 or $height gt 1)
                        then fp:span($structure, $rownum, $colnum, $cell,
                                     $width, $height, true())
                        else $structure"/>

  <xsl:sequence select="$structure"/>
</xsl:function>

<xsl:function name="fp:span">
  <xsl:param name="structure" as="array(*)"/>
  <xsl:param name="rownum" as="xs:integer"/>
  <xsl:param name="colnum" as="xs:integer"/>
  <xsl:param name="cell" as="map(*)"/>
  <xsl:param name="width" as="xs:integer"/>
  <xsl:param name="height" as="xs:integer"/>
  <xsl:param name="first" as="xs:boolean"/>
  
  <!--
  <xsl:message>==================================================</xsl:message>
  <xsl:message>span(<xsl:value-of select="$rownum"
     />,<xsl:value-of select="$colnum"
     />,<xsl:value-of select="$width"
     />,<xsl:value-of select="$height"
     />)</xsl:message>
  <xsl:sequence select="fp:dump-structure-text($structure)"/>
  <xsl:message>= = = = = = = = = = = = = = = = = = = = = = = = = =</xsl:message>
  -->

  <xsl:variable name="cell" select="map:put($cell, 'span', not($first))"/>

  <xsl:variable name="structure" as="array(*)">
    <xsl:choose>
      <xsl:when test="$width gt 1 or not($first)">
        <xsl:variable name="structure"
                      select="fp:extend-table($structure, $rownum)"/>
        <xsl:variable name="row" select="$structure($rownum)"/>
        <xsl:variable name="row"
                      select="fp:morecols($row, $colnum, $cell, $width, $first)"/>
        <xsl:sequence select="fp:replace-element($structure, $rownum, $row)"/>
      </xsl:when>
      <xsl:when test="$height gt 1">
        <xsl:variable name="structure"
                      select="fp:extend-table($structure, $rownum)"/>
        <xsl:variable name="row" select="$structure($rownum)"/>
        <xsl:variable name="row" select="fp:extend-row($row, $colnum)"/>
        <xsl:variable name="row" select="fp:replace-element($row, $colnum, $cell)"/>
        <xsl:sequence select="fp:replace-element($structure, $rownum, $row)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$structure"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$height gt 1">
      <xsl:sequence select="fp:span($structure, $rownum + 1, $colnum,
                                    $cell, $width, $height - 1, false())"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="$structure"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fp:morecols">
  <xsl:param name="row" as="array(*)"/>
  <xsl:param name="colnum" as="xs:integer"/>
  <xsl:param name="cell" as="map(*)"/>
  <xsl:param name="width" as="xs:integer"/>
  <xsl:param name="first" as="xs:boolean"/>

  <xsl:variable name="cell" select="map:put($cell, 'span', not($first))"/>

  <xsl:choose>
    <xsl:when test="$width = 0">
      <xsl:sequence select="$row"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="row" select="fp:extend-row($row, $colnum)"/>
      <xsl:variable name="row" select="fp:replace-element($row, $colnum, $cell)"/>
      <xsl:sequence select="fp:morecols($row, $colnum + 1, $cell, $width - 1, false())"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:column-number">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="structure" as="array(*)" required="yes"/>
  <xsl:param name="rownum" as="xs:integer" required="yes"/>

  <xsl:variable name="row" select="$structure($rownum)"/>

  <xsl:choose>
    <xsl:when test="$node/@namest">
      <xsl:sequence
          select="fcals:colspec-column-number(
                     fcals:colspec($node, $node/@namest))"/>
    </xsl:when>
    <xsl:when test="$node/@colname">
      <xsl:sequence
          select="fcals:colspec-column-number(
                     fcals:colspec($node, $node/@colname))"/>
    </xsl:when>
    <xsl:otherwise>
      <!--
      <xsl:message select="'ROW: ' || $rownum"/>
      -->
      <xsl:sequence select="fcals:first-empty-cell($row)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:first-empty-cell">
  <xsl:param name="row" as="array(*)" required="yes"/>
  <!--
  <xsl:sequence select="fp:dump-row-text($row)"/>
  <xsl:message select="concat('found: ',fcals:first-empty-cell($row, 1, ()))"/>
  -->
  <xsl:sequence select="fcals:first-empty-cell($row, 1, ())"/>
</xsl:function>

<xsl:function name="fcals:first-empty-cell">
  <xsl:param name="row" as="array(*)" required="yes"/>
  <xsl:param name="pos" as="xs:integer" required="yes"/>
  <xsl:param name="found" as="xs:integer?" required="yes"/>

  <!-- find the first empty cell that's to the right of the last
       occupied cell (if there is an occupied cell).
  -->

  <xsl:choose>
    <xsl:when test="$pos gt array:size($row)">
      <xsl:sequence select="if ($found)
                            then $found
                            else $pos"/>
    </xsl:when>
    <xsl:when test="empty($row($pos))">
      <xsl:sequence select="fcals:first-empty-cell($row, $pos + 1,
                               if ($found) then $found else $pos)"/>
    </xsl:when>
    <xsl:when test="$row($pos)?span">
      <xsl:sequence select="fcals:first-empty-cell($row, $pos + 1, $found)"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="fcals:first-empty-cell($row, $pos + 1, ())"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:colspec-column-number" as="xs:integer" cache="yes">
  <xsl:param name="colspec" as="element(db:colspec)" required="yes"/>

  <xsl:choose>
    <xsl:when test="$colspec/@colnum">
      <xsl:sequence select="xs:integer($colspec/@colnum)"/>
    </xsl:when>
    <xsl:when test="$colspec/preceding-sibling::db:colspec">
      <xsl:sequence
          select="fcals:colspec-column-number(
                     $colspec/preceding-sibling::db:colspec[1]) + 1 "/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="1"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:colspec" as="element(db:colspec)" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="colname" as="xs:string" required="yes"/>

  <xsl:variable name="table"
                select="($node/ancestor::db:tgroup
                         |$node/ancestor::db:entrytbl)[last()]"/>

  <xsl:variable name="colspec" select="$table/db:colspec[@colname=$colname]"/>

  <xsl:if test="empty($colspec)">
    <xsl:sequence select="error($dbe:INVALID-CALS, 'No colspec named ' || $colname)"/>
  </xsl:if>

  <xsl:sequence select="$colspec"/>
</xsl:function>

<xsl:function name="fcals:spanspec" as="element(db:spanspec)" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="spanname" as="xs:string" required="yes"/>

  <xsl:variable name="table"
                select="($node/ancestor::db:tgroup
                         |$node/ancestor::db:entrytbl)[last()]"/>

  <xsl:variable name="spanspec" select="$table/db:spanspec[@spanname=$spanname]"/>

  <xsl:if test="empty($spanspec)">
    <xsl:sequence select="error($dbe:INVALID-CALS, 'No spanspec named ' || $spanname)"/>
  </xsl:if>

  <xsl:sequence select="$spanspec"/>
</xsl:function>

<xsl:function name="fcals:cell-width" as="xs:integer" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="colnum" as="xs:integer" required="yes"/>

  <xsl:choose>
    <xsl:when test="$node/@nameend">
      <xsl:variable name="last-colnum"
                    select="fcals:colspec-column-number(
                               fcals:colspec($node, $node/@nameend))"/>
      <xsl:sequence select="$last-colnum - $colnum + 1"/>
    </xsl:when>
    <xsl:when test="$node/@spanname">
      <xsl:variable name="spanspec" select="fcals:spanspec($node, $node/@spanname)"/>
      <xsl:variable name="last-colnum"
                    select="fcals:colspec-column-number(
                               fcals:colspec($node, $spanspec/@nameend))"/>
      <xsl:sequence select="$last-colnum - $colnum + 1"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="1"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:cell-height" as="xs:integer" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="colnum" as="xs:integer" required="yes"/>

  <xsl:choose>
    <xsl:when test="$node/@morerows">
      <xsl:sequence select="xs:integer($node/@morerows) + 1"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="1"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:colsep" as="xs:boolean" cache="yes">
  <xsl:param name="node" as="element()"/>
  <xsl:param name="colnum" as="xs:integer"/>

  <xsl:variable name="tgroup"
                select="($node/ancestor::db:tgroup
                         |$node/ancestor::db:entrytbl)[last()]"/>

  <xsl:choose>
    <xsl:when test="$node/@colsep">
      <xsl:sequence select="$node/@colsep = '1'"/>
    </xsl:when>
    <xsl:when test="$node/@nameend">
      <xsl:sequence select="fcals:colsep-colspec($node, $node/@nameend)"/>
    </xsl:when>
    <xsl:when test="$node/@colname">
      <xsl:sequence select="fcals:colsep-colspec($node, $node/@colname)"/>
    </xsl:when>
    <xsl:when test="$node/@spanname">
      <xsl:sequence select="fcals:colsep-spanspec($node, $node/@spanname)"/>
    </xsl:when>
    <xsl:when test="fcals:colspec-for-column($tgroup, $colnum)/@colsep">
      <xsl:sequence select="fcals:colspec-for-column($tgroup, $colnum)/@colsep = '1'"/>
    </xsl:when>
    <xsl:when test="$tgroup/@colsep">
      <xsl:sequence select="$tgroup/@colsep = '1'"/>
    </xsl:when>
    <!-- exclude entry parent of entrytbl -->
    <xsl:when test="$tgroup/parent::*[not(self::db:entry)]/@colsep">
      <xsl:sequence select="$tgroup/parent::*[not(self::db:entry)]/@colsep = '1'"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="false()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:colsep-colspec" as="xs:boolean" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="name" as="xs:string" required="yes"/>

  <xsl:variable name="colspec" select="fcals:colspec($node, $name)"/>

  <xsl:variable name="tgroup"
                select="($node/ancestor::db:tgroup
                         |$node/ancestor::db:entrytbl)[last()]"/>

  <xsl:choose>
    <xsl:when test="$colspec/@colsep">
      <xsl:sequence select="$colspec/@colsep = '1'"/>
    </xsl:when>
    <xsl:when test="$tgroup/@colsep">
      <xsl:sequence select="$tgroup/@colsep = '1'"/>
    </xsl:when>
    <!-- exclude entry parent of entrytbl -->
    <xsl:when test="$tgroup/parent::*[not(self::db:entry)]/@colsep">
      <xsl:sequence select="$tgroup/parent::*[not(self::db:entry)]/@colsep = '1'"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="false()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:colsep-spanspec" as="xs:boolean" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="name" as="xs:string" required="yes"/>

  <xsl:variable name="spanspec" select="fcals:spanspec($node, $name)"/>

  <xsl:choose>
    <xsl:when test="$spanspec/@colsep">
      <xsl:sequence select="$spanspec/@colsep = '1'"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="fcals:colsep-colspec($node, $spanspec/@nameend)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:empty-cell-colsep" as="xs:boolean" cache="yes">
  <xsl:param name="structure" as="array(*)"/>
  <xsl:param name="cell" as="map(*)"/>
  <xsl:variable name="row" select="$structure($cell?rownum)"/>
  <xsl:variable name="node" select="fp:find-row-element($row)"/>

  <xsl:variable name="tgroup"
                select="($node/ancestor::db:tgroup
                         |$node/ancestor::db:entrytbl)[last()]"/>

  <xsl:choose>
    <xsl:when test="fcals:colspec-for-column($tgroup, $cell?colnum)/@colsep">
      <xsl:sequence select="fcals:colspec-for-column($tgroup, $cell?colnum)/@colsep = '1'"/>
    </xsl:when>
    <xsl:when test="$tgroup/@colsep">
      <xsl:sequence select="$node/ancestor::db:tgroup[1]/@colsep = '1'"/>
    </xsl:when>
    <xsl:when test="$tgroup/parent::*[not(self::db:entry)]/@colsep">
      <xsl:sequence select="$tgroup/parent::*[not(self::db:entry)]/@colsep = '1'"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="false()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:rowsep" as="xs:boolean" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>

  <xsl:variable name="tgroup"
                select="($node/ancestor::db:tgroup
                         |$node/ancestor::db:entrytbl)[last()]"/>

  <xsl:choose>
    <xsl:when test="$node/@rowsep">
      <xsl:sequence select="$node/@rowsep = '1'"/>
    </xsl:when>
    <xsl:when test="$node/@nameend">
      <xsl:sequence select="fcals:rowsep-colspec($node, $node/@nameend)"/>
    </xsl:when>
    <xsl:when test="$node/@colname">
      <xsl:sequence select="fcals:rowsep-colspec($node, $node/@colname)"/>
    </xsl:when>
    <xsl:when test="$node/@spanname">
      <xsl:sequence select="fcals:rowsep-spanspec($node, $node/@spanname)"/>
    </xsl:when>
    <xsl:when test="$node/parent::db:row/@rowsep">
      <xsl:sequence select="$node/parent::db:row/@rowsep = '1'"/>
    </xsl:when>
    <xsl:when test="$tgroup/@rowsep">
      <xsl:sequence select="$tgroup/@rowsep = '1'"/>
    </xsl:when>
    <xsl:when test="$tgroup/parent::*[not(self::db:entry)]/@rowsep">
      <xsl:sequence select="$tgroup/parent::*[not(self::db:entry)]/@rowsep = '1'"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="false()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:rowsep-colspec" as="xs:boolean" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="name" as="xs:string" required="yes"/>

  <xsl:variable name="colspec" select="fcals:colspec($node, $name)"/>

  <xsl:variable name="tgroup"
                select="($node/ancestor::db:tgroup
                         |$node/ancestor::db:entrytbl)[last()]"/>

  <xsl:choose>
    <xsl:when test="$colspec/@rowsep">
      <xsl:sequence select="$colspec/@rowsep = '1'"/>
    </xsl:when>
    <xsl:when test="$node/parent::db:row/@rowsep">
      <xsl:sequence select="$node/parent::db:row/@rowsep = '1'"/>
    </xsl:when>
    <xsl:when test="$tgroup/@rowsep">
      <xsl:sequence select="$tgroup/@rowsep = '1'"/>
    </xsl:when>
    <xsl:when test="$tgroup/parent::*[not(self::db:entry)]/@rowsep">
      <xsl:sequence select="$tgroup/parent::*[not(self::db:entry)]/@rowsep = '1'"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="false()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:rowsep-spanspec" as="xs:boolean" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="name" as="xs:string" required="yes"/>

  <xsl:variable name="spanspec" select="fcals:spanspec($node, $name)"/>

  <xsl:choose>
    <xsl:when test="$spanspec/@rowsep">
      <xsl:sequence select="$spanspec/@rowsep = '1'"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="fcals:rowsep-colspec($node, $spanspec/@nameend)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:empty-cell-rowsep" as="xs:boolean" cache="yes">
  <xsl:param name="structure" as="array(*)"/>
  <xsl:param name="cell" as="map(*)"/>
  <xsl:variable name="row" select="$structure($cell?rownum)"/>
  <xsl:variable name="node" select="fp:find-row-element($row)"/>

  <xsl:variable name="tgroup"
                select="($node/ancestor::db:tgroup
                         |$node/ancestor::db:entrytbl)[last()]"/>

  <xsl:choose>
    <xsl:when test="$node/@rowsep">
      <xsl:sequence select="$node/@rowsep = '1'"/>
    </xsl:when>
    <xsl:when test="$tgroup/@rowsep">
      <xsl:sequence select="$tgroup/@rowsep = '1'"/>
    </xsl:when>
    <xsl:when test="$tgroup/parent::*[not(self::db:entry)]/@rowsep">
      <xsl:sequence select="$tgroup/parent::*[not(self::db:entry)]/@rowsep = '1'"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="false()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:align" as="xs:string?" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="colnum" as="xs:integer"/>

  <xsl:variable name="tgroup"
                select="($node/ancestor::db:tgroup
                         |$node/ancestor::db:entrytbl)[last()]"/>

  <xsl:choose>
    <xsl:when test="$node/@align">
      <xsl:sequence select="$node/@align"/>
    </xsl:when>
    <xsl:when test="$node/@nameend">
      <xsl:sequence select="fcals:align-colspec($node, $node/@nameend)"/>
    </xsl:when>
    <xsl:when test="$node/@colname">
      <xsl:sequence select="fcals:align-colspec($node, $node/@colname)"/>
    </xsl:when>
    <xsl:when test="$node/@spanname">
      <xsl:sequence select="fcals:align-spanspec($node, $node/@spanname)"/>
    </xsl:when>
    <xsl:when test="fcals:colspec-for-column($tgroup, $colnum)/@align">
      <xsl:sequence select="fcals:colspec-for-column($tgroup, $colnum)/@align"/>
    </xsl:when>
    <xsl:when test="$tgroup/@align">
      <xsl:sequence select="$tgroup/@align"/>
    </xsl:when>
    <xsl:when test="$tgroup/parent::*[not(self::db:entry)]/@align">
      <xsl:sequence select="$tgroup/parent::*[not(self::db:entry)]/@align"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:align-colspec" as="xs:string?" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="name" as="xs:string" required="yes"/>

  <xsl:variable name="colspec" select="fcals:colspec($node, $name)"/>

  <xsl:variable name="tgroup"
                select="($node/ancestor::db:tgroup
                         |$node/ancestor::db:entrytbl)[last()]"/>

  <xsl:choose>
    <xsl:when test="$colspec/@align">
      <xsl:sequence select="$colspec/@align"/>
    </xsl:when>
    <xsl:when test="$tgroup/@align">
      <xsl:sequence select="$tgroup/@align"/>
    </xsl:when>
    <xsl:when test="$tgroup/parent::*[not(self::db:entry)]/@align">
      <xsl:sequence select="$tgroup/parent::*[not(self::db:entry)]/@align"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:align-spanspec" as="xs:string?" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="name" as="xs:string" required="yes"/>

  <xsl:variable name="spanspec" select="fcals:spanspec($node, $name)"/>

  <xsl:choose>
    <xsl:when test="$spanspec/@align">
      <xsl:sequence select="$spanspec/@align"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="fcals:align-colspec($node, $spanspec/@nameend)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:char" as="xs:string?" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="colnum" as="xs:integer"/>

  <xsl:variable name="tgroup"
                select="($node/ancestor::db:tgroup
                         |$node/ancestor::db:entrytbl)[last()]"/>

  <xsl:choose>
    <xsl:when test="$node/@char">
      <xsl:sequence select="$node/@char"/>
    </xsl:when>
    <xsl:when test="$node/@nameend">
      <xsl:sequence select="fcals:char-colspec($node, $node/@nameend)"/>
    </xsl:when>
    <xsl:when test="$node/@colname">
      <xsl:sequence select="fcals:char-colspec($node, $node/@colname)"/>
    </xsl:when>
    <xsl:when test="$node/@spanname">
      <xsl:sequence select="fcals:char-spanspec($node, $node/@spanname)"/>
    </xsl:when>
    <xsl:when test="fcals:colspec-for-column($tgroup, $colnum)/@char">
      <xsl:sequence select="fcals:colspec-for-column($tgroup, $colnum)/@char"/>
    </xsl:when>
    <xsl:when test="$tgroup/@char">
      <xsl:sequence select="$tgroup/@char"/>
    </xsl:when>
    <xsl:when test="$tgroup/parent::*[not(self::db:entry)]/@char">
      <xsl:sequence select="$tgroup/parent::*[not(self::db:entry)]/@char"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:char-colspec" as="xs:string?" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="name" as="xs:string" required="yes"/>

  <xsl:variable name="colspec" select="fcals:colspec($node, $name)"/>

  <xsl:variable name="tgroup"
                select="($node/ancestor::db:tgroup
                         |$node/ancestor::db:entrytbl)[last()]"/>

  <xsl:choose>
    <xsl:when test="$colspec/@char">
      <xsl:sequence select="$colspec/@char"/>
    </xsl:when>
    <xsl:when test="$tgroup/@char">
      <xsl:sequence select="$tgroup/@char"/>
    </xsl:when>
    <xsl:when test="$tgroup/parent::*[not(self::db:entry)]/@char">
      <xsl:sequence select="$tgroup/parent::*[not(self::db:entry)]/@char"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:char-spanspec" as="xs:string?" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>
  <xsl:param name="name" as="xs:string" required="yes"/>

  <xsl:variable name="spanspec" select="fcals:spanspec($node, $name)"/>

  <xsl:choose>
    <xsl:when test="$spanspec/@char">
      <xsl:sequence select="$spanspec/@char"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="fcals:char-colspec($node, $spanspec/@nameend)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fcals:valign" as="xs:string?" cache="yes">
  <xsl:param name="node" as="element()" required="yes"/>

  <xsl:choose>
    <xsl:when test="$node/@valign">
      <xsl:sequence select="$node/@valign"/>
    </xsl:when>
    <xsl:when test="$node/parent::db:row/@valign">
      <xsl:sequence select="$node/parent::db:row/@valign"/>
    </xsl:when>
    <xsl:when test="$node/parent::db:row/parent::*/@valign">
      <xsl:sequence select="$node/parent::db:row/parent::*/@valign"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="()"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fp:align-char-pad" as="xs:string">
  <!-- FIXME: optimize this -->
  <xsl:param name="text" as="xs:string"/>
  <xsl:param name="width" as="xs:integer"/>
  <xsl:param name="pad" as="xs:string"/>
  <xsl:sequence select="if (string-length($text) lt $width)
                        then fp:align-char-pad($text||$pad, $width, $pad)
                        else $text"/>
</xsl:function>

<!-- ============================================================ -->

<xsl:function name="fp:dump-structure">
  <xsl:param name="structure" as="array(*)" required="yes"/>
  
  <xsl:choose>
    <xsl:when test="array:size($structure) gt 0">
      <div>
        <xsl:value-of select="'Size: ' || array:size($structure) || 'x' || array:size($structure(1))"/>
        <table border="1" width="100%">
          <xsl:sequence select="fp:dump-structure-rows($structure)"/>
        </table>
      </div>
    </xsl:when>
    <xsl:otherwise>
      <div>Empty table</div>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fp:dump-structure-rows">
  <xsl:param name="structure" as="array(*)" required="yes"/>

  <xsl:choose>
    <xsl:when test="array:size($structure) = 0">
      <xsl:sequence select="()"/>
    </xsl:when>
    <xsl:otherwise>
      <tr>
        <xsl:sequence select="fp:dump-structure-columns($structure(1))"/>
      </tr>
      <xsl:sequence select="fp:dump-structure-rows(array:remove($structure, 1))"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fp:dump-structure-columns">
  <xsl:param name="row" as="array(*)" required="yes"/>

  <xsl:choose>
    <xsl:when test="array:size($row) = 0">
      <xsl:sequence select="()"/>
    </xsl:when>
    <xsl:otherwise>
      <td>
        <xsl:variable name="map" select="$row(1)"/>
        <xsl:choose>
          <xsl:when test="exists($map)">

            <xsl:variable name="style" as="xs:string*">
              <xsl:sequence select="if ($map?colsep)
                                    then 'border-right: 1px solid black;'
                                    else ()"/>
              <xsl:sequence select="if ($map?rowsep)
                                    then 'border-bottom: 1px solid black;'
                                    else ()"/>
            </xsl:variable>

            <xsl:if test="exists($style)">
              <xsl:attribute name="style" select="string-join($style)"/>
            </xsl:if>

            <xsl:value-of select="$map?rownum || ',' || $map?colnum"/>
            <xsl:text> | </xsl:text>
            <xsl:value-of select="$map?width || 'x' || $map?height"/>
            <xsl:text> | </xsl:text>
            <xsl:value-of select="generate-id($map?node)"/>
            <br/>
            <xsl:choose>
              <xsl:when test="$map?span">
                <xsl:text>(span)</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$map?node"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>EMPTY</xsl:otherwise>
        </xsl:choose>
      </td>
      <xsl:sequence select="fp:dump-structure-columns(array:remove($row, 1))"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fp:dump-structure-text">
  <xsl:param name="structure" as="array(*)" required="yes"/>

  <xsl:for-each select="1 to array:size($structure)">
    <xsl:variable name="row" select="$structure(.)"/>
    <xsl:sequence select="fp:dump-row-text($row, .)"/>
  </xsl:for-each>
</xsl:function>

<xsl:function name="fp:dump-row-text">
  <xsl:param name="row" as="array(*)" required="yes"/>
  <xsl:sequence select="fp:dump-row-text($row, ())"/>
</xsl:function>

<xsl:function name="fp:dump-row-text">
  <xsl:param name="row" as="array(*)" required="yes"/>
  <xsl:param name="rownum" as="xs:integer?"/>

  <xsl:variable name="dump-row" as="xs:string*">
    <xsl:for-each select="1 to array:size($row)">
      <xsl:choose>
        <xsl:when test="empty($row(.))">·</xsl:when>
        <xsl:when test="$row(.)?span">O</xsl:when>
        <xsl:otherwise>X</xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:variable>

  <xsl:message>
    <xsl:value-of select="$rownum"/>
    <xsl:text>: </xsl:text>
    <xsl:value-of select="string-join($dump-row,'|')"/>
  </xsl:message>
</xsl:function>

</xsl:stylesheet>
