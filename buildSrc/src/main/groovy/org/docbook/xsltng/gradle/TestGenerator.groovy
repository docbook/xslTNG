package org.docbook.xsltng.gradle

import java.util.regex.Pattern

import org.gradle.api.GradleException
import org.gradle.api.Project
import org.gradle.api.Task
import org.gradle.api.tasks.TaskProvider
import org.gradle.api.tasks.Exec

import com.nwalsh.gradle.saxon.SaxonXsltTask
import com.nwalsh.gradle.relaxng.validate.RelaxNGValidateTask

class TestGenerator {
  private final Project project
  private final TestEnvironments testEnvironments
  private final TestConfigurations testConfigurations
  private final TestCases testCases
  private final String projectDir
  private final String buildDir

  private final def configRegexList
  private final def generatedConfigurations

  public TestGenerator(Project project) {
    this.project = project
    testEnvironments = new TestEnvironments(project)
    testConfigurations = new TestConfigurations(testEnvironments)
    testCases = new TestCases(project, new ValidationTasks(project))
    projectDir = project.projectDir
    buildDir = project.buildDir

    testEnvironments.create('default')
      .withParameters([
          'mediaobject-output-base-uri': 'media/',
          'mediaobject-output-paths': 'false',
          'dynamic-profiles': 'true'])

    testEnvironments.create('numbered-from')
      .withParameters([
          'lists-of-equations': 'true',
          'lists-of-procedures': 'true'])

    testEnvironments.create('inherit-from')
      .withParameters([
          'lists-of-equations': 'true',
          'lists-of-procedures': 'true'])

    testEnvironments.create('unwrap')
      .withParameters([
          'unwrap-paragraphs': 'true'])

    testEnvironments.create('online')
      .withParameters([
          'profile-outputformat': 'online'])

    testEnvironments.create('chunk')
      .withParameters([
          'chunk': 'index.html',
          'chunk-output-base-uri': "${buildDir}/actual/"])

    testEnvironments.create('chunkfit')
      .withParameters([
          'annotation-style': 'javascript',
          'profile-outputformat': 'online',
          'persistent-toc': 'true'])

    testEnvironments.create('verbatim')
      .withParameters([
          'everyNth': 5,
          'minlines': 5,
          'first': 'true'])

    testEnvironments.create('callouts')
      .withParameters([
          'message-level': 0])

    testEnvironments.create('colors')
      .withParameters([
          'show-remarks': 'true',
          'theme-picker': 'true',
          'persistent-toc': 'true'])

    testEnvironments.create('local')
      .withParameters([
          'local-conventions': "${projectDir}/src/test/resources/local.xsl",
          'relax-ng-grammar': "${projectDir}/src/test/resources/docbook.rng"])

    testEnvironments.create('ptoc')
      .withParameters([
          'persistent-toc': 'true'])

    testEnvironments.create('olinkdb')
      .withOlinkdb()

    testEnvironments.create('olink')
      .withParameters([
          'annotation-style': 'javascript',
          'profile-outputformat': 'online',
          'olink-databases':
             ["${buildDir}/actual/guide.olinkdb",
              "${buildDir}/actual/fit.001.olinkdb",
              "${buildDir}/actual/fit.002.olinkdb",
              "${projectDir}/src/website/resources/olinkdb/website.olinkdb"].join(",")])

    testEnvironments.create('transclude')
      .withParameters([
          'docbook-transclusion': 'true'])

    testEnvironments.create('a11y')
      .withParameters([
          'mediaobject-accessibility': "summary details a11y-metadata"])

    testConfigurations.create('default')
      .withEnvironments(['default'])

    testConfigurations.create('callouts')
      .withEnvironments(['verbatim', 'callouts'])

    testConfigurations.create('fit')
      .withEnvironments(['online', 'chunkfit', 'olinkdb'])
      .withExtraDependencies(['guide.olinkdb'])

    testConfigurations.create('olink')
      .withEnvironments(['online', 'olinkdb', 'olink'])
      .withExtraDependencies(['guide.olinkdb'])

    testConfigurations.create('unwrapped').withEnvironments(['unwrap'])
    testConfigurations.create('transclude').withEnvironments(['transclude'])
    testConfigurations.create('local').withEnvironments(['local'])
    testConfigurations.create('colors').withEnvironments(['colors'])
    testConfigurations.create('ptoc').withEnvironments(['ptoc'])
    testConfigurations.create('a11y').withEnvironments(['a11y'])

    def regexList = []
    ['fit\\.': 'fit',
     'olink\\.001': 'olink',
     'transclusion\\.': 'transclude',
     'local\\.': 'local',
     'colors\\.': 'colors',
     'ptoc\\.': 'ptoc',
     'mediaobject\\.005': 'a11y',
    ].each { entry ->
      Pattern pat = ~"^.*${entry.key}.*\$"
      regexList.add(new Tuple(pat, testConfigurations.find(entry.value)))
    }
    regexList.add(new Tuple(~'^.*$', testConfigurations.find('default')))
    configRegexList = regexList.asImmutable()

    generatedConfigurations = [
      'para.002': ['unwrapped-para.002':'unwrapped'],
      'para.003': ['unwrapped-para.003':'unwrapped']
    ]

    configureCalloutTests()
    configureNumberedFromTests()
    configureInheritedFromTests()
  }

