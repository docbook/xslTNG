package org.docbook.xsltng.gradle

import org.gradle.api.Project

class TestEnvironments {
  final Project project
  private final def environments = [:]

  public TestEnvironments(Project project) {
    this.project = project
  }

  public TestEnvironment create(String name) {
    if (environments.containsKey(name)) {
      throw new IllegalArgumentException("TestEnvironment '${name}' already defined")
    }

    TestEnvironment env = new TestEnvironment(project, name, null)
    environments[name] = env
    return env
  }

  public TestEnvironment find(String name) {
    if (!environments.containsKey(name)) {
      throw new IllegalArgumentException("TestEnvironment '${name}' not defined")
    }
    return environments[name]
  }
}
