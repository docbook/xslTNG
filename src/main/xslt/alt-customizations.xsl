<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="#all"
                version="3.0">

<!-- These are alternate customizations layer that enable testing some
     features of the stylesheets that would be difficult to test with
     the default stylesheet (for example, numbering of sets and
     books). -->

<xsl:variable name="v:user-title-groups" as="element()*">
  <title xpath="self::db:set|self::db:book" group="title-numbered"/>
</xsl:variable>

<xsl:variable name="v:custom-localizations">
  <locale xmlns="http://docbook.org/ns/docbook/l10n/source"
          language="en"
          english-language-name="English">
    <group name="title-numbered">
      <template match="self::db:book">%l %c</template>
      <template match="self::db:set">%l %c</template>
    </group>
   <group name="list-of-titles">
      <template match="self::db:set">%l %c</template>
      <template match="self::db:book">%l %c</template>
   </group>
   <group name="number-format">
      <template match="self::db:set">⎡1⎦</template>
      <template match="self::db:book">(α)</template>
   </group>
  </locale>
</xsl:variable>

</xsl:stylesheet>
