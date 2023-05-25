package org.docbook.xsltng.gradle

class TestUtils {
  static String fixWindowsPath(String path) {
    String fix = path.replace('\\', '/').replace(' ', '%20')
    if (fix.length() > 2 && fix.charAt(1) == ':') {
      fix = fix.substring(2)
    }
    return fix
  }
}
