package org.docbook.xsltng.gradle

import org.gradle.api.Project
import org.gradle.api.tasks.TaskProvider
import org.gradle.api.tasks.Exec

class TestConfiguration {
  final Project project
  final TestEnvironments environments
  final String name
  private def _params = null
  private boolean _olinkdb = false
  private String _stylesheet = null
  private String _xspecDriver = null
  private def testCases = []
  private def extraDepends = []

  public TestConfiguration(TestConfigurations configs, String name) {
    this.project = configs.project
    this.environments = configs.environments
    this.name = name
  }

  public def getParameters() {
    if (_params == null) {
      withEnvironments([])
    }
    return _params
  }

  public String getStylesheet() {
    return _stylesheet
  }

  public boolean getOlinkdb() {
    return _olinkdb
  }

  public String getXspecDriver() {
    if (_xspecDriver == null) {
      _xspecDriver = "${project.buildDir}/xspec-xslt/xspec-driver.xsl"
    }
    return _xspecDriver
  }

  public Collection<String> extraDependencies() {
    return extraDepends.asImmutable()
  }

  public TestConfiguration withEnvironments(List<String> envnames) {
    if (_params != null) {
      throw new IllegalArgumentException("TestConfiguration '${name}' environments already configured")
    }

    if (envnames == null) {
      envnames = []
    }

    if (!envnames.contains('default')) {
      envnames = ['default'] + envnames
    }

    def params = [:]
    for (int pos = 0; pos < envnames.size(); pos++) {
      String ename = envnames[pos]
      TestEnvironment env = environments.find(ename)
      _olinkdb = _olinkdb || env.olinkdb
      env.parameters.each { entry ->
        params[entry.key] = entry.value
      }        
    }
    _params = params.asImmutable()
    return this
  }

  public TestConfiguration withStylesheet(String stylesheet) {
    if (_stylesheet != null) {
      throw new IllegalArgumentException("TestConfiguration '${name}' stylesheet already configured")
    }
    _stylesheet = stylesheet
    return this
  }

  public TestConfiguration withXSpecDriver(String driver) {
    if (_xspecDriver != null) {
      throw new IllegalArgumentException("TestConfiguration '${name}' XSpec driver already configured")
    }
    _xspecDriver = driver
    return this
  }

  public TestConfiguration withExtraDependencies(List<String> depends) {
    extraDepends.addAll(depends)
    return this
  }

  public void addTestCase(TestCase tcase) {
    testCases.add(tcase)
  }

  public void createTasks() {
    String configname = name

    if (testCases.isEmpty()) {
      println("No test case for ${configname} configuration")
      return
    }

    //println("Register _gen-env-${configname}")
    def genEnv = project.tasks.register("_gen-env-${configname}") {
      outputs.file "${project.buildDir}/env/${configname}.xsl"
      doFirst {
        project.mkdir("${project.buildDir}/env")
      }
      doLast {
        PrintStream s = new PrintStream(
          new FileOutputStream("${project.buildDir}/env/${configname}.xsl"))
        s.println("<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform'")
        s.println("                version='3.0'>")
        s.println("  <xsl:import href='${xspecDriver}'/>")
        
        parameters.each { entry ->
          if ((entry.value.toString()).isNumber()) {
            s.println("  <xsl:param name='${entry.key}' select=\"${entry.value}\"/>")
          } else {
            s.println("  <xsl:param name='${entry.key}' select=\"'${entry.value}'\"/>")
          }
        }

        s.println("</xsl:stylesheet>")
        s.close()
      }
    }

    //println("Register _gen-${configname}.xspec")
    File xfile = new File("${project.buildDir}/xspec/${configname}.xspec")

    def genXSpec = project.tasks.register("_gen-${configname}.xspec") {
      outputs.file xfile
      doFirst {
        project.mkdir("${project.buildDir}/xspec")
      }
      doLast {
        String expectedPath = "${project.projectDir}/src/test/resources/expected"
        PrintStream s = new PrintStream(new FileOutputStream(xfile))
        s.println("<x:description xmlns:x='http://www.jenitennison.com/xslt/xspec'")
        s.println("               stylesheet='../env/${configname}.xsl'>")
        s.println("")

        testCases = testCases.sort { a,b -> a.toString().toLowerCase() <=> b.toString().toLowerCase() }

        for (int pos = 0; pos < testCases.size(); pos++) {
          // Avoid closure because scenarios goes out of scope
          TestCase tcase = testCases.get(pos)
          s.println("<x:scenario label='When transforming ${tcase.name}'>")
          s.println("  <x:context href='${tcase.input}'/>")
          s.println("  <x:expect label='expect ${tcase.name}.expected'")
          s.println("            href='${expectedPath}/${tcase.name}.html'/>")
          s.println("</x:scenario>")
          s.println("")
        }

        s.println("</x:description>")
        s.close()
      }
    }

    //println("Register ${configname}.xspec")
    def xspecVersion = project.findProperty('xspecVersion')
    def xspecTask = project.tasks.register("${configname}.xspec", Exec) {
      inputs.files project.fileTree(dir: "${project.projectDir}/src/main/xslt")
      inputs.file "${project.projectDir}/src/guide/xml/ref-params.xml"
      inputs.files project.fileTree(dir: "${project.projectDir}/src/test/resources/xml")
      inputs.file xfile
      testCases.each { tcase ->
        inputs.file tcase.input
        dependsOn tcase.dependsOn
      }

      outputs.file project.file("${project.buildDir}/${configname}-compiled.xsl")
      outputs.file project.file("${project.buildDir}/${configname}-result.html")
      outputs.file project.file("${project.buildDir}/${configname}-result.xml")

      commandLine "${project.buildDir}/xspec-${xspecVersion}/bin/xspec.sh",
        "${xfile}"

      dependsOn project.tasks.named('makeXslt')
      dependsOn project.tasks.named('setupXSpec')
      dependsOn genEnv
      dependsOn genXSpec
    }

    project.tasks.named('xspecTests').configure {
      dependsOn xspecTask
    }
  }
}
