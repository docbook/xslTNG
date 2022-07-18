package org.docbook.xsltng;

import net.sf.saxon.s9api.*;
import org.junit.Assert;
import org.junit.Test;
import org.xml.sax.InputSource;

import javax.xml.transform.sax.SAXSource;
import java.io.File;
import java.io.FileInputStream;

import static org.junit.Assert.fail;

public class GitHubIssues {
    @Test
    public void test0152() {
        // If the input document isn't being chunked, and it has a non-hierarchical base URI,
        // make sure we don't trip up somewhere attempting to resolve-uri.
        try {
            Processor processor = new Processor(false);

            FileInputStream stream = new FileInputStream(new File("src/test/resources/issues/0152/input.xml"));
            InputSource source = new InputSource(stream);
            source.setSystemId("urn:foo:bar");

            XdmDestination destination = new XdmDestination();

            XsltCompiler compiler = processor.newXsltCompiler();
            XsltExecutable exec = compiler.compile(new SAXSource(new InputSource("src/test/resources/issues/0152/style.xsl")));
            Xslt30Transformer xform = exec.load30();
            xform.applyTemplates(new SAXSource(source), destination);

            String s = destination.getXdmNode().toString();
            Assert.assertTrue(s.startsWith("<html "));

            Assert.assertNull(destination.getBaseURI());
        } catch (Exception ex) {
            fail();
        }
    }
}
