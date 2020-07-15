package org.docbook.xsltng;

import net.sf.saxon.Transform;
import net.sf.saxon.s9api.DocumentBuilder;
import net.sf.saxon.s9api.Processor;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.ValidationMode;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmDestination;
import net.sf.saxon.s9api.XdmNode;
import net.sf.saxon.s9api.XsltCompiler;
import net.sf.saxon.s9api.XsltExecutable;
import net.sf.saxon.s9api.XsltTransformer;
import net.sf.saxon.trans.CommandLineOptions;
import org.docbook.xsltng.extensions.DebuggingLogger;
import org.xml.sax.InputSource;

import javax.xml.transform.sax.SAXSource;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.net.JarURLConnection;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLConnection;
import java.security.CodeSource;
import java.util.Properties;
import java.util.Vector;

public class Main extends Transform {
    Vector<String> userArgs = new Vector<>();
    private String userCatalogFile = null;
    private boolean userStylesheet = false;
    private boolean uriResolver = false;
    private boolean sourceReader = false;
    private boolean stylesheetReader = false;
    private boolean init = false;

    protected Processor processor = null;
    protected DebuggingLogger logger = null;
    protected String version = null;
    protected String jarLoc = null;
    protected String catalogFile = null;
    protected Properties configProperties = null;

    public static void main(String[] args) {
        Main instance = new Main(args);
        instance.run();
    }

    public Main(String[] args) {
        int pos = 0;
        for (String arg : args) {
            if (arg.startsWith("-catalog:")) {
                pos = arg.indexOf(":");
                userCatalogFile = arg.substring(pos+1);
            } else {
                uriResolver = uriResolver || arg.startsWith("-r:");
                sourceReader = sourceReader || arg.startsWith("-x:");
                stylesheetReader = stylesheetReader || arg.startsWith("-y:");
                userStylesheet = userStylesheet || arg.startsWith("-xsl:");
                init = init || arg.startsWith("-init:");
                userArgs.add(arg);
            }
        }

        processor = new Processor(false); // I need one for a bit...
        logger = new DebuggingLogger(processor.getUnderlyingConfiguration().getLogger());
        findJarLocation();
        logger.debug("main", "jarLoc=" + jarLoc);
        createCatalog(System.getProperty("org.docbook.xsltng.catalog-file"));
        run();
    }

    public void findJarLocation() {
        CodeSource src = Main.class.getProtectionDomain().getCodeSource();
        String classLoc = src.getLocation().toString();
        logger.debug("main", "classLoc=" + classLoc);

        if (classLoc.endsWith(".jar")) {
            jarLoc = "jar:" + classLoc + "!";
        } else {
            // This is only supposed to happen on a dev box; if you're integrating this into some bigger
            // application, well, sorry, it's all a bit of a hack if it's not in the jar. Override this
            // method and do the right thing...
            if (classLoc.indexOf("/build/") > 0) {
                jarLoc = classLoc + "../../../stage/jar";
                try {
                    loadProperties();
                } catch (UnsupportedOperationException e) {
                    logger.warning("Jar location incomplete: " + jarLoc);
                }
            } else {
                throw new RuntimeException("org.docbook.xsltng.Main cannot find root from " + classLoc);
            }
        }
    }

    public void run() {
        if (uriResolver || sourceReader || stylesheetReader || init) {
            if (uriResolver) logger.error("The -r: option is not supported");
            if (sourceReader) logger.error("The -x: option is not supported");
            if (stylesheetReader) logger.error("The -y: option is not supported");
            if (init) logger.error("The -init: option is not supported");
            System.exit(1);
        }

        System.setProperty("xml.catalog.files", catalogFile);
        userArgs.add("-x:org.xmlresolver.tools.ResolvingXMLReader");
        userArgs.add("-y:org.xmlresolver.tools.ResolvingXMLReader");
        userArgs.add("-r:org.xmlresolver.Resolver");
        userArgs.add("-init:org.docbook.xsltng.extensions.Register");
        if (!userStylesheet) {
            userArgs.add("-xsl:https://cdn.docbook.org/release/xsltng/current/xslt/docbook.xsl");
        }

        String[] args = new String[userArgs.size()];
        userArgs.toArray(args);
        doTransform(args, "java org.docbook.xsltng.Main");
        System.exit(0);
    }

