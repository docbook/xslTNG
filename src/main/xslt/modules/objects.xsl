<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:array="http://www.w3.org/2005/xpath-functions/array"
  xmlns:db="http://docbook.org/ns/docbook" xmlns:ext="http://docbook.org/extensions/xslt"
  xmlns:f="http://docbook.org/ns/docbook/functions"
  xmlns:fp="http://docbook.org/ns/docbook/functions/private" xmlns:h="http://www.w3.org/1999/xhtml"
  xmlns:m="http://docbook.org/ns/docbook/modes"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:mp="http://docbook.org/ns/docbook/modes/private" xmlns:svg="http://www.w3.org/2000/svg"
  xmlns:t="http://docbook.org/ns/docbook/templates"
  xmlns:tp="http://docbook.org/ns/docbook/templates/private"
  xmlns:v="http://docbook.org/ns/docbook/variables"
  xmlns:vp="http://docbook.org/ns/docbook/variables/private"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://www.w3.org/1999/xhtml" default-mode="m:docbook" exclude-result-prefixes="#all"
  version="3.0">

  <xsl:template match="db:mediaobject | db:inlinemediaobject">
    <xsl:variable name="pi-properties" select="f:pi-attributes(./processing-instruction('db'))"/>

    <xsl:variable name="gi" select="
        if (self::db:mediaobject)
        then
          'div'
        else
          'span'"/>

    <xsl:element name="{$gi}" namespace="http://www.w3.org/1999/xhtml">
      <xsl:copy-of select="$pi-properties/@style"/>
      <xsl:apply-templates select="." mode="m:attributes"/>

      <xsl:apply-templates select="." mode="m:mediaobject-start"/>

      <xsl:message use-when="'objects' = $v:debug"
        select="'Processing mediaobject with fileref=' || (//*[@fileref]/@fileref)[1]"/>

      <!-- Select the first object that contains something we (think) we can render -->
      <xsl:variable name="object-info" as="map(*)?">
        <xsl:iterate select="
            db:audioobject | db:imageobject | db:videoobject
            | db:textobject
            | db:imageobjectco/db:imageobject">
          <xsl:param name="force" as="map(*)?" select="()"/>
          <xsl:on-completion>
            <xsl:choose>
              <xsl:when test="empty($force)">
                <xsl:message select="'No media object found.'"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="ref" select="
                    if (array:size($force?datas) gt 0)
                    then
                      array:get($force?datas, 1)?fileref
                    else
                      ()"/>
                <xsl:choose>
                  <xsl:when test="exists($ref)">
                    <xsl:message select="'No acceptable media object, using', $ref"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:message select="'No acceptable media object found'"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:sequence select="$force"/>
          </xsl:on-completion>

          <xsl:variable name="info" as="map(*)?">
            <xsl:apply-templates select="." mode="m:mediaobject-info"/>
          </xsl:variable>

          <xsl:variable name="alternatives"
            select="count(db:audiodata | db:imagedata | db:videodata)"/>
          <xsl:variable name="selected-alternatives" select="
              if (exists($info) and map:contains($info, 'datas'))
              then
                array:size($info?datas)
              else
                0"/>

          <xsl:choose>
            <xsl:when test="./self::db:textobject and not(db:phrase)">
              <xsl:message use-when="'objects' = $v:debug"
                select="'Selected ' || local-name(.) || ' at position ' || position()"/>
              <xsl:break select="$info"/>
            </xsl:when>
            <xsl:when test="
                empty($info) or $selected-alternatives = 0
                or $selected-alternatives lt $alternatives">
              <xsl:message use-when="'objects' = $v:debug"
                select="'Skipping ' || local-name(.) || ' at position ' || position()"/>
              <xsl:next-iteration>
                <xsl:with-param name="force" select="
                    if (empty($force)) then
                      $info
                    else
                      $force"/>
              </xsl:next-iteration>
            </xsl:when>
            <xsl:otherwise>
              <xsl:message use-when="'objects' = $v:debug"
                select="'Selected ' || local-name(.) || ' at position ' || position()"/>
              <xsl:break select="$info"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:iterate>
      </xsl:variable>

      <!-- Compute the viewport parameters from the properties of the
         last alternative -->
      <xsl:variable name="last-data" select="array:flatten($object-info?datas)[last()]"/>
      <xsl:variable name="viewport" select="$last-data ! f:mediaobject-viewport(.)"/>

      <xsl:variable name="display-width" select="
          if (exists($last-data?contentwidth))
          then
            $last-data?contentwidth
          else
            $viewport?intrinsicwidth"/>
      <xsl:variable name="display-height" select="
          if (exists($last-data?contentheight))
          then
            $last-data?contentheight
          else
            $viewport?intrinsicheight"/>

      <xsl:variable name="viewport-markup" as="element(h:span)">
        <xsl:call-template name="tp:viewport">
          <xsl:with-param name="class" select="'viewport-table'"/>
          <xsl:with-param name="width" select="$viewport?width"/>
          <xsl:with-param name="height" select="$viewport?height"/>
          <xsl:with-param name="pi-properties"
            select="f:pi-attributes($object-info?node/processing-instruction('db'))"/>
          <xsl:with-param name="content" as="element()+">
            <span class="viewport-row">
              <xsl:call-template name="tp:viewport">
                <xsl:with-param name="class" select="'viewport-cell'"/>
                <xsl:with-param name="align" select="$viewport?align"/>
                <xsl:with-param name="valign" select="$viewport?valign"/>
                <xsl:with-param name="pi-properties"
                  select="f:pi-attributes($last-data?node/processing-instruction('db'))"/>
                <xsl:with-param name="content" as="element()+">
                  <!-- This anonymous span is styled with CSS to avoid an
                     awkward bottom padding issue in Firefox. -->
                  <span>
                    <span class="viewport">
                      <xsl:apply-templates select="$object-info?node">
                        <xsl:with-param name="viewport" select="$viewport"/>
                        <xsl:with-param name="datas" select="array:flatten($object-info?datas)"/>
                      </xsl:apply-templates>
                      <xsl:if test="
                          $object-info?node/ancestor::db:imageobjectco
                          and exists($display-width) and exists($display-height)">
                        <xsl:apply-templates select="$object-info?node/ancestor::db:imageobjectco"
                          mode="m:imagemap">
                          <xsl:with-param name="intrinsicwidth" select="$display-width"/>
                          <xsl:with-param name="intrinsicheight" select="$display-height"/>
                        </xsl:apply-templates>
                      </xsl:if>
                    </span>
                  </span>
                </xsl:with-param>
              </xsl:call-template>
            </span>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="table" select="$viewport-markup"/>
      <xsl:variable name="row" select="$table/*"/>
      <xsl:variable name="cell" select="$row/*"/>
      <xsl:variable name="viewport" select="$cell/*/*"/>
      <!-- Skip the anonymous wrapper! -->

      <xsl:message use-when="'image-markup' = $v:debug"
        select="serialize($viewport-markup, $v:as-xml)"/>

      <xsl:variable name="mediatype" as="xs:string">
        <xsl:choose>
          <xsl:when test="db:videoobject">video</xsl:when>
          <xsl:when test="db:imageobject | db:imageobjectco">image</xsl:when>
          <xsl:when test="db:audioobject">audio</xsl:when>
          <xsl:otherwise>text</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:element name="{if (self::db:inlinemediaobject) then 'span' else 'div'}"
        namespace="http://www.w3.org/1999/xhtml">
        <xsl:attribute name="class" select="'media ' || $mediatype"/>
        <xsl:choose>
          <xsl:when test="
              empty($table/@* except $table/@class)
              and empty($row/@* except $row/@class)
              and empty($cell/@* except $cell/@class)
              and empty($viewport/@* except $viewport/@class)">
            <xsl:sequence select="$viewport/node()"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="$viewport-markup"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:element>

      <xsl:apply-templates select="." mode="m:mediaobject-end"/>

      <xsl:if test="
          $object-info?node/ancestor::db:imageobjectco
          and $object-info?node/ancestor::db:imageobjectco/db:calloutlist">
        <xsl:if test="self::db:inlinemediaobject">
          <xsl:message>Callout list in inlinemediaobject produces invalid HTML</xsl:message>
        </xsl:if>
        <xsl:apply-templates select="$object-info?node/ancestor::db:imageobjectco/db:calloutlist"/>
      </xsl:if>
    </xsl:element>
  </xsl:template>

  <xsl:template match="db:imageobject">
    <xsl:param name="viewport" as="map(*)?"/>
    <xsl:param name="datas" as="map(*)*"/>

    <xsl:variable name="svg-ct" select="map:get($v:media-type-map, '.svg')"/>

    <xsl:choose>
      <xsl:when test="$datas[1]?node//svg:*">
        <xsl:if test="count($datas) gt 1">
          <xsl:message>Fallback is not possible with inline SVG.</xsl:message>
        </xsl:if>
        <xsl:apply-templates select="$datas[1]?node/svg:*"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="exists($datas ! .?node//svg:*)">
          <xsl:message>Inline SVG cannot be used as a fallback.</xsl:message>
        </xsl:if>

        <xsl:variable name="non-svg" as="map(*)*">
          <xsl:for-each select="$datas">
            <xsl:if test="empty(.?node//svg:*)">
              <xsl:sequence select="."/>
            </xsl:if>
          </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="last" select="$non-svg[last()]"/>
        <xsl:variable name="params" select="array:flatten($last?params)"/>

        <picture>
          <xsl:apply-templates select="." mode="m:attributes"/>
          <xsl:apply-templates select="$params"/>
          <xsl:for-each select="$non-svg">
            <xsl:choose>
              <xsl:when test="position() = last()">
                <xsl:apply-templates select=".?node" mode="mp:imagedata">
                  <xsl:with-param name="viewport" select="$viewport"/>
                  <xsl:with-param name="info" select="."/>
                  <xsl:with-param name="last" select="true()"/>
                </xsl:apply-templates>
              </xsl:when>
              <xsl:otherwise>
                <source>
                  <xsl:if test=".?content-type">
                    <xsl:attribute name="type" select=".?content-type"/>
                  </xsl:if>
                  <xsl:attribute name="srcset" select=".?href"/>
                </source>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </picture>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="db:videoobject">
    <xsl:param name="viewport" as="map(*)?"/>
    <xsl:param name="datas" as="map(*)*"/>

    <xsl:variable name="last" select="$datas[last()]"/>
    <xsl:variable name="params" select="array:flatten($last?params)"/>

    <xsl:choose>
      <xsl:when test="f:pi(., 'video', $mediaobject-video-element) = 'iframe'">
        <xsl:if test="count($datas) gt 1">
          <xsl:message select="'Fallback is not supported with iframes'"/>
        </xsl:if>
        <iframe src="{$datas[1]?href}">
          <xsl:apply-templates select="." mode="m:attributes"/>
          <xsl:if test="exists($last?width)">
            <xsl:attribute name="width" select="f:absolute-length($last?width)"/>
          </xsl:if>
          <xsl:if test="exists($last?height)">
            <xsl:attribute name="height" select="f:absolute-length($last?height)"/>
          </xsl:if>
          <xsl:apply-templates select="$params"/>
          <xsl:if test="empty($params)">
            <xsl:attribute name="controls" select="'controls'"/>
          </xsl:if>
        </iframe>
      </xsl:when>
      <xsl:otherwise>
        <video>
          <xsl:apply-templates select="." mode="m:attributes"/>
          <xsl:sequence select="fp:css-properties(db:videodata[last()])"/>
          <xsl:if test="exists($last?width)">
            <xsl:attribute name="width" select="f:absolute-length($last?width)"/>
          </xsl:if>
          <xsl:if test="exists($last?height)">
            <xsl:attribute name="height" select="f:absolute-length($last?height)"/>
          </xsl:if>
          <xsl:apply-templates select="$params"/>
          <xsl:if test="empty($params)">
            <xsl:attribute name="controls" select="'controls'"/>
          </xsl:if>

          <xsl:variable name="poster" as="map(*)?">
            <xsl:apply-templates select="
                (../db:imageobject/db:imagedata
                [@fileref and contains-token(@role, 'poster')])[1]"
              mode="m:mediaobject-uris"/>
          </xsl:variable>
          <xsl:if test="exists($poster)">
            <xsl:attribute name="poster" select="$poster?href"/>
          </xsl:if>

          <xsl:apply-templates select="." mode="m:mediaobject-start"/>

          <xsl:for-each select="$datas">
            <xsl:apply-templates select=".?node" mode="mp:imagedata">
              <xsl:with-param name="viewport" select="$viewport"/>
              <xsl:with-param name="info" select="."/>
              <xsl:with-param name="last" select="position() eq last()"/>
            </xsl:apply-templates>
          </xsl:for-each>

          <xsl:apply-templates select="." mode="m:mediaobject-end"/>
        </video>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="db:audioobject">
    <xsl:param name="viewport" as="map(*)?"/>
    <xsl:param name="datas" as="map(*)*"/>

    <xsl:variable name="last" select="$datas[last()]"/>
    <xsl:variable name="params" select="array:flatten($last?params)"/>

    <audio>
      <xsl:apply-templates select="." mode="m:attributes"/>
      <xsl:sequence select="fp:css-properties(db:audiodata[last()])"/>
      <xsl:apply-templates select="$params"/>
      <xsl:if test="empty($params)">
        <xsl:attribute name="controls" select="'controls'"/>
      </xsl:if>
      <xsl:for-each select="$datas">
        <xsl:apply-templates select=".?node" mode="mp:imagedata">
          <xsl:with-param name="viewport" select="$viewport"/>
          <xsl:with-param name="info" select="."/>
          <xsl:with-param name="last" select="position() eq last()"/>
        </xsl:apply-templates>
      </xsl:for-each>
    </audio>
  </xsl:template>

  <xsl:template match="db:textobject">
    <xsl:param name="viewport" as="map(*)?"/>
    <xsl:param name="datas" as="map(*)*"/>

    <xsl:variable name="content" as="item()*">
      <xsl:choose>
        <xsl:when test="db:textdata">
          <xsl:apply-templates select="db:textdata[1]">
            <xsl:with-param name="info" select="$datas[1]"/>
          </xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="parent::db:inlinemediaobject">
        <span>
          <xsl:apply-templates select="." mode="m:attributes"/>
          <xsl:sequence select="$content"/>
        </span>
      </xsl:when>
      <xsl:when test="parent::db:mediaobject">
        <div>
          <xsl:apply-templates select="." mode="m:attributes"/>
          <xsl:sequence select="$content"/>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$content"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="db:textdata">
    <xsl:param name="info" as="map(*)"/>
    <xsl:sequence select="unparsed-text($info?uri, ($info?node/@encoding, 'utf-8')[1])"/>
  </xsl:template>

  <xsl:template match="db:caption">
    <div>
      <xsl:apply-templates select="." mode="m:attributes"/>
      <xsl:apply-templates select="." mode="m:generate-titlepage"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="db:multimediaparam">
    <xsl:attribute name="{@name}" select="@value"/>
  </xsl:template>

  <!-- ============================================================ -->

  <xsl:template match="db:imageobjectco" mode="m:imagemap">
    <xsl:param name="intrinsicwidth" as="map(*)"/>
    <xsl:param name="intrinsicheight" as="map(*)"/>

    <map name="imap_{f:id(.)}">
      <xsl:for-each select="db:areaspec//db:area">
        <xsl:variable name="units" as="xs:string" select="
            if (@units) then
              @units
            else
              if (../@units) then
                ../@units
              else
                'calspair'"/>

        <xsl:variable name="coords" as="xs:string?">
          <xsl:choose>
            <xsl:when test="$units = 'calspair'">
              <xsl:variable name="coords" select="
                  tokenize(normalize-space(@coords),
                  '[\s,]+')"/>

              <!-- CALS = LL to UR by percentage * 10000 -->
              <!-- HTML = UL to LR by pixel -->
              <xsl:variable name="x1p" select="xs:decimal($coords[1]) div 10000.0"/>
              <xsl:variable name="y1p" select="1 - (xs:decimal($coords[4]) div 10000.0)"/>
              <xsl:variable name="x2p" select="xs:decimal($coords[3]) div 10000.0"/>
              <xsl:variable name="y2p" select="1 - (xs:decimal($coords[2]) div 10000.0)"/>

              <xsl:sequence select="
                  string-join((round($x1p * $intrinsicwidth?magnitude),
                  round($y1p * $intrinsicheight?magnitude),
                  round($x2p * $intrinsicwidth?magnitude),
                  round($y2p * $intrinsicheight?magnitude)), ',')"/>
            </xsl:when>
            <xsl:when test="
                @units = 'other'
                and (@otherunits = 'html-rect'
                or @otherunits = 'html-circle'
                or @otherunits = 'html-poly')">
              <xsl:sequence select="@coords/string()"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:message>
                <xsl:text>Warning: unsupported units in imagemap: </xsl:text>
                <xsl:sequence select="
                    if (@units = 'other')
                    then
                      @otherunits/string()
                    else
                      @units/string()"/>
              </xsl:message>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <xsl:if test="exists($coords)">
          <area>
            <xsl:attribute name="shape">
              <xsl:choose>
                <xsl:when test="$units = 'calspair' or @otherunits = 'html-rect'">
                  <xsl:sequence select="'rect'"/>
                </xsl:when>
                <xsl:when test="@otherunits = 'html-circle'">
                  <xsl:sequence select="'circle'"/>
                </xsl:when>
                <xsl:when test="@otherunits = 'html-poly'">
                  <xsl:sequence select="'poly'"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:message>
                    <xsl:text>Error: unexpected shape in imagemap: </xsl:text>
                    <xsl:sequence select="
                        if (@units = 'other')
                        then
                          @otherunits/string()
                        else
                          @units/string()"/>
                    <xsl:sequence select="."/>
                  </xsl:message>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>

            <xsl:apply-templates select="." mode="m:attributes"/>
            <xsl:choose>
              <xsl:when test="
                  @linkends
                  or (parent::db:areaset and ../@linkends)">
                <xsl:variable name="idrefs" select="
                    if (@linkends)
                    then
                      normalize-space(@linkends)
                    else
                      normalize-space(../@linkends)"/>

                <xsl:variable name="target" select="key('id', tokenize($idrefs, '[\s]'))[1]"/>

                <xsl:if test="$target">
                  <xsl:attribute name="href" select="f:href(., $target)"/>
                </xsl:if>
              </xsl:when>
              <xsl:when test="@xlink:href">
                <xsl:attribute name="href" select="@xlink:href"/>
              </xsl:when>
            </xsl:choose>

            <xsl:attribute name="coords" select="$coords"/>
          </area>
        </xsl:if>
      </xsl:for-each>
    </map>
  </xsl:template>

  <!-- ============================================================ -->

  <xsl:function name="f:mediaobject-viewport" as="map(*)">
    <xsl:param name="info" as="map(*)"/>

    <xsl:variable name="imageproperties" select="$info?properties"/>

    <xsl:variable name="intrinsicwidth" select="
        if (exists($imageproperties)
        and map:contains($imageproperties, 'width'))
        then
          f:make-length($imageproperties?width, 'px')
        else
          $v:image-nominal-width"/>

    <xsl:variable name="intrinsicheight" select="
        if (exists($imageproperties)
        and map:contains($imageproperties, 'height'))
        then
          f:make-length($imageproperties?height, 'px')
        else
          $v:image-nominal-height"/>

    <xsl:variable name="width" select="f:object-width($info)"/>
    <xsl:variable name="height" select="f:object-height($info)"/>

    <!-- Convert % widths into absolute widths if we can -->

    <xsl:variable name="width" select="
        if ($width?unit = '%' and not(f:is-empty-length($intrinsicwidth)))
        then
          f:make-length($intrinsicwidth?magnitude
          * $width?magnitude
          div 100.0,
          $intrinsicwidth?unit)
        else
          $width"/>

    <xsl:variable name="height" select="
        if ($height?unit = '%' and not(f:is-empty-length($intrinsicheight)))
        then
          f:make-length($intrinsicheight?magnitude
          * $height?magnitude
          div 100.0,
          $intrinsicheight?unit)
        else
          $height"/>

    <xsl:variable name="scalefit" select="f:object-scalefit($info)"/>
    <xsl:variable name="scale" select="f:object-scale($info)"/>

    <xsl:variable name="cw" select="f:object-contentwidth($info, $intrinsicwidth)"/>

    <!-- <xsl:message select="'cw:', serialize($cw, $v:as-json), $scale"/> -->

    <xsl:variable name="contentwidth" as="map(*)?">
      <xsl:choose>
        <xsl:when test="$cw?unit or (exists($width) and ($scalefit or $scale ne 1.0))">
          <xsl:variable name="cw" select="
              if (f:is-empty-length($cw))
              then
                $intrinsicwidth
              else
                $cw"/>

          <xsl:variable name="contentwidth" select="
              if ($scalefit) then
                $width
              else
                $cw"/>

          <xsl:variable name="cw" select="
              if (f:is-empty-length($contentwidth))
              then
                $v:image-nominal-width
              else
                $contentwidth"/>

          <xsl:variable name="contentwidth" select="
              if ($scale ne 1.0)
              then
                f:make-length($cw?magnitude * $scale, $cw?unit)
              else
                $contentwidth"/>

          <xsl:sequence select="
              if (f:equal-lengths($contentwidth, $intrinsicwidth))
              then
                ()
              else
                $contentwidth"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$cw"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <!-- ======================================== -->

    <xsl:variable name="ch" select="f:object-contentheight($info, $intrinsicheight)"/>

    <xsl:variable name="contentheight" as="map(*)?">
      <xsl:choose>
        <xsl:when test="$ch?unit or (exists($height) and ($scalefit or $scale ne 1.0))">
          <xsl:variable name="ch" select="
              if (f:is-empty-length($ch))
              then
                $intrinsicheight
              else
                $ch"/>

          <xsl:variable name="contentheight" select="
              if ($scalefit) then
                $height
              else
                $ch"/>

          <xsl:variable name="ch" select="
              if (f:is-empty-length($contentheight))
              then
                $v:image-nominal-height
              else
                $contentheight"/>

          <xsl:variable name="contentheight" select="
              if ($scale ne 1.0)
              then
                f:make-length($ch?magnitude * $scale, $ch?unit)
              else
                $contentheight"/>

          <xsl:sequence select="
              if (f:equal-lengths($contentheight, $intrinsicheight))
              then
                ()
              else
                $contentheight"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$ch"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="align" select="f:object-align($info)"/>

    <!-- There's no point doing valign if there's no height -->
    <xsl:variable name="valign" select="
        if (f:is-empty-length($height)
        and f:is-empty-length($contentheight))
        then
          ()
        else
          f:object-valign($info)"/>

    <xsl:variable name="result" select="
        map {
          'intrinsicwidth': $intrinsicwidth,
          'intrinsicheight': $intrinsicheight,
          'width': $width,
          'height': $height,
          'contentwidth': $contentwidth,
          'contentheight': $contentheight,
          'scale': $scale,
          'scalefit': $scalefit,
          'align': $align,
          'valign': $valign
        }"/>

    <xsl:message use-when="'image-properties' = $v:debug" select="serialize($result, $v:as-json)"/>

    <xsl:sequence select="$result"/>
  </xsl:function>

  <!-- ============================================================ -->

  <xsl:template match="svg:*">
    <xsl:element name="{local-name(.)}" namespace="http://www.w3.org/1999/xhtml">
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="node()"/>
    </xsl:element>
  </xsl:template>

  <!-- ============================================================ -->

  <xsl:template name="tp:viewport">
    <xsl:param name="class" as="xs:string" select="'viewport'"/>
    <xsl:param name="width" as="map(*)?"/>
    <xsl:param name="height" as="map(*)?"/>
    <xsl:param name="align" as="xs:string?"/>
    <xsl:param name="valign" as="xs:string?"/>
    <xsl:param name="pi-properties" as="element()?"/>
    <xsl:param name="content" as="element()+"/>

    <xsl:variable name="valign" select="f:css-property('vertical-align', $valign)"/>
    <xsl:variable name="width" select="f:css-length('width', $width)"/>
    <xsl:variable name="height" select="f:css-length('height', $height)"/>
    <xsl:variable name="align" select="f:css-property('text-align', $align)"/>

    <xsl:variable name="pi-styles" select="tokenize($pi-properties/@style, '\s*;\s*')"/>

    <xsl:variable name="styles" as="xs:string*">
      <xsl:sequence select="($width, $height, $align, $valign)"/>
      <xsl:for-each select="$pi-styles">
        <xsl:choose>
          <xsl:when test="normalize-space(.) = ''"/>
          <xsl:when test="
              starts-with(., 'width:')
              or starts-with(., 'height:')
              or starts-with(., 'text-align:')
              or starts-with(., 'vertical-align:')">
            <xsl:message expand-text="yes">Ignoring ?db style property: {.}</xsl:message>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="."/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:variable>

    <span>
      <xsl:attribute name="class" select="$class"/>
      <xsl:if test="exists($styles)">
        <xsl:attribute name="style" select="string-join($styles, ';') || ';'"/>
      </xsl:if>
      <xsl:sequence select="$content"/>
    </span>
  </xsl:template>

  <!-- ============================================================ -->

  <xsl:template match="*" mode="mp:imagedata">
    <xsl:param name="viewport" as="map(*)?"/>
    <xsl:param name="info" as="map(*)"/>
    <xsl:param name="last" as="xs:boolean"/>

    <xsl:variable name="width" select="
        if (exists($viewport?contentwidth))
        then
          f:css-length('width', $viewport?contentwidth)
        else
          if ($info?scalefit)
          then
            f:css-length('width', $info?width)
          else
            ()"/>
    <xsl:variable name="height" select="
        if (exists($viewport?contentheight))
        then
          f:css-length('height', $viewport?contentheight)
        else
          if ($info?scalefit)
          then
            f:css-length('height', $info?height)
          else
            ()"/>

    <xsl:variable name="styles" select="($width, $height)"/>

    <xsl:choose>
      <!-- attempt to handle audio and video data -->
      <xsl:when test="self::db:audiodata or self::db:videodata">
        <source src="{$info?href}">
          <xsl:if test="$info?content-type">
            <xsl:attribute name="type" select="$info?content-type"/>
          </xsl:if>
          <xsl:if test="$last and normalize-space($fallback-js) != ''">
            <xsl:attribute name="onerror" select="'docbook_object_fallback(parentNode)'"/>
          </xsl:if>
        </source>
      </xsl:when>

      <xsl:when test="svg:*">
        <div class="svg">
          <xsl:if test="ancestor::db:imageobjectco">
            <xsl:attribute name="usemap" select="'#imap_' || f:id(ancestor::db:imageobjectco)"/>
          </xsl:if>
          <xsl:if test="exists($styles)">
            <xsl:attribute name="style" select="string-join($styles, ';') || ';'"/>
          </xsl:if>
          <xsl:apply-templates/>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="t:mediaobject-img">
          <xsl:with-param name="filename" select="$info?href"/>
          <xsl:with-param name="styles" select="$styles"/>
          <xsl:with-param name="viewport" select="$viewport"/>
          <xsl:with-param name="imageproperties" select="$info?properties"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="t:mediaobject-img">
    <xsl:param name="filename" as="xs:string"/>
    <xsl:param name="styles" as="xs:string*"/>
    <xsl:param name="viewport" as="map(*)?"/>
    <xsl:param name="imageproperties" as="map(*)?"/>

    <img src="{$filename}">
      <xsl:apply-templates select="." mode="m:attributes"/>

      <!-- Apply any alt text in the media object to the image tag. -->
      <xsl:variable name="short" select="
          (ancestor::db:mediaobject | ancestor::db:inlinemediaobject)
          /(db:alt, db:textobject[db:phrase])[1]"/>
      <xsl:if test="exists($short)">
        <xsl:attribute name="alt" select="normalize-space($short)"/>
      </xsl:if>

      <xsl:if test="exists($styles)">
        <xsl:variable name="css-properties" select="fp:css-properties(.)"/>
        <xsl:attribute name="style" select="
            string-join($styles, ';') || ';'
            || (if (exists($css-properties)) then
              string($css-properties)
            else
              '')"/>
      </xsl:if>

      <xsl:if test="ancestor::db:imageobjectco">
        <xsl:variable name="co" select="ancestor::db:imageobjectco"/>
        <xsl:choose>
          <xsl:when test="empty($imageproperties)">
            <xsl:message>
              <xsl:text>Imagemaps require image </xsl:text>
              <xsl:text>intrinsics extension</xsl:text>
            </xsl:message>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="usemap" select="concat('#', 'imap_' || f:id($co))"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
    </img>
  </xsl:template>

  <!-- ============================================================ -->

  <xsl:function name="f:object-width" as="map(*)">
    <xsl:param name="info" as="map(*)"/>
    <xsl:sequence select="
        if ($image-ignore-scaling)
        then
          f:empty-length()
        else
          ($info?width, map {})[1]"/>
  </xsl:function>

  <xsl:function name="f:object-height" as="map(*)">
    <xsl:param name="info" as="map(*)"/>
    <xsl:sequence select="
        if ($image-ignore-scaling)
        then
          f:empty-length()
        else
          ($info?height, map {})[1]"/>
  </xsl:function>

  <xsl:function name="f:object-contentwidth" as="map(*)">
    <xsl:param name="info" as="map(*)"/>
    <xsl:param name="intrinsicwidth" as="map(*)"/>

    <xsl:choose>
      <xsl:when test="$image-ignore-scaling">
        <xsl:sequence select="f:empty-length()"/>
      </xsl:when>
      <xsl:when test="exists($info?contentwidth)">
        <xsl:variable name="width" select="$info?contentwidth"/>
        <xsl:sequence select="
            if ($width?unit = '%')
            then
              f:make-length($width?magnitude
              * $intrinsicwidth?magnitude
              div 100.0,
              $intrinsicwidth?unit)
            else
              $width"/>
      </xsl:when>
      <xsl:when test="$info?scalefit and exists($info?width)">
        <xsl:sequence select="$info?width"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="f:empty-length()"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="f:object-contentheight" as="map(*)">
    <xsl:param name="info" as="map(*)"/>
    <xsl:param name="intrinsicheight" as="map(*)"/>

    <xsl:choose>
      <xsl:when test="$image-ignore-scaling">
        <xsl:sequence select="f:empty-length()"/>
      </xsl:when>
      <xsl:when test="exists($info?contentheight)">
        <xsl:variable name="depth" select="$info?contentheight"/>
        <xsl:sequence select="
            if ($depth?unit = '%')
            then
              f:make-length($depth?magnitude
              * $intrinsicheight?magnitude
              div 100.0,
              $intrinsicheight?unit)
            else
              $depth"/>
      </xsl:when>
      <xsl:when test="$info?scalefit and exists($info?height)">
        <xsl:sequence select="$info?height"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="f:empty-length()"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="f:css-length" as="xs:string?">
    <xsl:param name="property" as="xs:string"/>
    <xsl:param name="length" as="map(*)?"/>
    <xsl:sequence select="
        if (exists($length) and $length?unit)
        then
          f:css-property($property, string(f:absolute-length($length)) || 'px')
        else
          ()"/>
  </xsl:function>

  <xsl:function name="f:css-property" as="xs:string?">
    <xsl:param name="property" as="xs:string"/>
    <xsl:param name="value" as="xs:string?"/>
    <xsl:sequence select="
        if (exists($value))
        then
          $property || ':' || $value
        else
          ()"/>
  </xsl:function>

  <xsl:function name="f:object-scalefit" as="xs:boolean">
    <xsl:param name="info" as="map(*)"/>
    <xsl:choose>
      <xsl:when test="
          $image-ignore-scaling
          or exists($info?contentwidth)
          or exists($info?contentheight)">
        <xsl:sequence select="false()"/>
      </xsl:when>
      <xsl:when test="$info?scale">
        <xsl:sequence select="false()"/>
      </xsl:when>
      <xsl:when test="exists($info?scalefit)">
        <xsl:sequence select="$info?scalefit"/>
      </xsl:when>
      <xsl:when test="
          f:object-width($info)?magnitude
          or f:object-height($info)?magnitude">
        <!-- this is for backwards compatibility -->
        <xsl:sequence select="true()"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="false()"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="f:object-scale" as="xs:double">
    <xsl:param name="info" as="map(*)"/>
    <xsl:choose>
      <xsl:when test="$image-ignore-scaling or not($info?scale)">
        <xsl:sequence select="1.0"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="xs:double($info?scale) div 100.0"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="f:object-align" as="xs:string?">
    <xsl:param name="info" as="map(*)"/>
    <xsl:sequence select="$info?align"/>
  </xsl:function>

  <xsl:function name="f:object-valign" as="xs:string?">
    <xsl:param name="info" as="map(*)"/>
    <!-- Historically, middle seems to have been the default -->
    <xsl:sequence select="($info?valign, 'middle')[1]"/>
  </xsl:function>

  <xsl:function name="f:object-properties" as="map(xs:string, xs:anyAtomicType)">
    <xsl:param name="uri" as="xs:string"/>
    <xsl:sequence select="f:object-properties($uri, true())"/>
  </xsl:function>

  <xsl:function name="f:object-properties" as="map(xs:string, xs:anyAtomicType)">
    <xsl:param name="uri" as="xs:string"/>
    <xsl:param name="image-file" as="xs:boolean"/>


    <xsl:variable name="properties" as="map(xs:string, xs:anyAtomicType)"
      use-when="function-available('ext:image-metadata')">
      <xsl:sequence select="ext:image-metadata($uri, $image-file)"/>
    </xsl:variable>

    <xsl:variable name="properties" as="map(xs:string, xs:anyAtomicType)" use-when="
        function-available('ext:image-properties')
        and not(function-available('ext:image-metadata'))">
      <xsl:sequence select="ext:image-properties($uri)"/>
    </xsl:variable>

    <xsl:variable name="properties" as="map(xs:string, xs:anyAtomicType)" use-when="
        not(function-available('ext:image-properties'))
        and not(function-available('ext:image-properties'))" select="map {}"/>

    <xsl:if use-when="
        not(function-available('ext:image-properties'))
        and not(function-available('ext:image-properties'))" test="$image-property-warning">
      <xsl:message>
        <xsl:text>Cannot read image properties (no extension)</xsl:text>
      </xsl:message>
    </xsl:if>
    
    <!-- See Issue 432: https://github.com/docbook/xslTNG/issues/432 -->
    <xsl:variable name="properties" as="map(*)">
      <xsl:choose>
        <xsl:when test="
            not(map:contains($properties, 'width') or map:contains($properties, 'height'))
            and doc-available($uri)">
          <xsl:variable name="svg" as="element()?" select="doc($uri)/*:svg"/>
          <xsl:choose>
            <xsl:when test="exists($svg/@width) and exists($svg/@height)">
              <xsl:message select="'Ergänze SVG'"/>
              <xsl:sequence select="
                  map:put($properties, 'width', f:absolute-length(f:parse-length($svg/@width))) !
                  map:put(., 'height', f:absolute-length(f:parse-length($svg/@height)))"
              />
            </xsl:when>
            <xsl:otherwise>
              <xsl:sequence select="$properties"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$properties"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:message use-when="$v:debug = 'image-properties'"
      select="$uri, serialize($properties, $v:as-json)"/>
    <xsl:sequence select="$properties"/>
  </xsl:function>

  <!-- ============================================================ -->

  <xsl:template match="db:alt"/>

  <!-- ============================================================ -->

  <xsl:template match="db:alt | db:textobject[db:phrase]" mode="m:details">
    <xsl:if test="'summary' = $vp:mediaobject-accessibility">
      <xsl:attribute name="summary" select="normalize-space(.)"/>
    </xsl:if>
    <xsl:if test="'a11y-metadata' = $vp:mediaobject-accessibility">
      <meta property="a11y:accessibilitySummary" content="{normalize-space(.)}"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="db:textobject[not(db:phrase)]" mode="m:details">
    <xsl:if test="'details' = $vp:mediaobject-accessibility">
      <details>
        <xsl:apply-templates/>
      </details>
    </xsl:if>
  </xsl:template>

  <!-- ============================================================ -->

  <xsl:template match="db:audioobject | db:imageobject | db:textobject | db:videoobject" as="map(*)"
    mode="m:mediaobject-info">
    <xsl:variable name="datas" as="map(*)*">
      <xsl:apply-templates select="db:audiodata | db:imagedata | db:videodata | db:textdata"
        mode="m:mediaobject-info"/>
    </xsl:variable>

    <xsl:sequence select="
        map {
          'node': .,
          'datas': array {$datas},
          'content-types': array {distinct-values($datas ! .?content-type)},
          'extensions': array {distinct-values($datas ! .?extension)}
        }"/>
  </xsl:template>

  <xsl:template match="db:textobject[not(db:textdata)]" as="map(*)" mode="m:mediaobject-info"
    priority="50">
    <xsl:sequence select="
        map {
          'node': .,
          'datas': array {},
          'content-types': array {},
          'extensions': array {}
        }"/>
  </xsl:template>

  <xsl:template match="db:textobject[db:phrase]" mode="m:mediaobject-info" priority="100"/>

  <xsl:template match="db:audiodata | db:imagedata | db:videodata | db:textdata" as="map(*)?"
    mode="m:mediaobject-info">

    <xsl:variable name="uris" as="map(*)">
      <xsl:apply-templates select="." mode="m:mediaobject-uris"/>
    </xsl:variable>

    <xsl:variable name="ext" select="tokenize($uris?fileref, '\.')[last()] ! concat('.', .)"/>

    <xsl:variable name="content-type" as="xs:string">
      <xsl:choose>
        <xsl:when test=".//svg:*">
          <xsl:sequence select="map:get($v:media-type-map, '.svg')"/>
        </xsl:when>
        <xsl:when test="empty($ext)">
          <xsl:sequence select="$v:media-type-default"/>
        </xsl:when>
        <xsl:when test="map:contains($v:media-type-map, $ext)">
          <xsl:sequence select="map:get($v:media-type-map, $ext)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$v:media-type-default"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="info" select="
        map {
          'node': .,
          'extension': $ext,
          'params': array {db:multimediaparam},
          'align': @align/string(),
          'valign': @valign/string(),
          'width': @width ! f:parse-length(.),
          'height': @depth ! f:parse-length(.),
          'contentwidth': @contentwidth ! f:parse-length(.),
          'contentheight': @contentdepth ! f:parse-length(.),
          'scale': @scale ! number(.),
          'scalefit': @scalefit/string() ! (. = '1'),
          'content-type': $content-type
        }"/>

    <xsl:sequence select="
        if ($ext = $v:mediaobject-exclude-extensions)
        then
          ()
        else
          map:merge(($uris, $info))"/>
  </xsl:template>

  <xsl:function name="f:mediaobject-input-base-uri" as="xs:string">
    <xsl:param name="node" as="element()"/>

    <!-- This is complicated. This used to be computed as a global variable,
       but in XSpec, the context item was sometimes missing, so it would
       fail. Outside of XSpec, I find that sometimes to document node
       is missing a base URI. (Maybe a bug in my XInclude function?)
       So in the short term, I'm using the base URI of the document element.
       Unless *that's* empty, in which case just use the base URI of
       the current node. But that's going to be wrong sometimes... -->

    <xsl:variable name="base" select="
        if (base-uri($node/root()/*) = '')
        then
          base-uri($node)
        else
          base-uri($node/root()/*)"/>

    <!--
  <xsl:message use-when="'mediaobject-uris' = $v:debug"
               select="'Mediaobject inp. base URI:',
                       if (empty($mediaobject-input-base-uri))
                       then $base
                       else resolve-uri($mediaobject-input-base-uri, $base)"/>
-->

    <xsl:sequence select="
        if (empty($mediaobject-input-base-uri))
        then
          $base
        else
          resolve-uri($mediaobject-input-base-uri, $base)"/>
  </xsl:function>

  <xsl:template match="db:audiodata | db:imagedata | db:videodata | db:textdata" as="map(*)?"
    mode="m:mediaobject-uris">

    <!-- imagedata, videodata, audiodata -->
    <xsl:variable name="uri" as="xs:string?">
      <xsl:choose>
        <xsl:when test="not(@fileref)">
          <xsl:sequence select="()"/>
        </xsl:when>
        <xsl:when test="empty($mediaobject-input-base-uri)">
          <xsl:sequence select="f:mediaobject-amend-uri(resolve-uri(@fileref, base-uri(.)))"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="
              f:mediaobject-amend-uri(
              resolve-uri(@fileref, f:mediaobject-input-base-uri(.)))"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="base-uri" select="
        if (empty($mediaobject-input-base-uri))
        then
          f:mediaobject-input-base-uri(.)
        else
          resolve-uri($mediaobject-input-base-uri,
          f:mediaobject-input-base-uri(.))"/>

    <xsl:if test="'mediaobject-uris' = $v:debug">
      <xsl:message select="'&#10;  xml baseuri:', base-uri(.)"/>
      <xsl:if test="not(empty($mediaobject-input-base-uri))">
        <xsl:message select="'  m/o baseuri:', $mediaobject-input-base-uri"/>
      </xsl:if>
      <xsl:message select="'f:m/o baseuri:', f:mediaobject-input-base-uri(.)"/>
      <xsl:message select="'      fileref:', @fileref/string()"/>
      <xsl:message select="'     base-uri:', $base-uri"/>
      <xsl:message select="'          uri:', $uri"/>
      <xsl:message select="
          '     relative →',
          (if (exists($uri))
          then
            f:relative-path($base-uri, $uri)
          else
            ())"/>
    </xsl:if>

    <xsl:choose>
      <xsl:when test="exists($uri)">
        <xsl:sequence select="
            map {
              'fileref': @fileref/string(),
              'uri': $uri,
              'href': f:relative-path($base-uri, $uri),
              'properties': (if (exists($uri))
              then
                f:object-properties($uri, exists(self::db:imagedata))
              else
                ())
            }"/>
      </xsl:when>
      <xsl:otherwise>
        <!-- for an inline image, SVG for example -->
        <xsl:sequence select="
            map {
              'fileref': '',
              'uri': (),
              'href': (),
              'properties': ()
            }"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:function name="f:mediaobject-amend-uri" as="xs:string">
    <xsl:param name="uri" as="xs:string"/>

    <xsl:choose>
      <xsl:when test="exists(f:uri-scheme($uri)) and f:uri-scheme($uri) ne 'file'">
        <!-- It starts with a non-file: scheme, just assume it's absolute. -->
        <xsl:sequence select="$uri"/>
      </xsl:when>
      <xsl:when test="f:is-true($mediaobject-grouped-by-type)">
        <xsl:variable name="type" select="f:mediaobject-type($uri)"/>
        <xsl:sequence select="
            if (exists($type))
            then
              string-join((tokenize($uri, '/')[position() lt last()],
              $type,
              tokenize($uri, '/')[position() eq last()]), '/')
            else
              $uri"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$uri"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="f:mediaobject-type" as="xs:string?">
    <xsl:param name="uri" as="xs:string"/>

    <xsl:variable name="fn" select="tokenize($uri, '/')[last()]"/>

    <xsl:if test="contains($fn, '.')">
      <xsl:sequence select="tokenize($fn, '\.')[last()]"/>
    </xsl:if>
  </xsl:function>

  <!-- ============================================================ -->

  <xsl:template match="db:mediaobject" mode="m:mediaobject-start">
    <xsl:variable name="pkind" select="string((db:* except (db:info | db:alt))[1] ! local-name(.))"/>
    <xsl:variable name="placement" select="
        if (map:get($v:mediaobject-details-placement, $pkind))
        then
          map:get($v:mediaobject-details-placement, $pkind)
        else
          map:get($v:mediaobject-details-placement, '_default')"/>

    <xsl:variable name="short" select="(db:alt | db:textobject[db:phrase])[1]"/>
    <xsl:variable name="long" select="db:textobject[not(db:phrase)]"/>

    <xsl:apply-templates select="$short" mode="m:details"/>
    <xsl:apply-templates select="db:info/db:meta" mode="m:mediaobject-start"/>

    <xsl:if test="
        $placement = 'before'
        and 'details' = $vp:mediaobject-accessibility
        and (db:imageobject | db:imageobjectco | db:audioobject | db:videoobject)">
      <xsl:apply-templates select="$long" mode="m:details"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="db:inlinemediaobject" mode="m:mediaobject-start">
    <xsl:variable name="short" select="(db:alt | db:textobject[db:phrase]/db:phrase)[1]"/>
    <xsl:variable name="long" select="db:textobject[not(db:phrase)]"/>
    <xsl:apply-templates select="$short" mode="m:details"/>
    <xsl:apply-templates select="db:info/db:meta" mode="m:mediaobject-start"/>
  </xsl:template>

  <xsl:template match="db:meta" mode="m:mediaobject-start">
    <meta property="{@name}" content="{(@content,normalize-space(.))[1]}"/>
  </xsl:template>

  <xsl:template match="*" mode="m:mediaobject-start">
    <xsl:apply-templates select="db:info/db:meta" mode="m:mediaobject-start"/>
  </xsl:template>

  <xsl:template match="db:mediaobject" mode="m:mediaobject-end">
    <xsl:variable name="pkind" select="string((db:* except (db:info | db:alt))[1] ! local-name(.))"/>
    <xsl:variable name="placement" select="
        if (map:get($v:mediaobject-details-placement, $pkind))
        then
          map:get($v:mediaobject-details-placement, $pkind)
        else
          map:get($v:mediaobject-details-placement, '_default')"/>

    <xsl:apply-templates select="db:caption"/>

    <xsl:if test="
        not($placement = 'before')
        and 'details' = $vp:mediaobject-accessibility
        and (db:imageobject | db:imageobjectco | db:audioobject | db:videoobject)">
      <xsl:apply-templates select="db:textobject[not(db:phrase)]" mode="m:details"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="db:inlinemediaobject" mode="m:mediaobject-end"> </xsl:template>

  <xsl:template match="*" mode="m:mediaobject-end"> </xsl:template>

</xsl:stylesheet>
