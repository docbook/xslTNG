package org.docbook.xsltng.gradle

class TestValidator {
  final String schema
  final boolean validateIds

  public TestValidator(String schema) {
    this.schema = schema
    validateIds = true
  }

  public TestValidator(String schema, boolean validIds) {
    this.schema = schema
    validateIds = validIds
  }
}