    public String createCatalog(String catalogFilename) {
        if (catalogFile != null) {
            if (catalogFilename == null || catalogFile.equals(catalogFilename)) {
                return catalogFile;
            }
        }

        try {
            Processor processor = new Processor(false);
            DocumentBuilder builder = processor.newDocumentBuilder();
            builder.setDTDValidation(false);
            builder.setLineNumbering(true);

            URL uris_url = new URL(jarLoc + "/etc/uris.xml");
            URL xsl_url   = new URL(jarLoc + "/etc/make-catalog.xsl");

            InputSource uris_src = new InputSource(getStream(uris_url));
            InputSource xsl_src = new InputSource(getStream(xsl_url));

            uris_src.setSystemId(uris_url.toURI().toASCIIString());
            xsl_src.setSystemId(xsl_url.toURI().toASCIIString());

            XdmNode uris = builder.build(new SAXSource(uris_src));
            XdmNode xsl  = builder.build(new SAXSource(xsl_src));

            XsltCompiler compiler = processor.newXsltCompiler();
            compiler.setSchemaAware(false);
            XsltExecutable exec = compiler.compile(xsl.asSource());
            XsltTransformer transformer = exec.load();

            transformer.setParameter(new QName("", "jarloc"), new XdmAtomicValue(jarLoc));
            transformer.setParameter(new QName("", "version"), new XdmAtomicValue(version()));
            if (userCatalogFile != null) {
                File cwd = new File(System.getProperty("user.dir") + System.getProperty("file.separator") + "irrelevant");
                String catalog = cwd.toURI().resolve(userCatalogFile).toASCIIString();
                transformer.setParameter(new QName("", "catalog"), new XdmAtomicValue(catalog));
            }
            transformer.setInitialContextNode(uris);

            XdmDestination xresult = new XdmDestination();
            transformer.setDestination(xresult);

            transformer.setSchemaValidationMode(ValidationMode.DEFAULT);
            transformer.transform();
            XdmNode xformed = xresult.getXdmNode();

            File tempcat = null;
            if (catalogFilename == null) {
                tempcat = File.createTempFile("dbcat", ".xml");
                tempcat.deleteOnExit();
            } else {
                tempcat = new File(catalogFilename);
            }

            logger.debug("main", "Transient catalog file: " + tempcat.getAbsolutePath());

            PrintStream catstream = new PrintStream(tempcat);
            catstream.print(xformed.toString());
            catstream.close();

            catalogFile = tempcat.getAbsolutePath();
            return catalogFile;
        } catch (SaxonApiException | IOException | URISyntaxException sae) {
            logger.info("org.docbook.XSLT20 failed to create catalog: " + sae.getMessage());
            throw new RuntimeException(sae);
        }
    }

    protected InputStream getStream(URL url) {
        URLConnection conn = null;
        try {
            try {
                conn = (JarURLConnection) url.openConnection();
            } catch (ClassCastException cce) {
                conn = url.openConnection();
            }

            return conn.getInputStream();
        } catch (IOException ioe) {
            throw new RuntimeException("Cannot read: " + url.toString());
        }
    }

    protected String version() {
        if (version != null) {
            return version;
        }

        loadProperties();
        version = configProperties.getProperty("version");
        if (version == null) {
            throw new UnsupportedOperationException("No version property in version.properties!?");
        }
        return version;
    }

    private void loadProperties() {
        if (configProperties != null) {
            return;
        }

        configProperties = new Properties();
        InputStream stream = null;
        try {
            URL version_url = new URL(jarLoc + "/etc/version.properties");
            stream = getStream(version_url);
            configProperties.load(stream);
        } catch (IOException ioe) {
            throw new UnsupportedOperationException("Failed to load version.properties file from JAR!?");
        }
    }

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
