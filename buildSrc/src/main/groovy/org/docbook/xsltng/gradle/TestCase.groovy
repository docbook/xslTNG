package org.docbook.xsltng.gradle

import org.gradle.api.Project
import org.gradle.api.GradleException
import org.gradle.api.tasks.TaskProvider
import org.gradle.api.tasks.Exec

import com.nwalsh.gradle.saxon.SaxonXsltTask
import com.nwalsh.gradle.relaxng.validate.RelaxNGValidateTask

class TestCase {
  final Project project
  final String name
  final TestConfiguration config
  private final TestCases testCases
  private File input = null
  private File expected = null
  private def dependsList = []
  private TestPreprocessor _preproc = null

  public TestCase(TestCases testCases, String name, File input, TestConfiguration config) {
    this.testCases = testCases
    this.project = testCases.project
    this.name = name
    this.config = config
    this.input = input
  }

  public TestCase withPreprocessor(String stylesheet) {
    return withPreprocessor(stylesheet, null)
  }

  public TestCase withPreprocessor(String stylesheet, Map parameters) {
    if (_preproc != null) {
      throw new IllegalArgumentException("TestCase '${name}' already has a preprocessor")
    }
    _preproc = new TestPreprocessor(name, input, stylesheet, parameters)
    return this
  }

  @Override
  String toString() {
    "TestCase: ${name}"
  }

  File getInput() {
    return input
  }

  File getExpected() {
    return expected
  }

  TestPreprocessor getPreprocessor() {
    return _preproc
  }

  Collection<TaskProvider> getDependsOn() {
    return dependsList.asImmutable()
  }

