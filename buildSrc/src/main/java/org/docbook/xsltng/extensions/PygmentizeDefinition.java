package org.docbook.xsltng.extensions;

import net.sf.saxon.lib.ExtensionFunctionDefinition;

abstract public class PygmentizeDefinition extends ExtensionFunctionDefinition {
    protected String executable = null;
    protected Boolean foundPygmentize = null;
    protected String pygmentize = null;

    protected boolean isWindows() {
        return System.getProperty("os.name", "unknown").toLowerCase().contains("win");
    }

    protected void computeExecutable() {
        if (isWindows()) {
            executable = "pygmentize.exe";
        } else {
            executable = "pygmentize";
        }
    }
}
