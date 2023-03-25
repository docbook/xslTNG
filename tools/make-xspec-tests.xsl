<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                exclude-result-prefixes="xs"
                version="3.0">

<xsl:output method="xml" encoding="utf-8" indent="yes"/>

<xsl:param name="basename" as="xs:string" required="yes"/>
<xsl:param name="source" as="xs:string" select="$basename"/>
<xsl:param name="class" as="xs:string" required="yes"/>
<xsl:param name="from" as="xs:string" required="yes"/>
<xsl:param name="target" as="xs:string" select="'number'"/>

<xsl:mode on-no-match="shallow-copy"/>

<xsl:template name="xsl:initial-template">
  <x:description xmlns:x="http://www.jenitennison.com/xslt/xspec"
                 stylesheet="../xspec-xslt/xspec-{$class}s-{$target}-from-{$from}-driver.xsl">

    <x:scenario label="When converting {$basename}-{$from}...">
      <x:context href="../../src/test/resources/xml/{$source}.xml"/>
      <x:expect label="expect {$class}s {$target}ed from {$from}s"
                href="../../src/test/resources/expected/{$basename}-{$from}.html"/>
    </x:scenario>
  </x:description>
</xsl:template>

</xsl:stylesheet>
