<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:q="http://www.w3.org/1999/XSL/Transform/quoted"
                xmlns:vp="http://docbook.org/ns/docbook/variables/private"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="3.0">

<xsl:namespace-alias stylesheet-prefix="q" result-prefix="xsl"/>
<xsl:output method="xml" encoding="utf-8" indent="yes"/>

<xsl:template match="xsl:stylesheet|xsl:transform">
  <q:stylesheet version="3.0">
    <q:variable name="vp:static-parameters"
                as="map(xs:QName, item()*)">
      <q:map>
        <xsl:apply-templates select="xsl:param[@static='yes']"/>
      </q:map>
    </q:variable>
    <q:variable name="vp:dynamic-parameters"
                as="map(xs:QName, item()*)">
      <q:map>
        <xsl:apply-templates select="xsl:param[not(@static='yes')]"/>
      </q:map>
    </q:variable>
  </q:stylesheet>
</xsl:template>

<xsl:template match="xsl:param">
  <q:map-entry key="xs:QName('{resolve-QName(@name, .)}')"
               select="${@name}"/>
</xsl:template>

</xsl:stylesheet>
