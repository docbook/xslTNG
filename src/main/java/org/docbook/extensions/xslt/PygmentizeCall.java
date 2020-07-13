package org.docbook.extensions.xslt;

import net.sf.saxon.Configuration;
import net.sf.saxon.lib.ExtensionFunctionCall;

import java.io.File;

abstract public class PygmentizeCall extends ExtensionFunctionCall {
    public static final String PYGMENTIZE = "org.docbook.extensions.pygmentize";

    protected DebuggingLogger logger = null;

    public String findPygmentize(Configuration config, String executable, boolean noisy) {
        // I'm trying to make this Windows-compatible, but I'm not testing it there...
        String[] paths = System.getenv("PATH").split(File.pathSeparator);
        String pygmentize = null;

        if (System.getProperty(PYGMENTIZE) != null) {
            File pexec = new File(System.getProperty(PYGMENTIZE));
            if (pexec.exists() && pexec.canExecute()) {
                pygmentize = pexec.getAbsolutePath();
                message("Using pygmentize: " + pygmentize, noisy);
                return pygmentize;
            } else {
                message("Cannot use pygmentize: " + System.getProperty(PYGMENTIZE), noisy);
                pygmentize = null;
            }
        } else {
            message("Searching for pygmentize", noisy);
        }

        for (String path : paths) {
            if (pygmentize == null && !"".equals(path)) {
                File pexec = new File(path +  File.separatorChar + executable);
                if (pexec.exists() && pexec.canExecute()) {
                    pygmentize = pexec.getAbsolutePath();
                }
            }
        }

        if (pygmentize == null) {
            message("Failed to find pygmentize: " + executable, noisy);
            for (String path : paths) {
                message("Not in: " + path, noisy);
            }
        } else {
            message("Found pygmentize: " + pygmentize, noisy);
        }

        return pygmentize;
    }

    private void message(String message, boolean noisy) {
        if (noisy && logger != null) {
            logger.debug(DebuggingLogger.PYGMENTIZE_ERRORS, message);
        }
    }
}
