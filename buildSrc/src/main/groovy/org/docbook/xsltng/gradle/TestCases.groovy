package org.docbook.xsltng.gradle

import org.gradle.api.Project

class TestCases {
  final Project project
  final ValidationTasks validationTasks
  private final def cases = [:]

  public TestCases(Project project, ValidationTasks vtasks) {
    this.project = project
    this.validationTasks = vtasks
  }

  public TestCase create(String name, File input, TestConfiguration config) {
    if (cases.containsKey(name)) {
      throw new IllegalArgumentException("TestCase '${name}' already defined")
    }

    TestCase tcase = new TestCase(this, name, input, config)
    config.addTestCase(tcase)
    cases[name] = tcase
    return tcase
  }

  public TestCase find(String name) {
    if (!cases.containsKey(name)) {
      throw new IllegalArgumentException("TestCase '${name}' not defined")
    }
    return cases[name]
  }

  public void createTasks() {
    cases.values().each { tcase ->
      tcase.createTasks()
    }
  }
}
