package org.docbook.xsltng.gradle

import org.gradle.api.Project
import org.gradle.api.tasks.TaskProvider

class ValidationTasks {
  final Project project
  private final def validators = [:]

  private def publishersDocuments = ["JFK_Inaugural", "auld_lang_syne", "hen_v", "drama.001"]
  private def invalidIdrefDocuments = ["calloutlist.003", "transclusion.001", "transclusion.002",
                                       "transclusion.003", "transclusion.004", "xref.002"]

  public ValidationTasks(Project project) {
    this.project = project
  }

  public ValidationTask create(File input) {
    String fn = input.toString().replace('\\', '/').split('/')[-1]
    String base = fn.replaceFirst('\\.xml$', '')

    if (validators.containsKey(base)) {
      return validators[base]
    }

    if (base.startsWith("local.")) {
      return null
    }
    
    String schema = "${project.projectDir}/src/test/resources/docbook.rng"
    boolean validateIds = !(base in invalidIdrefDocuments)

    if (base in publishersDocuments) {
      schema = "${project.projectDir}/src/test/resources/publishers.rng"
    } else if (base == 'olink.001' || base.startsWith('fit.')
               || base.startsWith('xinclude.')
               || base.startsWith('iso690.')) {
      schema = "${project.projectDir}/src/test/resources/docbookxi.rng"
    } else if (base.startsWith('transclusion.')) {
      schema = "${project.projectDir}/src/test/resources/transclude.rng"
    }  

    ValidationTask task = new ValidationTask(project, input, schema, validateIds)
    validators[base] = task
    return task
  }
}