  void createTasks() {
    String testname = name

    config.extraDependencies().each { tname ->
      dependsList.add(project.tasks.named(tname))
    }

    TaskProvider pretask = null
    if (preprocessor != null) {
      pretask = preprocessor.createTask(project)
      dependsList.add(pretask)
      input = preprocessor.output
    }

    ValidationTask vtask = testCases.validationTasks.create(input)
    if (vtask != null) {
      dependsList.add(vtask.task)
      if (pretask != null) {
        vtask.task.configure {
          dependsOn pretask
        }
      }
    }

    if (config.olinkdb) {
      File _input  = new File(input.toString())
      List<TaskProvider> _dependsOn = dependsList.collect()
      //println("Register ${testname}.olinkdb")
      def task = project.tasks.register("${testname}.olinkdb", SaxonXsltTask) {
        inputs.files project.fileTree(dir: "${project.projectDir}/src/main/xslt")
        inputs.file "${project.projectDir}/src/guide/xml/ref-params.xml"
        inputs.files project.fileTree(dir: "${project.projectDir}/src/test/resources", exclude: "expected")

        input _input
        stylesheet "${project.buildDir}/xslt/olinkdb.xsl"
        output "${project.buildDir}/actual/${testname}.olinkdb"
        args(['-init:org.docbook.xsltng.extensions.Register'])
        parameters([
          'dynamic-profiles': 'true',
          'olink-targetdoc': 'base'
        ])
        dependsOn project.tasks.named('makeXslt')
        dependsOn _dependsOn
      }

      dependsList.add(task)
    }

    String dbxsl = config.stylesheet == null ?
      "${project.projectDir}/build/xslt/docbook.xsl" :
      config.stylesheet

    File _input = new File(input.toString())
    List<TaskProvider> _dependsOn = dependsList.collect()
    expected = new File("${project.projectDir}/src/test/resources/expected/${testname}.html")

    //println("Register ${testname}.expected")
    def expTask = project.tasks.register("${testname}.expected", SaxonXsltTask) {
      outputs.upToDateWhen { false }
      input _input
      stylesheet "${config.xspecDriver}"
      output expected
      args(['-init:org.docbook.xsltng.extensions.Register'])
      parameters(config.parameters)
      dependsOn project.tasks.named('makeXslt')
      dependsOn _dependsOn
    }

    //println("Register ${testname}.html")
    def htmlTask = project.tasks.register("${testname}.html", SaxonXsltTask) {
      inputs.files project.fileTree(dir: "${project.projectDir}/src/main/xslt")
      inputs.file "${project.projectDir}/src/guide/xml/ref-params.xml"

      /*
      doFirst {
        println("Processing ${testname}.html with ${config.name}")
        println(config.parameters)
      }
       */

      input _input
      stylesheet "${dbxsl}"
      output "${project.buildDir}/actual/${testname}.html"
      args(['-init:org.docbook.xsltng.extensions.Register'])
      parameters(config.parameters)
      dependsOn project.tasks.named('makeXslt')
      dependsOn _dependsOn
    }

    //println("Register ${testname}.chunk")
    project.tasks.register("${testname}.chunk", SaxonXsltTask) {
      inputs.files project.fileTree(dir: "${project.projectDir}/src/main/xslt")
      inputs.file "${project.projectDir}/src/guide/xml/ref-params.xml"
      // This is a bit overzealous, but we don't know what all the chunks are...
      outputs.files project.fileTree(dir: "${project.buildDir}/actual",
                                     include: "*.html")

      input _input
      stylesheet dbxsl
      output "${project.buildDir}/actual/${testname}.html"
      args(['-init:org.docbook.xsltng.extensions.Register'])
      parameters(config.parameters)
      parameters(['chunk':'index.html',
                  'chunk-output-base-uri': "${project.buildDir}/actual/",
                  'dynamic-profiles': 'true'])
      dependsOn project.tasks.named('makeXslt')
      dependsOn _dependsOn
    }

    def printParams = [
      'profile-outputformat': 'print',
      'resource-base-uri': '',
      'dynamic-profiles': 'true']
    if (name.startsWith("book.")) {
      printParams['page-style'] = 'book'
    }

    //println("Register ${testname}.pdf.html")
    def pdfhtml = project.tasks.register("${testname}.pdf.html", SaxonXsltTask) {
      inputs.files project.fileTree(dir: "${project.projectDir}/src/main/xslt")
      inputs.file "${project.projectDir}/src/guide/xml/ref-params.xml"
      inputs.files project.fileTree(dir: "${project.projectDir}/src/test/resources")

      input _input
      stylesheet "${project.buildDir}/xslt/print.xsl"
      output "${project.buildDir}/actual/${testname}.pdf.html"
      args(['-init:org.docbook.xsltng.extensions.Register'])
      parameters(config.parameters)
      parameters(printParams)
      dependsOn project.tasks.named('makeXslt')
      dependsOn _dependsOn
    }

    String pdfTool = project.findProperty('pdftool')
    String pdfExec = pdfTool == null ? null : project.findProperty(pdfTool)

    switch (pdfTool) {
      case "prince":
        //println("Register ${testname}.pdf (${pdfTool})")
        project.tasks.register("${testname}.pdf", Exec) {
          inputs.files project.fileTree(dir: "${project.buildDir}/actual/css")
          inputs.file project.file("${project.buildDir}/actual/${testname}.pdf.html")
          outputs.file project.file("${project.buildDir}/actual/${testname}.pdf")
          dependsOn pdfhtml

          commandLine pdfExec,
            "${project.buildDir}/actual/${testname}.pdf.html",
            "-o", "${project.buildDir}/actual/${testname}.pdf"
        }

        //println("Register ${testname}.pdf.expected (${pdfTool})")
        project.tasks.register("${testname}.pdf.expected", Exec) {
          inputs.files project.fileTree(dir: "${project.buildDir}/actual/css")
          inputs.file project.file("${project.buildDir}/actual/${testname}.pdf.html")
          outputs.file project.file("${project.projectDir}/src/test/resources/expectedpdf/${pdfTool}/${testname}.pdf")
          dependsOn pdfhtml

          commandLine pdfExec,
            "${project.buildDir}/actual/${testname}.pdf.html",
            "-o", "${project.projectDir}/src/test/resources/expectedpdf/${pdfTool}/${testname}.pdf"
        }
        break

      case "antennahouse":
        //println("Register ${testname}.pdf (${pdfTool})")
        project.tasks.register("${testname}.pdf", Exec) {
          inputs.files project.fileTree(dir: "${project.buildDir}/actual/css")
          inputs.file project.file("${project.buildDir}/actual/${testname}.pdf.html")
          outputs.file project.file("${project.buildDir}/actual/${testname}.pdf")
          dependsOn pdfhtml

          commandLine pdfExec,
            "-d", "${project.buildDir}/actual/${testname}.pdf.html",
            "-o", "${project.buildDir}/actual/${testname}.pdf"
        }

        //println("Register ${testname}.pdf.expected (${pdfTool})")
        project.tasks.register("${testname}.pdf.expected", Exec) {
          inputs.files project.fileTree(dir: "${project.buildDir}/actual/css")
          inputs.file project.file("${project.buildDir}/actual/${testname}.pdf.html")
          outputs.file project.file("${project.projectDir}/src/test/resources/expectedpdf/${pdfTool}/${testname}.pdf")
          dependsOn pdfhtml

          commandLine pdfExec,
            "-d", "${project.buildDir}/actual/${testname}.pdf.html",
            "-o", "${project.projectDir}/src/test/resources/expectedpdf/${pdfTool}/${testname}.pdf"
        }
        break
      case null:
        println("No PDF tool configured, skipping PDF tests")
        break
      default:
        println("Unknown PDF tool configured: ${pdfTool}, skipping PDF tests")
        break
    }
  }
}
