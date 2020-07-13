package org.docbook.extensions.xslt;

import net.sf.saxon.lib.ExtensionFunctionDefinition;

abstract public class PygmentizeDefinition extends ExtensionFunctionDefinition {
    protected String executable = "pygmentize";
    protected Boolean foundPygmentize = null;
    protected String pygmentize = null;
}
