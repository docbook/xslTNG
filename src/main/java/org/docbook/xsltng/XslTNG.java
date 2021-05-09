package org.docbook.xsltng;

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
import org.docbook.xsltng.extensions.DebuggingLogger;
import org.xml.sax.InputSource;
import org.xmlresolver.Resolver;

import javax.xml.transform.sax.SAXSource;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.JarURLConnection;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLConnection;
import java.security.CodeSource;
import java.util.Properties;

public class XslTNG {
    protected static String catalogFile = null;
    protected static Properties configProperties = null;
    protected static String version = null;
    protected static String resourcesVersion = null;
    protected String resolverVersion = null;
    protected String classLoc = null;
    protected String jarLoc = null;
    protected DebuggingLogger logger = null;

    public XslTNG() {
        Processor processor = new Processor(false);
        logger = new DebuggingLogger(processor.getUnderlyingConfiguration().getLogger());

        CodeSource src = XslTNG.class.getProtectionDomain().getCodeSource();
        classLoc = src.getLocation().toString();
        logger.debug("xsltng", "classLoc=" + classLoc);

        try {
            Method version = Resolver.class.getMethod("version");
            resolverVersion = (String) version.invoke(null);
        } catch (NoSuchMethodException|IllegalAccessException|InvocationTargetException ex) {
            // I don't care; if I can't get the version, it's not version 2.0.0 or later
        }

        if (classLoc.endsWith(".jar")) {
            jarLoc = "jar:" + classLoc + "!";
        } else {
            // This is only supposed to happen on a dev box; if you're integrating this into some bigger
            // application, well, sorry, it's all a bit of a hack if it's not in the jar.
            if (classLoc.indexOf("/build/") > 0) {
                jarLoc = classLoc + "../../../resources/main";
            } else if (classLoc.indexOf("/out/production/") > 0) { // IntelliJ
                jarLoc = classLoc + "../resources";
            } else {
                throw new RuntimeException("org.docbook.XslTNG cannot find root from " + classLoc);
            }
        }
    }

    public String createCatalog() {
        return createCatalog(null);
    }

    public String createCatalog(String catalogFilename) {
        if (resolverVersion != null) {
            // The version() method was introduced in 2.x, so we don't actually care
            // what version was returned at this point. If XML Resolver 3.x breaks
            // this, I assert that's a bug in XML Resolver 3.x.
            return "classpath:org/docbook/xsltng/catalog.xml";
        }

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

            URL uris_url = new URL(jarLoc + "/org/docbook/xsltng/etc/uris.xml");
            URL xsl_url   = new URL(jarLoc + "/org/docbook/xsltng/etc/make-catalog.xsl");

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
            transformer.setParameter(new QName("", "jarpath"), new XdmAtomicValue("/org/docbook/xsltng/"));
            transformer.setParameter(new QName("", "version"), new XdmAtomicValue(version()));
            transformer.setParameter(new QName( "", "resourcesVersion"), new XdmAtomicValue(resourcesVersion()));
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

            logger.debug("xsltng", "Transient catalog file: " + tempcat.getAbsolutePath());

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

    private InputStream getStream(URL url) {
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

    public String version() {
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

    public String resourcesVersion() {
        if (resourcesVersion != null) {
            return resourcesVersion;
        }

        // There isn't actually a resourcesVersion in xslTNG yet.

        loadProperties();
        resourcesVersion = configProperties.getProperty("resourcesVersion");
        if (resourcesVersion == null) {
            resourcesVersion = version();
        }
        return resourcesVersion;
    }

    private void loadProperties() {
        if (configProperties != null) {
            return;
        }

        configProperties = new Properties();
        InputStream stream = null;
        try {
            URL version_url = new URL(jarLoc + "/org/docbook/xsltng/etc/version.properties");
            stream = getStream(version_url);
            configProperties.load(stream);
        } catch (IOException ioe) {
            throw new UnsupportedOperationException("Failed to load version.properties file from JAR!?");
        }
    }

    /*
    public static void main(String[] args) {
        XslTNG instance = new XslTNG();
        instance.run();
    }

    public void run() {
        System.out.println("Hello, world");
        System.out.println("jarLoc: " + jarLoc);
        System.out.println("classLoc: " + classLoc);
        String x = createCatalog("/tmp/out.cat");
        System.out.println("catalog: " + x);
    }
     */
}
