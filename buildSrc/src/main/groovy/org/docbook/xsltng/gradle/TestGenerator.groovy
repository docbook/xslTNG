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
    configureMediaObjectTests()
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

  void configureMediaObjectTests() {
    def all_mo_tests = project.tasks.register("all_mo_tests") {
      // Just somewhere to hang dependencies
    }

    ["1", "2"].each { mo ->
      project.tasks.register("mo_${mo}_test_1", SaxonXsltTask) {
        // Single output HTML file, media all in the same relative locations
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-1"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 1"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-1"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-1"
            from "${projectDir}/src/test/resources/xml/mo-${mo}"
            include "**/*"
            exclude "**/*.xml"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-1"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        output "${buildDir}/actual/mo-${mo}-1/index.html"
        args(['-init:org.docbook.xsltng.extensions.Register'])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-1"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_1")
      }

      project.tasks.register("mo_${mo}_test_2", SaxonXsltTask) {
        // Single output HTML file, media all in a common directory
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-2"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 2"
        
        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-2"
        }

        doFirst {
          // N.B. These copy commands are a bit redundant because they
          // have to work for all of the input layouts
          project.copy {
            into "${buildDir}/actual/mo-${mo}-2/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}"
            include "*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-2/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/body"
            include "*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-2/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/front"
            include "*.mp4"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-2/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-2"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        output "${buildDir}/actual/mo-${mo}-2/index.html"
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "mediaobject-output-base-uri": "media/",
          "mediaobject-output-paths": "false"
        ])
        
        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-2"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_2")
      }

      project.tasks.register("mo_${mo}_test_3", SaxonXsltTask) {
        // Chunked output HTML, media all in the same relative locations
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-3"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 3"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-3"
        }

        doFirst {
          // N.B. These copy commands are a bit redundant because they
          // have to work for all of the input layouts
          project.copy {
            into "${buildDir}/actual/mo-${mo}-3"
            from "${projectDir}/src/test/resources/xml/mo-${mo}"
            include "**/*"
            exclude "**/*.xml"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-3"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        // no output
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "chunk": "index.html",
          "chunk-output-base-uri": "${buildDir}/actual/mo-${mo}-3/"
        ])
        
        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-3"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_3")
      }

      project.tasks.register("mo_${mo}_test_4", SaxonXsltTask) {
        // Chunked output HTML, media all in the same relative locations
        // but segregated by type
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        inputs.file "${projectDir}/src/test/resources/mo_1_test_4.xsl" // even for mo-2
        outputs.dir "${buildDir}/actual/mo-${mo}-4"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 4"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-4"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/image"
            from "${projectDir}/src/test/resources/xml/mo-${mo}"
            include "*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/body/image"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/body"
            include "*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/media/video"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
            include "*.mp4"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/front/video"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/front"
            include "*.mp4"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/media/audio"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
            include "*.mp3"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/media/image"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
            include "*.png"
          }
        }
        
        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book.xml"
        stylesheet "${projectDir}/src/test/resources/mo_1_test_4.xsl" // even for mo-2
        // no output
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "chunk": "index.html",
          "chunk-output-base-uri": "${buildDir}/actual/mo-${mo}-4/"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-4"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_4")
      }
      
      project.tasks.register("mo_${mo}_test_5", SaxonXsltTask) {
        // Chunked output HTML, media all in a common directory
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-5"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 5"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-5"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-5/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}"
            include "*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-5/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/body"
            include "*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-5/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/front"
            include "*.mp4"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-5/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-5"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        // no output
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "chunk": "index.html",
          "chunk-output-base-uri": "${buildDir}/actual/mo-${mo}-5/",
          "mediaobject-output-base-uri": "media/",
          "mediaobject-output-paths": "false"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-5"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_5")
      }
    }

    // Test 3 is different because, although the media are relative to the
    // source locations, they escape out above the "book" as might occur
    // if you had several books with some common media.
    ["3"].each { mo ->
      project.tasks.register("mo_${mo}_test_1", SaxonXsltTask) {
        // Single output HTML file, media all in the same relative locations
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-1"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 1"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-1/book"
          project.mkdir "${buildDir}/actual/mo-${mo}-1/media"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-1"
            from "${projectDir}/src/test/resources/xml/mo-${mo}"
            include "**/*"
            exclude "**/*.xml"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-1/book"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        output "${buildDir}/actual/mo-${mo}-1/book/index.html"
        args(['-init:org.docbook.xsltng.extensions.Register'])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-1"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_1")
      }

      project.tasks.register("mo_${mo}_test_2", SaxonXsltTask) {
        // Single output HTML file, media all in a common directory
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-2"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 2"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-2/book"
        }

        doFirst {
          // N.B. These copy commands are a bit redundant because they
          // have to work for all of the input layouts
          project.copy {
            into "${buildDir}/actual/mo-${mo}-2/book/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/book/body"
            include "*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-2/book/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-2/book"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        output "${buildDir}/actual/mo-${mo}-2/book/index.html"
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "mediaobject-output-base-uri": "media/",
          "mediaobject-output-paths": "false"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-2"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_2")
      }

      project.tasks.register("mo_${mo}_test_3", SaxonXsltTask) {
        // Chunked output HTML, media all in the same relative locations
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-3"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 3"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-3/book"
          project.mkdir "${buildDir}/actual/mo-${mo}-3/media"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-3"
            from "${projectDir}/src/test/resources/xml/mo-${mo}"
            include "**/*"
            exclude "**/*.xml"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-3/book"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        // no output
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "chunk": "index.html",
          "chunk-output-base-uri": "${buildDir}/actual/mo-${mo}-3/book/"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-3"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_3")
      }

      project.tasks.register("mo_${mo}_test_4", SaxonXsltTask) {
        // Chunked output HTML, media all in the same relative locations
        // but segregated by type
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        inputs.file "${projectDir}/src/test/resources/mo_1_test_4.xsl" // even for mo-2
        outputs.dir "${buildDir}/actual/mo-${mo}-4"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 4"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-4/book"
          project.mkdir "${buildDir}/actual/mo-${mo}-4/media"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/book/body/image"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/book/body"
            include "*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/media/image"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
            include "*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/media/audio"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
            include "*.mp3"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/media/video"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
            include "*.mp4"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/front/video"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/front"
            include "*.mp4"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/book"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${projectDir}/src/test/resources/mo_1_test_4.xsl" // even for mo-2
        // no output
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "chunk": "index.html",
          "chunk-output-base-uri": "${buildDir}/actual/mo-${mo}-4/book/"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-4"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_4")
      }

      project.tasks.register("mo_${mo}_test_5", SaxonXsltTask) {
        // Chunked output HTML, media all in a common directory
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-5"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 5"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-5"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-5/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/book/body"
            include "*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-5/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
            include "*.png"
            include "*.mp4"
            include "*.mp3"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-5"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        // no output
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "chunk": "index.html",
          "chunk-output-base-uri": "${buildDir}/actual/mo-${mo}-5/",
          "mediaobject-output-base-uri": "media/",
          "mediaobject-output-paths": "false"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-5"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_5")
      }
    }

    // Test 4 stores the media in a separate hierarchy
    ["4"].each { mo ->
      project.tasks.register("mo_${mo}_test_1", SaxonXsltTask) {
        // Single output HTML file, media all in the same relative locations
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-1"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 1"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-1"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-1"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
            include "**/*"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-1"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        output "${buildDir}/actual/mo-${mo}-1/index.html"
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "mediaobject-input-base-uri": "../media/",
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-1"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_1")
      }

      project.tasks.register("mo_${mo}_test_2", SaxonXsltTask) {
        // Single output HTML file, media all in a common directory
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-2"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 2"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-2"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-2/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-2"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        output "${buildDir}/actual/mo-${mo}-2/index.html"
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "mediaobject-input-base-uri": "../media/",
          "mediaobject-output-base-uri": "media/",
          "mediaobject-output-paths": "true"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-2"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_2")
      }

      project.tasks.register("mo_${mo}_test_3", SaxonXsltTask) {
        // Chunked output HTML, media all in the same relative locations
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-3"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 3"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-3"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-3"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
            include "**/*"
            exclude "**/*.xml"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-3"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        // no output
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "mediaobject-input-base-uri": "../media/",
          "chunk": "index.html",
          "chunk-output-base-uri": "${buildDir}/actual/mo-${mo}-3/"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-3"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_3")
      }

      project.tasks.register("mo_${mo}_test_4", SaxonXsltTask) {
        // Chunked output HTML, media all in the same relative locations
        // but segregated by type
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        inputs.file "${projectDir}/src/test/resources/mo_1_test_4.xsl" // even for mo-2
        outputs.dir "${buildDir}/actual/mo-${mo}-4"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 4"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-4"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/left/image"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media/left"
            include "*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/right/image"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media/right"
            include "*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/video"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
            include "*.mp4"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/audio"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
            include "*.mp3"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${projectDir}/src/test/resources/mo_1_test_4.xsl" // even for mo-4
        // no output
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "mediaobject-input-base-uri": "../media/",
          "chunk": "index.html",
          "chunk-output-base-uri": "${buildDir}/actual/mo-${mo}-4/"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-4"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_4")
      }

      project.tasks.register("mo_${mo}_test_5", SaxonXsltTask) {
        // Chunked output HTML, media all in a common directory
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-5"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 5"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-5"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-5/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-5"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        // no output
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "chunk": "index.html",
          "chunk-output-base-uri": "${buildDir}/actual/mo-${mo}-5/",
          "mediaobject-input-base-uri": "../media/",
          "mediaobject-output-base-uri": "media/",
          "mediaobject-output-paths": "true"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-5"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_5")
      }
    }

    // Test 5 stores the media grouped by type
    ["5"].each { mo ->
      project.tasks.register("mo_${mo}_test_1", SaxonXsltTask) {
        // Single output HTML file, media all in the same relative locations
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-1"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 1"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-1"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-1"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
            include "**/*"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-1"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        output "${buildDir}/actual/mo-${mo}-1/index.html"
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "mediaobject-input-base-uri": "../media/",
          "mediaobject-grouped-by-type": "true"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-1"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_2")
      }

      project.tasks.register("mo_${mo}_test_2", SaxonXsltTask) {
        // Single output HTML file, media all in a common directory
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-2"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 2"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-2"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-2/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-2"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        output "${buildDir}/actual/mo-${mo}-2/index.html"
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "mediaobject-input-base-uri": "../media/",
          "mediaobject-output-base-uri": "media/",
          "mediaobject-output-paths": "true",
          "mediaobject-grouped-by-type": "true"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-2"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_2")
      }

      project.tasks.register("mo_${mo}_test_3", SaxonXsltTask) {
        // Chunked output HTML, media all in the same relative locations
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-3"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 3"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-3"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-3"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
            include "**/*"
            exclude "**/*.xml"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-3"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        // no output
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "mediaobject-input-base-uri": "../media/",
          "chunk": "index.html",
          "chunk-output-base-uri": "${buildDir}/actual/mo-${mo}-3/",
          "mediaobject-grouped-by-type": "true"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-3"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_3")
      }

      project.tasks.register("mo_${mo}_test_4", SaxonXsltTask) {
        // Chunked output HTML, media all in the same relative locations
        // but segregated by type
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        inputs.file "${projectDir}/src/test/resources/mo_1_test_4.xsl" // even for mo-2
        outputs.dir "${buildDir}/actual/mo-${mo}-4"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 4"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-4"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/left/image"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media/left"
            include "**/*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/right/image"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media/right"
            include "**/*.png"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/video/mp4"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media/mp4"
          }
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4/audio/mp3"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media/mp3"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-4"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${projectDir}/src/test/resources/mo_5_test_4.xsl"
        // no output
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "mediaobject-input-base-uri": "../media/",
          "mediaobject-grouped-by-type": "true",
          "chunk": "index.html",
          "chunk-output-base-uri": "${buildDir}/actual/mo-${mo}-4/"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-4"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_4")
      }

      project.tasks.register("mo_${mo}_test_5", SaxonXsltTask) {
        // Chunked output HTML, media all in a common directory
        inputs.dir "${projectDir}/src/test/resources/xml/mo-${mo}"
        inputs.dir "${buildDir}/xslt"
        outputs.dir "${buildDir}/actual/mo-${mo}-5"
        dependsOn project.tasks.named('makeXslt')
        dependsOn project.tasks.named('copyResources')

        group: "mediaobject-test"
        description: "Test source mo-${mo}, output version 5"

        doFirst {
          project.mkdir "${buildDir}/actual/mo-${mo}-5"
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-5/media"
            from "${projectDir}/src/test/resources/xml/mo-${mo}/media"
          }
        }

        doFirst {
          project.copy {
            into "${buildDir}/actual/mo-${mo}-5"
            from "${buildDir}/actual"
            include "js/**"
            include "css/**"
          }
        }

        input "${projectDir}/src/test/resources/xml/mo-${mo}/book/book.xml"
        stylesheet "${buildDir}/xslt/docbook.xsl"
        // no output
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          "chunk": "index.html",
          "chunk-output-base-uri": "${buildDir}/actual/mo-${mo}-5/",
          "mediaobject-input-base-uri": "../media/",
          "mediaobject-output-base-uri": "media/",
          "mediaobject-output-paths": "true",
          "mediaobject-grouped-by-type": "true"
        ])

        doLast {
          project.exec {
            commandLine "python", "src/bin/linkcheck.py",
              "${buildDir}/actual/mo-${mo}-5"
          }
        }
      }
      all_mo_tests.configure {
        dependsOn project.tasks.named("mo_${mo}_test_5")
      }
    }
  }

  void createTasks() {
    testCases.createTasks()
    testConfigurations.createTasks()
  }
}
