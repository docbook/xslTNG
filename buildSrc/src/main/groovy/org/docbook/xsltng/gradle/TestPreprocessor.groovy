package org.docbook.xsltng.gradle

import org.gradle.api.Project
import org.gradle.api.tasks.TaskProvider

import com.nwalsh.gradle.saxon.SaxonXsltTask

class TestPreprocessor {
  final String stylesheet
  final def parameters
  final String testName
  private File _input = null
  private File _output = null

  public TestPreprocessor(String name, File input, String stylesheet, Map params) {
    this.testName = name
    this._input = input
    this.stylesheet = stylesheet
    if (params == null) {
      this.parameters = [:].asImmutable()
    } else {
      this.parameters = params.asImmutable()
    }
  }

  File getInput() {
    return _input
  }

  File getOutput() {
    return _output
  }

  public TaskProvider createTask(Project project) {
    if (_output != null) {
      throw new IllegalArgumentException("TestCase '${testName}' already has a preprocessor")
    }
    _output = new File("${project.projectDir}/build/preprocessed/${testName}.xml")

    //println("Register preprocess_${testName}")
    def task = project.tasks.register("preprocess_${testName}", SaxonXsltTask) {
      stylesheet stylesheet
      input _input
      output _output
      parameters(parameters)
      args(['-init:org.docbook.xsltng.extensions.Register'])
      dependsOn project.tasks.named('makeXslt')
    }

    return task
  }
}
