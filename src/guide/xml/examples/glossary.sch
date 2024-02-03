<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

  <xsl:include xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    href="standalone-functions.xsl"/>

   <ns uri="http://docbook.org/ns/docbook" prefix="db"/>
  <ns uri="http://docbook.org/ns/docbook/functions" prefix="f"/>

  <pattern>
    <rule context="
        db:firstterm
        | db:glossterm[not(ancestor::db:glossary)]">
       <let name="term" value="((@baseform, .)[1])"/>
      <let name="n" value="count(f:glossentries(.))"/>

      <report role="error" test="$n eq 0">No entry for 
        <value-of select="$term"/> in glossary.</report>

      <report role="warning" test="$n gt 1"><value-of select="$n"/> 
        entries for <value-of select="$term"/> in glossary.</report>

    </rule>
  </pattern>

</schema>