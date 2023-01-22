package org.docbook.xsltng.extensions;

import junit.framework.TestCase;
import net.sf.saxon.s9api.Processor;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.RawDestination;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.XdmValue;
import net.sf.saxon.s9api.XsltCompiler;
import net.sf.saxon.s9api.XsltExecutable;
import net.sf.saxon.s9api.XsltTransformer;
import org.docbook.xsltng.extensions.Cwd;
import org.xml.sax.InputSource;

import javax.xml.transform.sax.SAXSource;
import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;

// FIXME: This doesn't actually test anything yet.

public class TestCwd extends TestCase {
    Processor processor = null;

    protected void setUp() {
        processor = new Processor(false);
        processor.getUnderlyingConfiguration().registerExtensionFunction(new Cwd());
    }

    public void testCwd() {
        String stylesheet = "";
        stylesheet += "<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform'\n";
        stylesheet += "                xmlns:ext='http://docbook.org/extensions/xslt'\n";
        stylesheet += "                version='3.0'>\n\n";
        stylesheet += "<xsl:output method='text' encoding='utf-8'/>\n\n";
        stylesheet += "<xsl:template match='/' name='main'>\n";
        stylesheet += "  <xsl:value-of select=\"ext:cwd()\"/>\n";
        stylesheet += "</xsl:template>\n\n";
        stylesheet += "</xsl:stylesheet>\n";

        ByteArrayInputStream bais = new ByteArrayInputStream(
                stylesheet.getBytes(StandardCharsets.UTF_8));

        try {
            RawDestination result = new RawDestination();
            XsltCompiler compiler = processor.newXsltCompiler();
            XsltExecutable exec = compiler.compile(new SAXSource(new InputSource(bais)));
            XsltTransformer transformer = exec.load();
            transformer.setDestination(result);
            transformer.setInitialTemplate(new QName("", "main"));
            transformer.transform();
            XdmValue value = result.getXdmValue();

            String expected = System.getProperty("user.dir");
            if (expected.startsWith("/")) {
                expected = "file:" + expected;
            } else {
                expected = "file:/" + expected;
            }
            if (!expected.endsWith("/")) {
                expected += "/";
            }

            assertEquals(expected, value.toString());
        } catch (SaxonApiException sae) {
            sae.printStackTrace();
            TestCase.fail();
        }
    }
}