  void configure(File xml) {
    String fn = xml.toString().replace('\\', '/').split('/')[-1]
    String base = fn.replaceFirst('\\.xml$', '')

    TestConfiguration config = null
    configRegexList.each { tuple ->
      if (config == null) {
        Pattern pat = tuple.get(0)
        if (pat.matcher(base).matches()) {
          config = tuple.get(1)
        }
      }
    }

    TestCase tcase = testCases.create(base, xml, config)
    if (generatedConfigurations.containsKey(base)) {
      generatedConfigurations[base].each { entry ->
        tcase = testCases.create(entry.key, xml, testConfigurations.find(entry.value))
      }
    }
  }

  private void configureCalloutTests() {
    ["raw", "plain", "lines"].each { style ->
      ["true", "false"].each { numbered ->
        ["linecolumn", "lines", "lineranges-all", "lineranges-first",
         "linecolumn,lines",
         "linecolumn,lineranges-all",
         "linecolumn,lineranges-first",
         "linecolumn,lines,lineranges-all",
         "linecolumn,lines,lineranges-first",
         "lines,lineranges-all",
         "lines,lineranges-first"].each { highlight ->
          def S = style.substring(0, 1).toLowerCase() + "_"
          def N = numbered.substring(0, 1).toLowerCase() + "_"
          def H = ""

          if (highlight == "linecolumn")                             H = "lc"
          else if (highlight == "lines")                             H = "l"
          else if (highlight == "lineranges-all")                    H = "lra"
          else if (highlight == "lineranges-first")                  H = "lrf"
          else if (highlight == "linecolumn,lines")                  H = "lc-l"
          else if (highlight == "linecolumn,lineranges-all")         H = "lc-lra"
          else if (highlight == "linecolumn,lineranges-first")       H = "lc-lrf"
          else if (highlight == "linecolumn,lines,lineranges-all")   H = "lc-l-lra"
          else if (highlight == "linecolumn,lines,lineranges-first") H = "lc-l-lrf"
          else if (highlight == "lines,lineranges-all")              H = "l-lra"
          else if (highlight == "lines,lineranges-first")            H = "l-lrf"
          else H = "X"

          TestConfiguration config = testConfigurations.find('callouts')
          ["programlistingco.001", "screenco.001"].each { source ->
            File input = new File("${projectDir}/src/test/resources/xml/${source}.xml")
            TestCase tcase = testCases.create("${source}_${S}${N}${H}", input, config)
              .withPreprocessor("${projectDir}/tools/generate-co.xsl",
                                [ "style": style,
                                 "highlight": highlight,
                                 "numbered": numbered
                ])
          }
        }
      }
    }
  }

