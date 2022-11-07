package org.docbook.xsltng.extensions;

import com.drew.metadata.icc.IccDirectory;
import net.sf.saxon.Configuration;
import net.sf.saxon.expr.XPathContext;
import net.sf.saxon.lib.ExtensionFunctionCall;
import net.sf.saxon.s9api.Axis;
import net.sf.saxon.s9api.DocumentBuilder;
import net.sf.saxon.s9api.Processor;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmMap;
import net.sf.saxon.s9api.XdmNode;
import net.sf.saxon.s9api.XdmNodeKind;
import net.sf.saxon.s9api.XdmSequenceIterator;
import org.xml.sax.InputSource;

import javax.xml.transform.sax.SAXSource;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.StringTokenizer;

abstract public class ImageCall extends ExtensionFunctionCall {
    private final static String svgNamespace = "http://www.w3.org/2000/svg";

    protected DebuggingLogger logger = null;
    protected XPathContext context = null;
    protected XdmMap map = new XdmMap();

    protected void parseImage(String imageUri) {
        // What if it's a PDF or an EPS or an SVG?
        InputStream stream = null;
        try {
            URL url = new URL(imageUri);
            stream = url.openStream();
            BufferedReader ir = new BufferedReader(new InputStreamReader(stream));
            String line = ir.readLine();

            if (line != null) {
                if (line.startsWith("%PDF-")) {
                    // We've got a PDF!
                    int lineLimit = 100;
                    while (lineLimit > 0 && line != null) {
                        lineLimit--;
                        if (line.startsWith("/CropBox [")) {
                            line = line.substring(10);
                            if (line.contains("]")) {
                                line = line.substring(0, line.indexOf("]"));
                            }
                            map = parseBox(map, line);
                            lineLimit = 0;
                        } else if (line.startsWith("/MediaBox [")) {
                            line = line.substring(11);
                            if (line.contains("]")) {
                                line = line.substring(0, line.indexOf("]"));
                            }
                            map = parseBox(map, line);
                            // Keep looking in case we get a CropBox
                            // I think the CropBox is a better bounding box
                        }
                        line = ir.readLine();
                    }
                } else if (line.startsWith("<?xml")
                        || line.startsWith("<svg") || line.startsWith("<svg:")
                        || line.startsWith("<!DOCTYPE svg")) {
                    // We've got an SVG? Maybe we've got an SVG!
                    map = parseSvg(map, imageUri);
                }
            }  else {
                logger.info("DocBook image properties failed to interpret: " + imageUri);
            }
        } catch (Exception e) {
            logger.info("DocBook image properties failed to load image: " + imageUri);
        } finally {
            if (stream != null) {
                try {
                    stream.close();
                } catch (Exception e) {
                    // nop;
                }
            }
        }
    }

    protected XdmMap parseProperty(XdmMap map, String name, String value) {
        return parseProperty(map, name, value,-1);
    }

    protected XdmMap parseProperty(XdmMap map, String name, String value, int tagType) {
        logger.debug(DebuggingLogger.IMAGE_PROPERTIES, "Parsing image property: (" + tagType + ") " + name + "=" + value);

        // See https://github.com/drewnoakes/metadata-extractor/pull/488
        // It irks me sufficienlty to see the tag name "copyright" that I made a PR
        // to fix it and I'm going to override it here.
        if (tagType == IccDirectory.TAG_TAG_cprt) {
            name = "profile-copyright";
        }
        switch (name) {
            case "bounding-box":
                map = map.put(new XdmAtomicValue(name), new XdmAtomicValue(value));
                map = parseBox(map, value);
                break;
            case "image-width":
                try {
                    int width = Integer.parseInt(value);
                    map = map.put(new XdmAtomicValue("width"), new XdmAtomicValue(width));
                    map = map.put(new XdmAtomicValue(name), new XdmAtomicValue(width));
                } catch (NumberFormatException nfe) {
                    map = map.put(new XdmAtomicValue(name), new XdmAtomicValue(value));
                }
                break;
            case "image-height":
                try {
                    int height = Integer.parseInt(value);
                    map = map.put(new XdmAtomicValue("height"), new XdmAtomicValue(height));
                    map = map.put(new XdmAtomicValue(name), new XdmAtomicValue(height));
                } catch (NumberFormatException nfe) {
                    map = map.put(new XdmAtomicValue(name), new XdmAtomicValue(value));
                }
                break;
            case "width":
                // Only output this property if it's an integer
                try {
                    int width = Integer.parseInt(value);
                    map = map.put(new XdmAtomicValue("width"), new XdmAtomicValue(width));
                } catch (NumberFormatException nfe) {
                    // nevermind
                }
                break;
            case "height":
                // Only output this property if it's an integer
                try {
                    int height = Integer.parseInt(value);
                    map = map.put(new XdmAtomicValue("height"), new XdmAtomicValue(height));
                } catch (NumberFormatException nfe) {
                    // nevermind
                }
                break;
            default:
                if (value.matches("^[-+]?\\d+$")) {
                    map = map.put(new XdmAtomicValue(name), new XdmAtomicValue(Integer.parseInt(value)));
                } else if (value.matches("^[-+]\\d+\\.\\d+$")) {
                    map = map.put(new XdmAtomicValue(name), new XdmAtomicValue(Double.parseDouble(value)));
                } else {
                    map = map.put(new XdmAtomicValue(name), new XdmAtomicValue(value));
                }
        }

        return map;
    }

    private XdmMap parseBox(XdmMap map, String line) {
        int [] corners = new int [4];
        int count = 0;

        boolean ok = true;
        StringTokenizer st = new StringTokenizer(line);
        while (count < 4 && st.hasMoreTokens()) {
            try {
                corners[count++] = Integer.parseInt(st.nextToken());
            } catch (Exception e) {
                ok = false;
            }
        }

        if (ok && count == 4) {
            map = map.put(new XdmAtomicValue("width"), new XdmAtomicValue(corners[2] - corners[0]));
            map = map.put(new XdmAtomicValue("height"), new XdmAtomicValue(corners[3] - corners[1]));
        }

        return map;
    }

    private XdmMap parseSvg(XdmMap map, String url) {
        Configuration.ApiProvider api = context.getConfiguration().getProcessor();
        if (api instanceof Processor) {
            try {
                DocumentBuilder builder = ((Processor) api).newDocumentBuilder();
                builder.setDTDValidation(false);
                XdmNode doc = builder.build(new SAXSource(new InputSource(url)));
                XdmNode root = null;
                for (XdmSequenceIterator<XdmNode> it = doc.axisIterator(Axis.CHILD);
                     root == null && it.hasNext(); ) {
                    XdmNode node = it.next();
                    if (node.getNodeKind() == XdmNodeKind.ELEMENT) {
                        root = node;
                    }
                }
                if (root != null) {
                    if (svgNamespace.equals(root.getNodeName().getNamespaceURI())) {
                        for (XdmSequenceIterator<XdmNode> it = root.axisIterator(Axis.ATTRIBUTE); it.hasNext(); ) {
                            XdmNode attr = it.next();
                            String name = attr.getNodeName().getClarkName();
                            String value = attr.getStringValue();
                            map = parseProperty(map, name, value);
                        }
                    }
                }
            } catch (SaxonApiException sae) {
                logger.info("DocBook image properties failed to parse SVG: " + url);
            }
        } else {
            logger.debug(DebuggingLogger.IMAGE_ERRORS, "DocBook image properties failed to find processor to parse SVG");
        }

        return map;
    }
}
