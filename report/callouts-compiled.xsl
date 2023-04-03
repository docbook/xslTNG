<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                 exclude-result-prefixes="#all"
                 version="3.0">
   <!-- the tested stylesheet -->
   <xsl:import href="file:/home/runner/work/xslTNG/xslTNG/build/env/callouts.xsl"/>
   <!-- XSpec library modules providing tools -->
   <xsl:include href="file:/home/runner/work/xslTNG/xslTNG/build/xspec-2.2.4/src/common/runtime-utils.xsl"/>
   <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}stylesheet-uri"
                  as="Q{http://www.w3.org/2001/XMLSchema}anyURI">file:/home/runner/work/xslTNG/xslTNG/build/env/callouts.xsl</xsl:variable>
   <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}xspec-uri"
                  as="Q{http://www.w3.org/2001/XMLSchema}anyURI">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:variable>
   <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}is-external"
                  as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                  select="false()"/>
   <xsl:variable xmlns:xs="http://www.w3.org/2001/XMLSchema"
                  name="Q{urn:x-xspec:compile:impl}thread-aware"
                  as="xs:boolean"
                  select="(system-property('Q{http://www.w3.org/1999/XSL/Transform}product-name') eq 'SAXON') and starts-with(system-property('Q{http://www.w3.org/1999/XSL/Transform}product-version'), 'EE ')"
                  static="yes"/>
   <xsl:variable name="Q{urn:x-xspec:compile:impl}logical-processor-count"
                  as="Q{http://www.w3.org/2001/XMLSchema}integer"
                  use-when="$Q{urn:x-xspec:compile:impl}thread-aware"
                  select="Q{java:java.lang.Runtime}getRuntime() =&gt; Q{java:java.lang.Runtime}availableProcessors()"/>
   <xsl:variable name="Q{urn:x-xspec:compile:impl}thread-count"
                  as="Q{http://www.w3.org/2001/XMLSchema}integer"
                  select="1"
                  use-when="$Q{urn:x-xspec:compile:impl}thread-aware =&gt; not()"/>
   <!-- the main template to run the suite -->
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}main"
                  as="empty-sequence()">
      <xsl:context-item use="absent"/>
      <!-- info message -->
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('Q{http://www.w3.org/1999/XSL/Transform}product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('Q{http://www.w3.org/1999/XSL/Transform}product-version')"/>
      </xsl:message>
      <!-- set up the result document (the report) -->
      <xsl:result-document format="Q{{http://www.jenitennison.com/xslt/xspec}}xml-report-serialization-parameters">
         <xsl:element name="report" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
            <xsl:attribute name="stylesheet" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/env/callouts.xsl</xsl:attribute>
            <xsl:attribute name="date" namespace="" select="current-dateTime()"/>
            <!-- invoke each compiled top-level x:scenario -->
            <xsl:for-each select="1 to 132">
               <xsl:choose>
                  <xsl:when test=". eq 1">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1"/>
                  </xsl:when>
                  <xsl:when test=". eq 2">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2"/>
                  </xsl:when>
                  <xsl:when test=". eq 3">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3"/>
                  </xsl:when>
                  <xsl:when test=". eq 4">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4"/>
                  </xsl:when>
                  <xsl:when test=". eq 5">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5"/>
                  </xsl:when>
                  <xsl:when test=". eq 6">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6"/>
                  </xsl:when>
                  <xsl:when test=". eq 7">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7"/>
                  </xsl:when>
                  <xsl:when test=". eq 8">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8"/>
                  </xsl:when>
                  <xsl:when test=". eq 9">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9"/>
                  </xsl:when>
                  <xsl:when test=". eq 10">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10"/>
                  </xsl:when>
                  <xsl:when test=". eq 11">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11"/>
                  </xsl:when>
                  <xsl:when test=". eq 12">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12"/>
                  </xsl:when>
                  <xsl:when test=". eq 13">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13"/>
                  </xsl:when>
                  <xsl:when test=". eq 14">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14"/>
                  </xsl:when>
                  <xsl:when test=". eq 15">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15"/>
                  </xsl:when>
                  <xsl:when test=". eq 16">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario16"/>
                  </xsl:when>
                  <xsl:when test=". eq 17">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario17"/>
                  </xsl:when>
                  <xsl:when test=". eq 18">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario18"/>
                  </xsl:when>
                  <xsl:when test=". eq 19">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario19"/>
                  </xsl:when>
                  <xsl:when test=". eq 20">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario20"/>
                  </xsl:when>
                  <xsl:when test=". eq 21">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario21"/>
                  </xsl:when>
                  <xsl:when test=". eq 22">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario22"/>
                  </xsl:when>
                  <xsl:when test=". eq 23">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario23"/>
                  </xsl:when>
                  <xsl:when test=". eq 24">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario24"/>
                  </xsl:when>
                  <xsl:when test=". eq 25">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario25"/>
                  </xsl:when>
                  <xsl:when test=". eq 26">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario26"/>
                  </xsl:when>
                  <xsl:when test=". eq 27">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario27"/>
                  </xsl:when>
                  <xsl:when test=". eq 28">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario28"/>
                  </xsl:when>
                  <xsl:when test=". eq 29">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario29"/>
                  </xsl:when>
                  <xsl:when test=". eq 30">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario30"/>
                  </xsl:when>
                  <xsl:when test=". eq 31">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario31"/>
                  </xsl:when>
                  <xsl:when test=". eq 32">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario32"/>
                  </xsl:when>
                  <xsl:when test=". eq 33">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario33"/>
                  </xsl:when>
                  <xsl:when test=". eq 34">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario34"/>
                  </xsl:when>
                  <xsl:when test=". eq 35">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario35"/>
                  </xsl:when>
                  <xsl:when test=". eq 36">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario36"/>
                  </xsl:when>
                  <xsl:when test=". eq 37">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario37"/>
                  </xsl:when>
                  <xsl:when test=". eq 38">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario38"/>
                  </xsl:when>
                  <xsl:when test=". eq 39">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario39"/>
                  </xsl:when>
                  <xsl:when test=". eq 40">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario40"/>
                  </xsl:when>
                  <xsl:when test=". eq 41">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario41"/>
                  </xsl:when>
                  <xsl:when test=". eq 42">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario42"/>
                  </xsl:when>
                  <xsl:when test=". eq 43">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario43"/>
                  </xsl:when>
                  <xsl:when test=". eq 44">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario44"/>
                  </xsl:when>
                  <xsl:when test=". eq 45">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario45"/>
                  </xsl:when>
                  <xsl:when test=". eq 46">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario46"/>
                  </xsl:when>
                  <xsl:when test=". eq 47">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario47"/>
                  </xsl:when>
                  <xsl:when test=". eq 48">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario48"/>
                  </xsl:when>
                  <xsl:when test=". eq 49">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario49"/>
                  </xsl:when>
                  <xsl:when test=". eq 50">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario50"/>
                  </xsl:when>
                  <xsl:when test=". eq 51">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario51"/>
                  </xsl:when>
                  <xsl:when test=". eq 52">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario52"/>
                  </xsl:when>
                  <xsl:when test=". eq 53">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario53"/>
                  </xsl:when>
                  <xsl:when test=". eq 54">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario54"/>
                  </xsl:when>
                  <xsl:when test=". eq 55">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario55"/>
                  </xsl:when>
                  <xsl:when test=". eq 56">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario56"/>
                  </xsl:when>
                  <xsl:when test=". eq 57">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario57"/>
                  </xsl:when>
                  <xsl:when test=". eq 58">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario58"/>
                  </xsl:when>
                  <xsl:when test=". eq 59">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario59"/>
                  </xsl:when>
                  <xsl:when test=". eq 60">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario60"/>
                  </xsl:when>
                  <xsl:when test=". eq 61">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario61"/>
                  </xsl:when>
                  <xsl:when test=". eq 62">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario62"/>
                  </xsl:when>
                  <xsl:when test=". eq 63">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario63"/>
                  </xsl:when>
                  <xsl:when test=". eq 64">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario64"/>
                  </xsl:when>
                  <xsl:when test=". eq 65">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario65"/>
                  </xsl:when>
                  <xsl:when test=". eq 66">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario66"/>
                  </xsl:when>
                  <xsl:when test=". eq 67">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario67"/>
                  </xsl:when>
                  <xsl:when test=". eq 68">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario68"/>
                  </xsl:when>
                  <xsl:when test=". eq 69">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario69"/>
                  </xsl:when>
                  <xsl:when test=". eq 70">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario70"/>
                  </xsl:when>
                  <xsl:when test=". eq 71">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario71"/>
                  </xsl:when>
                  <xsl:when test=". eq 72">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario72"/>
                  </xsl:when>
                  <xsl:when test=". eq 73">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario73"/>
                  </xsl:when>
                  <xsl:when test=". eq 74">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario74"/>
                  </xsl:when>
                  <xsl:when test=". eq 75">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario75"/>
                  </xsl:when>
                  <xsl:when test=". eq 76">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario76"/>
                  </xsl:when>
                  <xsl:when test=". eq 77">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario77"/>
                  </xsl:when>
                  <xsl:when test=". eq 78">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario78"/>
                  </xsl:when>
                  <xsl:when test=". eq 79">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario79"/>
                  </xsl:when>
                  <xsl:when test=". eq 80">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario80"/>
                  </xsl:when>
                  <xsl:when test=". eq 81">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario81"/>
                  </xsl:when>
                  <xsl:when test=". eq 82">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario82"/>
                  </xsl:when>
                  <xsl:when test=". eq 83">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario83"/>
                  </xsl:when>
                  <xsl:when test=". eq 84">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario84"/>
                  </xsl:when>
                  <xsl:when test=". eq 85">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario85"/>
                  </xsl:when>
                  <xsl:when test=". eq 86">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario86"/>
                  </xsl:when>
                  <xsl:when test=". eq 87">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario87"/>
                  </xsl:when>
                  <xsl:when test=". eq 88">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario88"/>
                  </xsl:when>
                  <xsl:when test=". eq 89">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario89"/>
                  </xsl:when>
                  <xsl:when test=". eq 90">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario90"/>
                  </xsl:when>
                  <xsl:when test=". eq 91">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario91"/>
                  </xsl:when>
                  <xsl:when test=". eq 92">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario92"/>
                  </xsl:when>
                  <xsl:when test=". eq 93">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario93"/>
                  </xsl:when>
                  <xsl:when test=". eq 94">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario94"/>
                  </xsl:when>
                  <xsl:when test=". eq 95">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario95"/>
                  </xsl:when>
                  <xsl:when test=". eq 96">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario96"/>
                  </xsl:when>
                  <xsl:when test=". eq 97">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario97"/>
                  </xsl:when>
                  <xsl:when test=". eq 98">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario98"/>
                  </xsl:when>
                  <xsl:when test=". eq 99">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario99"/>
                  </xsl:when>
                  <xsl:when test=". eq 100">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario100"/>
                  </xsl:when>
                  <xsl:when test=". eq 101">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario101"/>
                  </xsl:when>
                  <xsl:when test=". eq 102">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario102"/>
                  </xsl:when>
                  <xsl:when test=". eq 103">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario103"/>
                  </xsl:when>
                  <xsl:when test=". eq 104">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario104"/>
                  </xsl:when>
                  <xsl:when test=". eq 105">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario105"/>
                  </xsl:when>
                  <xsl:when test=". eq 106">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario106"/>
                  </xsl:when>
                  <xsl:when test=". eq 107">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario107"/>
                  </xsl:when>
                  <xsl:when test=". eq 108">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario108"/>
                  </xsl:when>
                  <xsl:when test=". eq 109">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario109"/>
                  </xsl:when>
                  <xsl:when test=". eq 110">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario110"/>
                  </xsl:when>
                  <xsl:when test=". eq 111">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario111"/>
                  </xsl:when>
                  <xsl:when test=". eq 112">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario112"/>
                  </xsl:when>
                  <xsl:when test=". eq 113">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario113"/>
                  </xsl:when>
                  <xsl:when test=". eq 114">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario114"/>
                  </xsl:when>
                  <xsl:when test=". eq 115">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario115"/>
                  </xsl:when>
                  <xsl:when test=". eq 116">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario116"/>
                  </xsl:when>
                  <xsl:when test=". eq 117">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario117"/>
                  </xsl:when>
                  <xsl:when test=". eq 118">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario118"/>
                  </xsl:when>
                  <xsl:when test=". eq 119">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario119"/>
                  </xsl:when>
                  <xsl:when test=". eq 120">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario120"/>
                  </xsl:when>
                  <xsl:when test=". eq 121">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario121"/>
                  </xsl:when>
                  <xsl:when test=". eq 122">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario122"/>
                  </xsl:when>
                  <xsl:when test=". eq 123">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario123"/>
                  </xsl:when>
                  <xsl:when test=". eq 124">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario124"/>
                  </xsl:when>
                  <xsl:when test=". eq 125">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario125"/>
                  </xsl:when>
                  <xsl:when test=". eq 126">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario126"/>
                  </xsl:when>
                  <xsl:when test=". eq 127">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario127"/>
                  </xsl:when>
                  <xsl:when test=". eq 128">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario128"/>
                  </xsl:when>
                  <xsl:when test=". eq 129">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario129"/>
                  </xsl:when>
                  <xsl:when test=". eq 130">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario130"/>
                  </xsl:when>
                  <xsl:when test=". eq 131">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario131"/>
                  </xsl:when>
                  <xsl:when test=". eq 132">
                     <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario132"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:message terminate="yes">ERROR: Unhandled scenario invocation</xsl:message>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:for-each>
         </xsl:element>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_f_l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario1</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_f_l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d185e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d185e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d185e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d185e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d185e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario1-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_f_l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e4-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_f_l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e4"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e4-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e4, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario1-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_f_l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e4"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_f_l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario2</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_f_l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d193e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d193e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d193e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d193e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d193e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario2-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_f_l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e7-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_f_l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e7"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e7-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e7, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario2-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_f_l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e7"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_f_l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario3</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_f_l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d201e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d201e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d201e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d201e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d201e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario3-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_f_l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e10-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_f_l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e10"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e10-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e10, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario3-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_f_l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e10"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_f_lc</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario4</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_f_lc</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lc.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d209e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lc.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d209e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d209e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d209e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d209e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario4-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_f_lc.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e13-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_f_lc.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e13"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e13-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e13, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario4-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_f_lc.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e13"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_f_lc-l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario5</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_f_lc-l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lc-l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d217e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lc-l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d217e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d217e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d217e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d217e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario5-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_f_lc-l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e16-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_f_lc-l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e16"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e16-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e16, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario5-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_f_lc-l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e16"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_f_lc-l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario6</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_f_lc-l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lc-l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d225e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lc-l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d225e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d225e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d225e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d225e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario6-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_f_lc-l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e19-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_f_lc-l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e19"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e19-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e19, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario6-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_f_lc-l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e19"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_f_lc-l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario7</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_f_lc-l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lc-l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d233e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lc-l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d233e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d233e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d233e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d233e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario7-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_f_lc-l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e22-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_f_lc-l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e22"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e22-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e22, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario7-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_f_lc-l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e22"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_f_lc-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario8</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_f_lc-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lc-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d241e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lc-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d241e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d241e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d241e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d241e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario8-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_f_lc-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e25-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_f_lc-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e25"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e25-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e25, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario8-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_f_lc-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e25"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_f_lc-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario9</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_f_lc-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lc-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d249e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lc-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d249e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d249e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d249e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d249e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario9-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_f_lc-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e28-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_f_lc-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e28"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e28-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e28, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario9-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_f_lc-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e28"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_f_lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario10</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_f_lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d257e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d257e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d257e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d257e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d257e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario10-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_f_lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e31-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_f_lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e31"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e31-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e31, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario10-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_f_lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e31"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_f_lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario11</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_f_lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d265e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_f_lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d265e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d265e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d265e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d265e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario11-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_f_lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e34-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_f_lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e34"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e34-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e34, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario11-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_f_lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e34"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_t_l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario12</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_t_l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d273e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d273e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d273e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d273e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d273e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario12-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_t_l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e38-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_t_l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e38"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e38-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e38, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario12-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_t_l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e38"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_t_l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario13</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_t_l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d281e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d281e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d281e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d281e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d281e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario13-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_t_l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e41-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_t_l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e41"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e41-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e41, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario13-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_t_l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e41"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_t_l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario14</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_t_l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d289e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d289e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d289e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d289e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d289e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario14-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_t_l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e44-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_t_l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e44"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e44-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e44, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario14-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_t_l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e44"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_t_lc</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario15</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_t_lc</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lc.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d297e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lc.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d297e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d297e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d297e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d297e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario15-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_t_lc.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e47-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_t_lc.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e47"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e47-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e47, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario15-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_t_lc.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e47"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario16"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_t_lc-l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario16</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_t_lc-l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lc-l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d305e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lc-l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d305e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d305e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d305e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d305e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario16-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario16-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_t_lc-l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e50-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_t_lc-l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e50"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e50-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e50, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario16-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_t_lc-l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e50"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario17"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_t_lc-l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario17</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_t_lc-l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lc-l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d313e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lc-l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d313e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d313e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d313e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d313e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario17-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario17-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_t_lc-l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e53-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_t_lc-l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e53"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e53-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e53, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario17-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_t_lc-l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e53"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario18"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_t_lc-l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario18</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_t_lc-l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lc-l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d321e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lc-l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d321e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d321e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d321e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d321e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario18-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario18-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_t_lc-l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e56-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_t_lc-l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e56"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e56-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e56, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario18-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_t_lc-l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e56"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario19"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_t_lc-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario19</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_t_lc-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lc-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d329e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lc-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d329e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d329e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d329e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d329e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario19-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario19-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_t_lc-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e59-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_t_lc-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e59"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e59-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e59, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario19-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_t_lc-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e59"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario20"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_t_lc-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario20</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_t_lc-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lc-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d337e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lc-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d337e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d337e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d337e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d337e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario20-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario20-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_t_lc-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e62-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_t_lc-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e62"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e62-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e62, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario20-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_t_lc-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e62"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario21"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_t_lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario21</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_t_lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d345e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d345e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d345e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d345e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d345e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario21-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario21-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_t_lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e65-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_t_lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e65"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e65-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e65, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario21-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_t_lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e65"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario22"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_l_t_lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario22</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_l_t_lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d353e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_l_t_lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d353e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d353e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d353e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d353e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario22-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario22-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_l_t_lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e68-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_l_t_lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e68"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e68-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e68, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario22-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_l_t_lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e68"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario23"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_f_l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario23</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_f_l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d361e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d361e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d361e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d361e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d361e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario23-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario23-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_f_l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e72-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_f_l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e72"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e72-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e72, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario23-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_f_l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e72"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario24"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_f_l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario24</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_f_l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d369e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d369e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d369e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d369e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d369e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario24-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario24-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_f_l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e75-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_f_l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e75"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e75-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e75, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario24-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_f_l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e75"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario25"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_f_l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario25</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_f_l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d377e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d377e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d377e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d377e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d377e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario25-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario25-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_f_l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e78-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_f_l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e78"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e78-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e78, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario25-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_f_l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e78"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario26"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_f_lc</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario26</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_f_lc</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lc.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d385e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lc.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d385e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d385e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d385e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d385e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario26-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario26-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_f_lc.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e81-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_f_lc.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e81"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e81-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e81, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario26-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_f_lc.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e81"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario27"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_f_lc-l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario27</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_f_lc-l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lc-l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d393e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lc-l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d393e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d393e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d393e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d393e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario27-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario27-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_f_lc-l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e84-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_f_lc-l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e84"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e84-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e84, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario27-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_f_lc-l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e84"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario28"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_f_lc-l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario28</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_f_lc-l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lc-l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d401e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lc-l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d401e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d401e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d401e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d401e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario28-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario28-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_f_lc-l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e87-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_f_lc-l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e87"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e87-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e87, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario28-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_f_lc-l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e87"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario29"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_f_lc-l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario29</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_f_lc-l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lc-l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d409e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lc-l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d409e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d409e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d409e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d409e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario29-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario29-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_f_lc-l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e90-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_f_lc-l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e90"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e90-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e90, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario29-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_f_lc-l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e90"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario30"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_f_lc-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario30</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_f_lc-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lc-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d417e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lc-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d417e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d417e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d417e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d417e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario30-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario30-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_f_lc-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e93-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_f_lc-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e93"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e93-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e93, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario30-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_f_lc-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e93"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario31"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_f_lc-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario31</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_f_lc-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lc-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d425e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lc-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d425e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d425e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d425e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d425e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario31-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario31-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_f_lc-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e96-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_f_lc-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e96"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e96-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e96, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario31-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_f_lc-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e96"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario32"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_f_lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario32</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_f_lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d433e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d433e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d433e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d433e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d433e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario32-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario32-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_f_lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e99-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_f_lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e99"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e99-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e99, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario32-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_f_lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e99"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario33"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_f_lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario33</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_f_lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d441e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_f_lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d441e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d441e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d441e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d441e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario33-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario33-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_f_lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e102-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_f_lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e102"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e102-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e102, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario33-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_f_lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e102"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario34"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_t_l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario34</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_t_l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d449e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d449e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d449e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d449e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d449e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario34-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario34-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_t_l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e106-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_t_l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e106"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e106-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e106, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario34-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_t_l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e106"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario35"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_t_l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario35</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_t_l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d457e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d457e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d457e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d457e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d457e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario35-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario35-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_t_l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e109-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_t_l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e109"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e109-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e109, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario35-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_t_l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e109"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario36"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_t_l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario36</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_t_l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d465e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d465e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d465e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d465e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d465e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario36-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario36-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_t_l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e112-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_t_l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e112"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e112-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e112, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario36-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_t_l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e112"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario37"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_t_lc</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario37</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_t_lc</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lc.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d473e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lc.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d473e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d473e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d473e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d473e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario37-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario37-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_t_lc.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e115-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_t_lc.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e115"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e115-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e115, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario37-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_t_lc.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e115"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario38"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_t_lc-l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario38</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_t_lc-l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lc-l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d481e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lc-l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d481e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d481e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d481e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d481e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario38-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario38-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_t_lc-l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e118-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_t_lc-l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e118"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e118-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e118, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario38-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_t_lc-l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e118"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario39"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_t_lc-l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario39</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_t_lc-l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lc-l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d489e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lc-l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d489e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d489e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d489e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d489e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario39-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario39-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_t_lc-l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e121-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_t_lc-l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e121"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e121-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e121, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario39-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_t_lc-l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e121"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario40"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_t_lc-l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario40</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_t_lc-l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lc-l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d497e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lc-l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d497e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d497e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d497e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d497e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario40-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario40-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_t_lc-l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e124-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_t_lc-l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e124"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e124-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e124, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario40-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_t_lc-l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e124"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario41"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_t_lc-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario41</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_t_lc-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lc-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d505e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lc-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d505e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d505e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d505e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d505e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario41-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario41-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_t_lc-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e127-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_t_lc-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e127"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e127-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e127, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario41-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_t_lc-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e127"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario42"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_t_lc-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario42</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_t_lc-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lc-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d513e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lc-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d513e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d513e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d513e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d513e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario42-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario42-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_t_lc-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e130-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_t_lc-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e130"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e130-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e130, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario42-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_t_lc-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e130"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario43"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_t_lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario43</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_t_lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d521e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d521e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d521e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d521e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d521e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario43-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario43-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_t_lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e133-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_t_lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e133"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e133-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e133, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario43-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_t_lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e133"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario44"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_p_t_lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario44</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_p_t_lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d529e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_p_t_lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d529e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d529e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d529e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d529e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario44-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario44-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_p_t_lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e136-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_p_t_lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e136"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e136-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e136, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario44-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_p_t_lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e136"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario45"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_f_l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario45</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_f_l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d537e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d537e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d537e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d537e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d537e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario45-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario45-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_f_l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e140-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_f_l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e140"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e140-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e140, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario45-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_f_l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e140"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario46"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_f_l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario46</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_f_l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d545e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d545e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d545e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d545e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d545e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario46-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario46-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_f_l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e143-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_f_l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e143"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e143-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e143, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario46-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_f_l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e143"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario47"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_f_l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario47</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_f_l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d553e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d553e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d553e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d553e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d553e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario47-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario47-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_f_l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e146-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_f_l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e146"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e146-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e146, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario47-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_f_l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e146"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario48"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_f_lc</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario48</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_f_lc</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lc.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d561e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lc.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d561e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d561e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d561e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d561e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario48-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario48-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_f_lc.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e149-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_f_lc.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e149"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e149-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e149, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario48-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_f_lc.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e149"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario49"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_f_lc-l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario49</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_f_lc-l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lc-l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d569e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lc-l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d569e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d569e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d569e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d569e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario49-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario49-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_f_lc-l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e152-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_f_lc-l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e152"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e152-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e152, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario49-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_f_lc-l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e152"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario50"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_f_lc-l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario50</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_f_lc-l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lc-l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d577e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lc-l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d577e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d577e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d577e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d577e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario50-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario50-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_f_lc-l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e155-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_f_lc-l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e155"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e155-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e155, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario50-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_f_lc-l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e155"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario51"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_f_lc-l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario51</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_f_lc-l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lc-l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d585e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lc-l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d585e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d585e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d585e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d585e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario51-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario51-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_f_lc-l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e158-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_f_lc-l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e158"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e158-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e158, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario51-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_f_lc-l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e158"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario52"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_f_lc-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario52</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_f_lc-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lc-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d593e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lc-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d593e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d593e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d593e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d593e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario52-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario52-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_f_lc-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e161-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_f_lc-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e161"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e161-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e161, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario52-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_f_lc-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e161"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario53"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_f_lc-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario53</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_f_lc-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lc-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d601e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lc-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d601e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d601e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d601e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d601e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario53-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario53-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_f_lc-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e164-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_f_lc-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e164"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e164-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e164, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario53-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_f_lc-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e164"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario54"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_f_lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario54</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_f_lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d609e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d609e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d609e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d609e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d609e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario54-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario54-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_f_lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e167-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_f_lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e167"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e167-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e167, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario54-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_f_lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e167"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario55"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_f_lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario55</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_f_lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d617e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_f_lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d617e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d617e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d617e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d617e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario55-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario55-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_f_lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e170-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_f_lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e170"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e170-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e170, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario55-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_f_lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e170"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario56"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_t_l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario56</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_t_l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d625e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d625e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d625e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d625e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d625e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario56-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario56-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_t_l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e174-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_t_l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e174"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e174-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e174, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario56-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_t_l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e174"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario57"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_t_l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario57</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_t_l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d633e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d633e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d633e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d633e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d633e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario57-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario57-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_t_l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e177-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_t_l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e177"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e177-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e177, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario57-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_t_l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e177"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario58"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_t_l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario58</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_t_l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d641e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d641e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d641e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d641e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d641e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario58-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario58-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_t_l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e180-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_t_l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e180"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e180-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e180, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario58-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_t_l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e180"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario59"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_t_lc</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario59</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_t_lc</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lc.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d649e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lc.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d649e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d649e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d649e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d649e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario59-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario59-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_t_lc.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e183-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_t_lc.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e183"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e183-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e183, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario59-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_t_lc.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e183"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario60"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_t_lc-l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario60</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_t_lc-l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lc-l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d657e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lc-l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d657e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d657e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d657e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d657e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario60-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario60-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_t_lc-l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e186-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_t_lc-l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e186"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e186-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e186, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario60-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_t_lc-l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e186"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario61"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_t_lc-l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario61</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_t_lc-l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lc-l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d665e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lc-l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d665e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d665e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d665e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d665e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario61-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario61-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_t_lc-l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e189-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_t_lc-l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e189"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e189-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e189, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario61-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_t_lc-l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e189"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario62"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_t_lc-l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario62</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_t_lc-l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lc-l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d673e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lc-l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d673e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d673e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d673e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d673e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario62-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario62-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_t_lc-l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e192-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_t_lc-l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e192"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e192-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e192, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario62-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_t_lc-l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e192"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario63"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_t_lc-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario63</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_t_lc-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lc-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d681e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lc-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d681e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d681e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d681e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d681e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario63-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario63-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_t_lc-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e195-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_t_lc-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e195"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e195-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e195, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario63-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_t_lc-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e195"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario64"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_t_lc-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario64</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_t_lc-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lc-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d689e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lc-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d689e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d689e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d689e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d689e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario64-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario64-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_t_lc-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e198-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_t_lc-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e198"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e198-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e198, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario64-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_t_lc-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e198"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario65"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_t_lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario65</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_t_lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d697e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d697e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d697e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d697e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d697e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario65-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario65-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_t_lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e201-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_t_lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e201"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e201-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e201, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario65-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_t_lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e201"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario66"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming programlistingco.001_r_t_lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario66</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming programlistingco.001_r_t_lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d705e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/programlistingco.001_r_t_lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d705e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d705e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d705e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d705e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario66-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario66-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect programlistingco.001_r_t_lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e204-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/programlistingco.001_r_t_lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e204"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e204-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e204, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario66-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect programlistingco.001_r_t_lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e204"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario67"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_f_l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario67</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_f_l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d713e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d713e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d713e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d713e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d713e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario67-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario67-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_f_l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e208-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_f_l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e208"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e208-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e208, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario67-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_f_l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e208"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario68"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_f_l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario68</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_f_l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d721e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d721e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d721e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d721e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d721e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario68-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario68-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_f_l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e211-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_f_l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e211"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e211-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e211, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario68-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_f_l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e211"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario69"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_f_l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario69</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_f_l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d729e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d729e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d729e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d729e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d729e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario69-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario69-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_f_l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e214-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_f_l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e214"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e214-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e214, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario69-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_f_l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e214"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario70"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_f_lc</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario70</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_f_lc</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lc.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d737e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lc.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d737e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d737e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d737e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d737e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario70-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario70-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_f_lc.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e217-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_f_lc.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e217"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e217-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e217, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario70-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_f_lc.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e217"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario71"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_f_lc-l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario71</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_f_lc-l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lc-l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d745e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lc-l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d745e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d745e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d745e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d745e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario71-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario71-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_f_lc-l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e220-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_f_lc-l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e220"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e220-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e220, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario71-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_f_lc-l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e220"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario72"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_f_lc-l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario72</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_f_lc-l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lc-l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d753e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lc-l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d753e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d753e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d753e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d753e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario72-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario72-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_f_lc-l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e223-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_f_lc-l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e223"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e223-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e223, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario72-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_f_lc-l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e223"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario73"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_f_lc-l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario73</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_f_lc-l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lc-l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d761e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lc-l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d761e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d761e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d761e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d761e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario73-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario73-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_f_lc-l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e226-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_f_lc-l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e226"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e226-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e226, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario73-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_f_lc-l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e226"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario74"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_f_lc-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario74</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_f_lc-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lc-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d769e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lc-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d769e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d769e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d769e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d769e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario74-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario74-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_f_lc-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e229-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_f_lc-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e229"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e229-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e229, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario74-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_f_lc-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e229"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario75"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_f_lc-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario75</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_f_lc-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lc-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d777e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lc-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d777e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d777e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d777e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d777e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario75-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario75-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_f_lc-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e232-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_f_lc-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e232"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e232-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e232, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario75-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_f_lc-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e232"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario76"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_f_lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario76</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_f_lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d785e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d785e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d785e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d785e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d785e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario76-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario76-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_f_lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e235-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_f_lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e235"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e235-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e235, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario76-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_f_lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e235"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario77"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_f_lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario77</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_f_lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d793e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_f_lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d793e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d793e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d793e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d793e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario77-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario77-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_f_lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e238-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_f_lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e238"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e238-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e238, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario77-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_f_lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e238"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario78"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_t_l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario78</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_t_l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d801e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d801e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d801e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d801e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d801e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario78-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario78-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_t_l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e242-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_t_l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e242"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e242-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e242, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario78-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_t_l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e242"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario79"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_t_l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario79</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_t_l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d809e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d809e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d809e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d809e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d809e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario79-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario79-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_t_l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e245-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_t_l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e245"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e245-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e245, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario79-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_t_l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e245"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario80"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_t_l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario80</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_t_l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d817e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d817e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d817e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d817e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d817e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario80-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario80-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_t_l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e248-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_t_l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e248"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e248-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e248, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario80-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_t_l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e248"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario81"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_t_lc</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario81</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_t_lc</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lc.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d825e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lc.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d825e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d825e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d825e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d825e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario81-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario81-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_t_lc.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e251-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_t_lc.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e251"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e251-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e251, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario81-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_t_lc.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e251"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario82"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_t_lc-l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario82</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_t_lc-l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lc-l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d833e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lc-l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d833e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d833e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d833e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d833e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario82-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario82-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_t_lc-l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e254-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_t_lc-l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e254"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e254-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e254, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario82-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_t_lc-l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e254"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario83"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_t_lc-l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario83</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_t_lc-l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lc-l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d841e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lc-l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d841e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d841e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d841e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d841e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario83-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario83-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_t_lc-l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e257-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_t_lc-l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e257"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e257-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e257, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario83-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_t_lc-l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e257"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario84"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_t_lc-l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario84</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_t_lc-l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lc-l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d849e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lc-l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d849e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d849e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d849e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d849e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario84-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario84-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_t_lc-l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e260-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_t_lc-l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e260"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e260-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e260, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario84-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_t_lc-l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e260"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario85"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_t_lc-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario85</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_t_lc-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lc-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d857e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lc-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d857e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d857e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d857e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d857e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario85-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario85-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_t_lc-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e263-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_t_lc-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e263"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e263-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e263, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario85-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_t_lc-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e263"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario86"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_t_lc-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario86</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_t_lc-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lc-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d865e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lc-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d865e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d865e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d865e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d865e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario86-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario86-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_t_lc-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e266-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_t_lc-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e266"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e266-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e266, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario86-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_t_lc-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e266"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario87"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_t_lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario87</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_t_lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d873e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d873e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d873e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d873e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d873e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario87-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario87-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_t_lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e269-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_t_lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e269"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e269-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e269, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario87-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_t_lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e269"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario88"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_l_t_lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario88</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_l_t_lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d881e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_l_t_lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d881e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d881e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d881e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d881e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario88-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario88-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_l_t_lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e272-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_l_t_lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e272"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e272-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e272, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario88-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_l_t_lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e272"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario89"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_f_l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario89</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_f_l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d889e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d889e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d889e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d889e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d889e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario89-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario89-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_f_l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e276-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_f_l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e276"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e276-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e276, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario89-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_f_l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e276"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario90"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_f_l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario90</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_f_l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d897e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d897e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d897e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d897e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d897e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario90-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario90-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_f_l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e279-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_f_l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e279"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e279-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e279, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario90-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_f_l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e279"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario91"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_f_l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario91</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_f_l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d905e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d905e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d905e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d905e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d905e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario91-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario91-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_f_l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e282-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_f_l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e282"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e282-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e282, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario91-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_f_l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e282"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario92"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_f_lc</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario92</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_f_lc</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lc.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d913e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lc.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d913e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d913e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d913e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d913e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario92-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario92-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_f_lc.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e285-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_f_lc.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e285"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e285-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e285, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario92-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_f_lc.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e285"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario93"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_f_lc-l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario93</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_f_lc-l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lc-l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d921e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lc-l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d921e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d921e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d921e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d921e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario93-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario93-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_f_lc-l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e288-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_f_lc-l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e288"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e288-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e288, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario93-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_f_lc-l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e288"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario94"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_f_lc-l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario94</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_f_lc-l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lc-l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d929e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lc-l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d929e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d929e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d929e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d929e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario94-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario94-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_f_lc-l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e291-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_f_lc-l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e291"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e291-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e291, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario94-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_f_lc-l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e291"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario95"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_f_lc-l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario95</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_f_lc-l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lc-l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d937e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lc-l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d937e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d937e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d937e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d937e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario95-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario95-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_f_lc-l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e294-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_f_lc-l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e294"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e294-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e294, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario95-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_f_lc-l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e294"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario96"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_f_lc-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario96</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_f_lc-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lc-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d945e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lc-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d945e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d945e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d945e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d945e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario96-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario96-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_f_lc-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e297-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_f_lc-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e297"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e297-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e297, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario96-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_f_lc-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e297"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario97"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_f_lc-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario97</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_f_lc-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lc-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d953e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lc-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d953e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d953e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d953e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d953e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario97-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario97-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_f_lc-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e300-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_f_lc-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e300"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e300-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e300, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario97-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_f_lc-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e300"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario98"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_f_lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario98</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_f_lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d961e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d961e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d961e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d961e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d961e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario98-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario98-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_f_lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e303-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_f_lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e303"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e303-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e303, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario98-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_f_lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e303"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario99"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_f_lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario99</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_f_lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d969e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_f_lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d969e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d969e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d969e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d969e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario99-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario99-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_f_lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e306-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_f_lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e306"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e306-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e306, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario99-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_f_lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e306"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario100"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_t_l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario100</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_t_l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d977e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d977e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d977e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d977e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d977e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario100-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario100-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_t_l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e310-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_t_l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e310"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e310-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e310, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario100-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_t_l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e310"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario101"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_t_l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario101</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_t_l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d985e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d985e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d985e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d985e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d985e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario101-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario101-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_t_l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e313-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_t_l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e313"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e313-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e313, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario101-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_t_l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e313"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario102"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_t_l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario102</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_t_l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d993e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d993e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d993e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d993e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d993e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario102-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario102-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_t_l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e316-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_t_l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e316"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e316-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e316, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario102-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_t_l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e316"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario103"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_t_lc</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario103</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_t_lc</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lc.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1001e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lc.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1001e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1001e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1001e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1001e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario103-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario103-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_t_lc.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e319-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_t_lc.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e319"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e319-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e319, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario103-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_t_lc.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e319"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario104"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_t_lc-l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario104</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_t_lc-l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lc-l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1009e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lc-l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1009e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1009e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1009e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1009e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario104-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario104-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_t_lc-l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e322-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_t_lc-l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e322"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e322-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e322, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario104-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_t_lc-l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e322"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario105"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_t_lc-l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario105</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_t_lc-l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lc-l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1017e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lc-l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1017e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1017e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1017e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1017e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario105-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario105-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_t_lc-l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e325-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_t_lc-l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e325"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e325-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e325, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario105-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_t_lc-l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e325"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario106"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_t_lc-l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario106</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_t_lc-l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lc-l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1025e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lc-l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1025e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1025e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1025e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1025e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario106-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario106-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_t_lc-l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e328-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_t_lc-l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e328"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e328-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e328, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario106-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_t_lc-l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e328"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario107"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_t_lc-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario107</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_t_lc-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lc-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1033e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lc-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1033e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1033e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1033e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1033e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario107-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario107-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_t_lc-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e331-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_t_lc-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e331"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e331-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e331, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario107-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_t_lc-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e331"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario108"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_t_lc-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario108</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_t_lc-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lc-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1041e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lc-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1041e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1041e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1041e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1041e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario108-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario108-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_t_lc-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e334-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_t_lc-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e334"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e334-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e334, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario108-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_t_lc-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e334"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario109"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_t_lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario109</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_t_lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1049e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1049e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1049e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1049e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1049e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario109-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario109-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_t_lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e337-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_t_lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e337"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e337-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e337, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario109-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_t_lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e337"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario110"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_p_t_lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario110</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_p_t_lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1057e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_p_t_lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1057e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1057e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1057e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1057e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario110-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario110-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_p_t_lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e340-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_p_t_lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e340"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e340-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e340, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario110-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_p_t_lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e340"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario111"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_f_l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario111</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_f_l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1065e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1065e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1065e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1065e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1065e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario111-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario111-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_f_l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e344-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_f_l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e344"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e344-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e344, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario111-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_f_l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e344"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario112"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_f_l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario112</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_f_l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1073e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1073e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1073e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1073e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1073e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario112-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario112-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_f_l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e347-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_f_l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e347"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e347-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e347, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario112-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_f_l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e347"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario113"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_f_l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario113</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_f_l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1081e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1081e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1081e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1081e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1081e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario113-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario113-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_f_l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e350-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_f_l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e350"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e350-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e350, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario113-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_f_l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e350"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario114"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_f_lc</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario114</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_f_lc</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lc.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1089e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lc.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1089e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1089e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1089e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1089e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario114-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario114-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_f_lc.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e353-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_f_lc.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e353"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e353-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e353, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario114-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_f_lc.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e353"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario115"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_f_lc-l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario115</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_f_lc-l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lc-l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1097e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lc-l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1097e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1097e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1097e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1097e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario115-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario115-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_f_lc-l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e356-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_f_lc-l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e356"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e356-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e356, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario115-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_f_lc-l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e356"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario116"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_f_lc-l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario116</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_f_lc-l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lc-l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1105e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lc-l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1105e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1105e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1105e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1105e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario116-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario116-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_f_lc-l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e359-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_f_lc-l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e359"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e359-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e359, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario116-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_f_lc-l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e359"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario117"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_f_lc-l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario117</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_f_lc-l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lc-l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1113e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lc-l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1113e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1113e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1113e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1113e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario117-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario117-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_f_lc-l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e362-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_f_lc-l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e362"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e362-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e362, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario117-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_f_lc-l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e362"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario118"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_f_lc-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario118</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_f_lc-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lc-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1121e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lc-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1121e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1121e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1121e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1121e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario118-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario118-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_f_lc-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e365-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_f_lc-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e365"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e365-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e365, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario118-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_f_lc-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e365"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario119"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_f_lc-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario119</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_f_lc-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lc-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1129e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lc-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1129e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1129e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1129e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1129e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario119-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario119-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_f_lc-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e368-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_f_lc-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e368"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e368-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e368, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario119-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_f_lc-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e368"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario120"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_f_lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario120</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_f_lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1137e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1137e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1137e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1137e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1137e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario120-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario120-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_f_lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e371-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_f_lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e371"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e371-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e371, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario120-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_f_lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e371"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario121"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_f_lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario121</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_f_lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1145e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_f_lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1145e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1145e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1145e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1145e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario121-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario121-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_f_lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e374-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_f_lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e374"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e374-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e374, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario121-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_f_lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e374"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario122"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_t_l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario122</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_t_l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1153e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1153e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1153e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1153e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1153e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario122-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario122-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_t_l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e378-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_t_l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e378"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e378-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e378, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario122-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_t_l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e378"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario123"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_t_l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario123</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_t_l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1161e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1161e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1161e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1161e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1161e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario123-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario123-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_t_l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e381-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_t_l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e381"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e381-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e381, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario123-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_t_l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e381"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario124"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_t_l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario124</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_t_l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1169e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1169e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1169e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1169e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1169e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario124-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario124-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_t_l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e384-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_t_l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e384"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e384-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e384, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario124-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_t_l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e384"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario125"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_t_lc</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario125</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_t_lc</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lc.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1177e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lc.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1177e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1177e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1177e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1177e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario125-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario125-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_t_lc.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e387-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_t_lc.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e387"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e387-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e387, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario125-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_t_lc.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e387"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario126"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_t_lc-l</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario126</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_t_lc-l</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lc-l.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1185e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lc-l.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1185e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1185e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1185e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1185e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario126-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario126-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_t_lc-l.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e390-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_t_lc-l.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e390"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e390-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e390, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario126-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_t_lc-l.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e390"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario127"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_t_lc-l-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario127</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_t_lc-l-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lc-l-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1193e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lc-l-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1193e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1193e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1193e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1193e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario127-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario127-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_t_lc-l-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e393-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_t_lc-l-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e393"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e393-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e393, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario127-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_t_lc-l-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e393"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario128"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_t_lc-l-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario128</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_t_lc-l-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lc-l-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1201e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lc-l-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1201e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1201e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1201e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1201e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario128-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario128-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_t_lc-l-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e396-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_t_lc-l-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e396"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e396-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e396, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario128-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_t_lc-l-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e396"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario129"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_t_lc-lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario129</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_t_lc-lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lc-lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1209e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lc-lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1209e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1209e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1209e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1209e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario129-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario129-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_t_lc-lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e399-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_t_lc-lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e399"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e399-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e399, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario129-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_t_lc-lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e399"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario130"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_t_lc-lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario130</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_t_lc-lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lc-lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1217e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lc-lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1217e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1217e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1217e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1217e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario130-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario130-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_t_lc-lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e402-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_t_lc-lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e402"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e402-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e402, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario130-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_t_lc-lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e402"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario131"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_t_lra</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario131</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_t_lra</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lra.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1225e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lra.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1225e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1225e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1225e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1225e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario131-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario131-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_t_lra.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e405-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_t_lra.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e405"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e405-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e405, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario131-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_t_lra.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e405"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario132"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}scenario)">
      <xsl:context-item use="absent"/>
      <xsl:message>When transforming screenco.001_r_t_lrf</xsl:message>
      <xsl:element name="scenario" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario132</xsl:attribute>
         <xsl:attribute name="xspec" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/xspec/callouts.xspec</xsl:attribute>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>When transforming screenco.001_r_t_lrf</xsl:text>
         </xsl:element>
         <xsl:element name="input-wrap" namespace="">
            <xsl:element name="x:context" namespace="http://www.jenitennison.com/xslt/xspec">
               <xsl:attribute name="href" namespace="">file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lrf.xml</xsl:attribute>
            </xsl:element>
         </xsl:element>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1233e0-doc"
                        as="document-node()"
                        select="doc('file:/home/runner/work/xslTNG/xslTNG/build/preprocessed/screenco.001_r_t_lrf.xml')"/>
         <xsl:variable name="Q{urn:x-xspec:compile:impl}context-d1233e0"
                        select="$Q{urn:x-xspec:compile:impl}context-d1233e0-doc ! ( . )"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}context"
                        as="item()*"
                        select="$Q{urn:x-xspec:compile:impl}context-d1233e0"/>
         <xsl:variable name="Q{http://www.jenitennison.com/xslt/xspec}result" as="item()*">
            <xsl:apply-templates select="$Q{urn:x-xspec:compile:impl}context-d1233e0"/>
         </xsl:variable>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
            <xsl:with-param name="report-name" select="'result'"/>
         </xsl:call-template>
         <!-- invoke each compiled x:expect -->
         <xsl:call-template name="Q{http://www.jenitennison.com/xslt/xspec}scenario132-expect1">
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}context"/>
            <xsl:with-param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                             select="$Q{http://www.jenitennison.com/xslt/xspec}result"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template name="Q{http://www.jenitennison.com/xslt/xspec}scenario132-expect1"
                  as="element(Q{http://www.jenitennison.com/xslt/xspec}test)">
      <xsl:context-item use="absent"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}context"
                  as="item()*"
                  required="yes"/>
      <xsl:param name="Q{http://www.jenitennison.com/xslt/xspec}result"
                  as="item()*"
                  required="yes"/>
      <xsl:message>expect screenco.001_r_t_lrf.expected</xsl:message>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e408-doc"
                     as="document-node()"
                     select="doc('file:/home/runner/work/xslTNG/xslTNG/src/test/resources/expected/screenco.001_r_t_lrf.html')"/>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}expect-d183e408"
                     select="$Q{urn:x-xspec:compile:impl}expect-d183e408-doc ! ( . )"><!--expected result--></xsl:variable>
      <xsl:variable name="Q{urn:x-xspec:compile:impl}successful"
                     as="Q{http://www.w3.org/2001/XMLSchema}boolean"
                     select="Q{urn:x-xspec:common:deep-equal}deep-equal($Q{urn:x-xspec:compile:impl}expect-d183e408, $Q{http://www.jenitennison.com/xslt/xspec}result, '')"/>
      <xsl:if test="not($Q{urn:x-xspec:compile:impl}successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <xsl:element name="test" namespace="http://www.jenitennison.com/xslt/xspec">
         <xsl:attribute name="id" namespace="">scenario132-expect1</xsl:attribute>
         <xsl:attribute name="successful"
                         namespace=""
                         select="$Q{urn:x-xspec:compile:impl}successful"/>
         <xsl:element name="label" namespace="http://www.jenitennison.com/xslt/xspec">
            <xsl:text>expect screenco.001_r_t_lrf.expected</xsl:text>
         </xsl:element>
         <xsl:call-template name="Q{urn:x-xspec:common:report-sequence}report-sequence">
            <xsl:with-param name="sequence" select="$Q{urn:x-xspec:compile:impl}expect-d183e408"/>
            <xsl:with-param name="report-name" select="'expect'"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
</xsl:stylesheet>
