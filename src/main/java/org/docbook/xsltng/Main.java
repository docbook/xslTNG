package org.docbook.xsltng;

import net.sf.saxon.Transform;
import net.sf.saxon.trans.CommandLineOptions;
import org.docbook.xsltng.extensions.DebuggingLogger;

import java.util.Vector;

/**
 * Main driver program for executing the stylesheets.
 */
public class Main extends Transform {
    Vector<String> userArgs = new Vector<>();
    private final Vector<String> userCatalogFiles = new Vector<> ();
    private boolean userStylesheet = false;
    private boolean uriResolver = false;
    private boolean sourceReader = false;
    private boolean stylesheetReader = false;
    private boolean init = false;

    /** The debugging logger. */
    protected DebuggingLogger logger = null;
    /** The catalog file to use by default */
    protected String catalogFile = null;
    /** The XslTNG object used for processing. */
    protected XslTNG xslTNG = null;

    /**
     * Run the command.
     * @param args The command line arguments.
     */
    public static void main(String[] args) {
        Main instance = new Main(args);
        instance.run();
    }

    /**
     * Instantiate the main object.
     * @param args The command line objects.
     */
    public Main(String[] args) {
        int pos = 0;
        for (String arg : args) {
            if (arg.startsWith("-catalog:")) {
                pos = arg.indexOf(":");
                userCatalogFiles.add(arg.substring(pos+1));
            } else {
                uriResolver = uriResolver || arg.startsWith("-r:");
                sourceReader = sourceReader || arg.startsWith("-x:");
                stylesheetReader = stylesheetReader || arg.startsWith("-y:");
                userStylesheet = userStylesheet || arg.startsWith("-xsl:");
                init = init || arg.startsWith("-init:");
                userArgs.add(arg);
            }
        }

        xslTNG = new XslTNG();
        logger = xslTNG.logger;
        catalogFile = xslTNG.createCatalog(System.getProperty("org.docbook.xsltng.catalog-file"));
    }

    /**
     * Run the transform.
     */
    public void run() {
        if (uriResolver || sourceReader || stylesheetReader || init) {
            if (uriResolver) logger.error("The -r: option is not supported");
            if (sourceReader) logger.error("The -x: option is not supported");
            if (stylesheetReader) logger.error("The -y: option is not supported");
            if (init) logger.error("The -init: option is not supported");
            System.exit(1);
        }

        StringBuilder catBuilder = new StringBuilder();
        catBuilder.append(catalogFile);
        for (String cat : userCatalogFiles) {
            catBuilder.append(";");
            catBuilder.append(cat);
        }
        userArgs.add("-catalog:" + catBuilder);

        userArgs.add("-init:org.docbook.xsltng.extensions.Register");
        if (!userStylesheet) {
            userArgs.add("-xsl:https://cdn.docbook.org/release/xsltng/current/xslt/docbook.xsl");
        }

        String[] args = new String[userArgs.size()];
        userArgs.toArray(args);

        if (logger.getFlag("java-args")) {
            for (String arg : args) {
                logger.debug("java-args", arg);
            }
        }

        doTransform(args, "java org.docbook.xsltng.Main");
        System.exit(0);
    }

    /**
     * Print the help message for bad usage.
     * @param message The error message
     */
    @Override
    protected void badUsage(String message) {
        if (!"".equals(message)) {
            System.err.println(message);
        }

        if (!this.showTime) {
            System.err.println("DocBook xslTNG wrapper for " + getConfiguration().getProductTitle());
        }

        System.err.println("This wrapper accepts the same options as the standard Saxonica command line:");
        System.err.println("(see http://www.saxonica.com/documentation/index.html#!using-xsl/commandline)");
        System.err.println("except that -r, -x, -y, -z, and -init are forbidden. This wrapper specifies");
        System.err.println("values for those options.");
        System.err.println("Format: " + CommandLineOptions.getCommandName(this) + " options params");
        CommandLineOptions options = new CommandLineOptions();
        this.setPermittedOptions(options);
        System.err.println("Options available:" + options.displayPermittedOptions());
        System.err.println("Use -XYZ:? for details of option XYZ");
        System.err.println("Params: ");
        System.err.println("  param=value           Set stylesheet string parameter");
        System.err.println("  +param=filename       Set stylesheet document parameter");
        System.err.println("  ?param=expression     Set stylesheet parameter using XPath");
        System.err.println("  !param=value          Set serialization parameter");
        if (this.allowExit) {
            if ("".equals(message)) {
                System.exit(0);
            } else {
                System.exit(2);
            }

        } else {
            throw new RuntimeException(message);
        }
    }
}
