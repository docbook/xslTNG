package org.docbook.xsltng.gradle

import org.gradle.api.Project
import org.gradle.api.tasks.TaskProvider

import com.nwalsh.gradle.relaxng.validate.RelaxNGValidateTask

class ValidationTask {
  final TaskProvider task
  final File output

  public ValidationTask(Project project, File xinput, String xschema, boolean xvalidate) {
    String fn = xinput.toString().replace('\\', '/').split('/')[-1]
    String base = fn.replaceFirst('\\.xml$', '')

    File _input  = new File(xinput.toString())
    File _output = new File("${project.buildDir}/validated/${base}.xml")

    //println("Register validate_${base}")
    task = project.tasks.register("validate_${base}", RelaxNGValidateTask) {
      input _input
      output _output
      schema xschema
      idref xvalidate
    }

    output = _output
  }
}
