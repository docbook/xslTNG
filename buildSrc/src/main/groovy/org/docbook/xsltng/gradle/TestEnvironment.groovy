package org.docbook.xsltng.gradle

import org.gradle.api.Project

class TestEnvironment {
  final Project project
  final String name
  private boolean _olinkdb = false
  private def _parameters = [:].asImmutable()

  public TestEnvironment(Project project, String name, Map parameters) {
    this.project = project
    this.name = name
    if (parameters == null) {
      _parameters = null
    } else {
      _parameters = params.asImmutable()
    }
  }

  def getParameters() {
    if (_parameters == null) {
      _parameters = [:].asImmutable()
    }
    return _parameters
  }

  boolean getOlinkdb() {
    return _olinkdb
  }

  public TestEnvironment withOlinkdb() {
    return withOlinkdb(true)
  }

  public TestEnvironment withOlinkdb(boolean db) {
    _olinkdb = db
    return this
  }

  public TestEnvironment withParameters(Map params) {
    if (_parameters != null) {
      throw new IllegalArgumentException("Parameters already defined")
    }
    if (params == null) {
      _parameters = [:].asImmutable()
    } else {
      _parameters = params.asImmutable()
    }
    return this
  }
}
