package org.docbook.xsltng.extensions;

import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import net.sf.saxon.expr.XPathContext;
import net.sf.saxon.lib.ExtensionFunctionCall;
import net.sf.saxon.lib.ExtensionFunctionDefinition;
import net.sf.saxon.om.Sequence;
import net.sf.saxon.om.StructuredQName;
import net.sf.saxon.trans.XPathException;
import net.sf.saxon.value.SequenceType;

import java.io.*;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class ImageMetadata extends ExtensionFunctionDefinition {
    private static final StructuredQName qName =
            new StructuredQName("", "http://docbook.org/extensions/xslt", "image-metadata");

    private final static String[] controls = new String[] {
            "0000", "0001", "0002", "0003", "0004", "0005", "0006", "0007",
            "0008",                 "000b", "000c",         "000e", "000f",
            "0010", "0011", "0012", "0013", "0014", "0015", "0016", "0017",
            "0018", "0019", "001a", "001b", "001c", "001d", "001e", "001f",
            "007c" };


    @Override
    public StructuredQName getFunctionQName() {
        return qName;
    }

    @Override
    public int getMinimumNumberOfArguments() {
        return 1;
    }

    @Override
    public int getMaximumNumberOfArguments() {
        return 2;
    }

    @Override
    public SequenceType[] getArgumentTypes() {
        return new SequenceType[]{SequenceType.SINGLE_STRING, SequenceType.SINGLE_BOOLEAN};
    }

    @Override
    public SequenceType getResultType(SequenceType[] suppliedArgumentTypes) {
        return SequenceType.SINGLE_ITEM;
    }

    public ExtensionFunctionCall makeCallExpression() {
        return new ImageMetadata.PropertiesCall();
    }

    private class PropertiesCall extends ImageCall {
        public Sequence call(XPathContext xpathContext, Sequence[] sequences) throws XPathException {
            context = xpathContext;
            logger = new DebuggingLogger(xpathContext.getConfiguration().getLogger());
            String imageUri = sequences[0].head().getStringValue();
            boolean isImage = true;

            if (sequences.length > 1) {
                isImage = "true".equals(sequences[1].head().getStringValue());
            }

            InputStream stream = null;
            try {
                final URI uri;
                File imageFile = new File(imageUri);
                if (imageFile.exists()) {
                    uri = imageFile.toURI();
                } else {
                    uri = new URI(imageUri);
                }

                if ("data".equals(uri.getScheme())) {
                    stream = dataUriStream(uri);
                } else {
                    stream = uri.toURL().openStream();
                }

                Metadata metadata = ImageMetadataReader.readMetadata(stream);
                processDirectory(metadata);

                return map.getUnderlyingValue();
            } catch (URISyntaxException use) {
                logger.info("ext:image-metadata unparsable: " + imageUri + ": " + use.getMessage());
                return map.getUnderlyingValue();
            } catch (IOException ioe) {
                logger.info("ext:image-metadata unreadable: " + imageUri + ": " + ioe.getMessage());
                return map.getUnderlyingValue();
            } catch (ImageProcessingException ipe) {
                // Fall through and see what we can read
            } finally {
                if (stream != null) {
                    try {
                        stream.close();
                    } catch (Exception e) {
                        // nop;
                    }
                }
            }

            // If metadata-extractor couldn't load the metadata,
            // there's still the chance that it's a PDF or an SVG
            if (isImage) {
                parseImage(imageUri);
            }

            return map.getUnderlyingValue();
        }

        private InputStream dataUriStream(URI uri) throws URISyntaxException, IOException {
            String href = uri.toString();
            String path = href.substring(5);
            int pos = path.indexOf(",");
            if (pos >= 0) {
                String mediatype = path.substring(0, pos);
                String data = path.substring(pos + 1);
                if (mediatype.endsWith(";base64")) {
                    // Base64 decode it
                    return new ByteArrayInputStream(Base64.getDecoder().decode(data));
                } else {
                    // URL decode it
                    String charset = "UTF-8";
                    pos = mediatype.indexOf(";charset=");
                    if (pos > 0) {
                        charset = mediatype.substring(pos + 9);
                        pos = charset.indexOf(";");
                        if (pos >= 0) {
                            charset = charset.substring(0, pos);
                        }
                    }
                    data = URLDecoder.decode(data, charset);
                    return new ByteArrayInputStream(data.getBytes(StandardCharsets.UTF_8));
                }
            } else {
                throw new URISyntaxException(href, "Comma separator missing");
            }
        }

        private void processDirectory(Metadata metadata) {
            // iterate through metadata directories
            for (Directory directory : metadata.getDirectories()) {
                for (Tag tag : directory.getTags()) {
                    String name = tag.getTagName().toLowerCase();
                    name = name.replace(" ", "-");

                    String value = tag.getDescription();
                    if (value == null) {
                        value = "";
                    }

                    // Laboriously escape all the control characters with \\uxxxx, but first replace
                    // \\uxxxx with \\u005cuxxxx so we don't inadvertantly change the meaning of a string
                    value = value.replaceAll("\\\\u([0-9a-fA-F]{4}+)", "\\\\u005cu$1");
                    for (String control : controls) {
                        String match = "^.*\\\\u" + control + ".*$";
                        if (value.matches(match)) {
                            value = value.replaceAll("[\\\\u" + control + "]", "\\\\u" + control);
                        }
                    }

                    // Bah humbug...I don't see an easy way to tell if it's actually a date/time
                    if (value.matches("^\\d\\d\\d\\d:\\d\\d:\\d\\d \\d\\d:\\d\\d:\\d\\d$")) {
                        value = value.substring(0, 4) + "-" + value.substring(5, 7) + "-" + value.substring(8, 10)
                                + "T" + value.substring(11, 19);
                    }

                    map = parseProperty(map, name, value, tag.getTagType());
                }
            }
        }
    }
}