  void configureNumberedFromTests() {
    def numbering = [
      'chapters': ['root', 'set', 'book', 'division'],
      'parts': ['root', 'set', 'book'],
      'sections': ['root', 'set', 'book', 'division', 'component'],
      'formal-objects': ['root', 'set', 'book', 'division', 'component', 'section']
    ]

    numbering.each { entry ->
      entry.value.each { from ->
        String cnf = "${entry.key}-numbered-from-${from}"

        def sources = []
        def params = [:]
        if (entry.key == "chapters") {
          params['components-number-from'] = from
          sources.add("chapters")
        } else if (entry.key == "parts") {
          params['divisions-number-from'] = from
          sources.add("parts")
        } else if (entry.key == "sections") {
          params['sections-number-from'] = from
          sources.add("sections")
        } else if (entry.key == "formal-objects") {
          params['formal-objects-number-from'] = from
          params['lists-of-equations'] = 'true'
          params['lists-of-procedures'] = 'true'
          sources.add("figures")
          sources.add("formal-objects")
        }

        testEnvironments.create(cnf)
          .withParameters(params)

        TestConfiguration config = testConfigurations.create(cnf)
          .withEnvironments([cnf])
          .withXSpecDriver("${buildDir}/xspec-xslt/alt-xspec-driver.xsl")
          .withStylesheet("${buildDir}/xspec-xslt/alt-docbook.xsl")

        sources.each { fn ->
          File input = new File("${projectDir}/src/test/resources/xml/${fn}-numbered-from.xml")
          TestCase tcase = testCases.create("${fn}-numbered-from-${from}", input, config)
        }
      }
    }
  }

  void configureInheritedFromTests() {
    def numbering = [
      'chapters': ['set', 'book', 'division',
                   'set-book', 'set-book-division', 'book-division', 'set-division'],
      'parts': ['set', 'book', 'set-book'],
      'sections': ['set', 'book', 'division', 'component', 'section',
                   'division-component-section', 'book-division-component-section',
                   'set-book-division-component', 'set-book-division-component-section'],
      'formal-objects': ['set', 'book', 'division', 'component', 'section',
                         'component-section', 'division-component',
                         'division-component-section',
                         'book-division-component-section', 'set-book-division-component',
                         'set-book-division-component-section']
    ]

    numbering.each { entry ->
      entry.value.each { from ->
        String cnf = "${entry.key}-inherit-from-${from}"

        def sources = []
        def params = [:]
        if (entry.key == "chapters") {
          params['sets-number-from'] = 'root'
          params['components-inherit-from'] = from.replaceAll('-', ' ')
          sources.add('chapters')
        } else if (entry.key == "parts") {
          params['divisions-inherit-from'] = from.replaceAll('-', ' ')
          sources.add('parts')
        } else if (entry.key == "sections") {
          params['sections-inherit-from'] = from.replaceAll('-', ' ')
          if (from.contains('division-')) {
            params['components-inherit-from'] = 'division'
            if (from.contains('-division-')) {
              params['components-inherit-from'] =
                from.replace('-division-', '-').replaceAll('-', ' ')
            }
          }
          sources.add('sections')
        } else if (entry.key == "formal-objects") {
          params['formal-objects-inherit-from'] = from.replaceAll('-', ' ')
          if (from.contains('division-')) {
            params['components-inherit-from'] = 'division'
            if (from.contains('-division-')) {
              params['components-inherit-from'] =
                from.replace('-division-', '-').replaceAll('-', ' ')
            }
          }
          params['lists-of-equations'] = 'true'
          params['lists-of-procedures'] = 'true'
          sources.add('figures')
          sources.add('formal-objects')
        }

        testEnvironments.create(cnf)
          .withParameters(params)

        TestConfiguration config = testConfigurations.create(cnf)
          .withEnvironments([cnf])
          .withXSpecDriver("${buildDir}/xspec-xslt/alt-xspec-driver.xsl")
          .withStylesheet("${buildDir}/xspec-xslt/alt-docbook.xsl")

        sources.each { fn ->
          File input = new File("${projectDir}/src/test/resources/xml/${fn}-numbered-from.xml")
          TestCase tcase = testCases.create("${fn}-inherit-from-${from}", input, config)
        }
      }
    }
  }

  void createTasks() {
    testCases.createTasks()
    testConfigurations.createTasks()
  }
}
