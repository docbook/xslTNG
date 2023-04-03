package org.docbook.xsltng.gradle

import org.gradle.api.Project

class TestConfigurations {
  private final def configurations = [:]
  final Project project
  final TestEnvironments environments

  public TestConfigurations(TestEnvironments environments) {
    this.project = environments.project
    this.environments = environments
  }

  public TestConfiguration create(String name) {
    if (configurations.containsKey(name)) {
      throw new IllegalArgumentException("TestConfiguration '${name}' already defined")
    }

    TestConfiguration config = new TestConfiguration(this, name)
    configurations[name] = config
    return config
  }

  public TestConfiguration find(String name) {
    if (!configurations.containsKey(name)) {
      throw new IllegalArgumentException("TestConfiguration '${name}' not defined")
    }
    return configurations[name]
  }

  public void createTasks() {
    configurations.values().each{ config -> 
      config.createTasks()
    }
  }
}
