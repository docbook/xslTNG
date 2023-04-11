package org.docbook.xsltng.extensions;

import com.thaiopensource.resolver.AbstractResolver;
import com.thaiopensource.resolver.BasicResolver;
import com.thaiopensource.resolver.Identifier;
import com.thaiopensource.resolver.Input;
import com.thaiopensource.resolver.ResolverException;
import com.thaiopensource.resolver.catalog.ResolverIOException;
import com.thaiopensource.resolver.xml.ExternalDTDSubsetIdentifier;
import com.thaiopensource.resolver.xml.ExternalEntityIdentifier;
import com.thaiopensource.resolver.xml.ExternalIdentifier;
import com.thaiopensource.util.PropertyMapBuilder;
import com.thaiopensource.validate.SchemaReader;
import com.thaiopensource.validate.ValidateProperty;
import com.thaiopensource.validate.ValidationDriver;
import com.thaiopensource.validate.prop.rng.RngProperty;
import com.thaiopensource.validate.rng.CompactSchemaReader;
import net.sf.saxon.expr.XPathContext;
import net.sf.saxon.lib.ExtensionFunctionCall;
import net.sf.saxon.lib.ExtensionFunctionDefinition;
import net.sf.saxon.ma.map.KeyValuePair;
import net.sf.saxon.ma.map.MapItem;
import net.sf.saxon.om.Item;
import net.sf.saxon.om.NodeInfo;
import net.sf.saxon.om.Sequence;
import net.sf.saxon.om.StructuredQName;
import net.sf.saxon.s9api.Processor;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.Serializer;
import net.sf.saxon.s9api.XdmArray;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmMap;
import net.sf.saxon.s9api.XdmNode;
import net.sf.saxon.trans.XPathException;
import net.sf.saxon.type.BuiltInAtomicType;
import net.sf.saxon.value.SequenceType;
import net.sf.saxon.value.StringValue;
import org.xml.sax.ErrorHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xmlresolver.Resolver;
import org.xmlresolver.XMLResolverConfiguration;
import org.xmlresolver.sources.ResolverInputSource;
import org.xmlresolver.sources.ResolverSAXSource;

import javax.xml.transform.TransformerException;
import java.io.ByteArrayInputStream;
import java.io.CharArrayWriter;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;

public class ValidateRNG extends ExtensionFunctionDefinition {
    private static final StructuredQName qName =
            new StructuredQName("", "http://docbook.org/extensions/xslt", "validate-with-relax-ng");

    @Override
    public StructuredQName getFunctionQName() {
        return qName;
    }

    @Override
    public int getMinimumNumberOfArguments() {
        return 2;
    }

    @Override
    public int getMaximumNumberOfArguments() {
        return 3;
    }

    @Override
    public SequenceType[] getArgumentTypes() {
        return new SequenceType[]{SequenceType.SINGLE_NODE, SequenceType.SINGLE_ITEM, SequenceType.OPTIONAL_ITEM};
    }

    @Override
    public SequenceType getResultType(SequenceType[] suppliedArgumentTypes) {
        return SequenceType.SINGLE_ITEM;
    }

    public ExtensionFunctionCall makeCallExpression() {
        return new ValidateRNG.PropertiesCall();
    }

    private class PropertiesCall extends ExtensionFunctionCall {
        NodeInfo source = null;
        NodeInfo schema = null;
        String schemaFile = null;
        boolean assertValid = false;
        boolean dtdCompatibility = false;
        Boolean compactSyntax = null;
        String encoding = null;

        public Sequence call(XPathContext context, Sequence[] sequences) throws XPathException {
            source = (NodeInfo) sequences[0].head();
            HashMap<String,String> options = new HashMap<>();
            Item item = null;

            if (sequences.length > 2) {
                item = sequences[2].head();
                if (item != null) {
                    if (item instanceof MapItem) {
                        options = parseMap((MapItem) item);
                    } else {
                        throw new IllegalArgumentException("ext:validate-with-relax-ng options must be a map");
                    }
                }
            }

            item = sequences[1].head();
            if (item instanceof StringValue) {
                schemaFile = item.getStringValue();
            } else {
                if (item instanceof NodeInfo) {
                    schema = (NodeInfo) item;
                } else {
                    throw new IllegalArgumentException("ext:validate-with-relax-ng invalid schema");
                }
            }

            assertValid = getBooleanOption(options, "assert-valid", true);
            dtdCompatibility = getBooleanOption(options, "dtd-compatibility", false);
            if (options.containsKey("compact-syntax")) {
                compactSyntax = getBooleanOption(options, "compact-syntax", false);
            }
            if (compactSyntax != null && compactSyntax) {
                encoding = options.getOrDefault("encoding", "UTF-8");
            }

            XdmMap map = jingValid(context);
            return map.getUnderlyingValue();
        }

        private XdmMap jingValid(XPathContext context) {
            boolean valid = false;
            RNGErrorHandler handler = new RNGErrorHandler();

            PropertyMapBuilder properties = new PropertyMapBuilder();
            properties.put(ValidateProperty.ERROR_HANDLER, handler);

            RngProperty.CHECK_ID_IDREF.add(properties);
            if (!dtdCompatibility) {
                properties.put(RngProperty.CHECK_ID_IDREF, null);
            }

            JingResolver resolver = new JingResolver();
            properties.put(ValidateProperty.RESOLVER, resolver);

            SchemaReader sr = (compactSyntax != null && compactSyntax) ? CompactSchemaReader.getInstance() : null;
            try {
                ValidationDriver driver = new ValidationDriver(properties.toPropertyMap(), properties.toPropertyMap(), sr);
                InputSource insrc = null;
                if (schema == null) {
                    insrc = ValidationDriver.uriOrFileInputSource(schemaFile);
                    if (encoding != null) {
                        insrc.setEncoding(encoding);
                    }
                } else {
                    insrc = nodeInfoToInputSource(context, schema);
                }

                boolean triedRNC = false;
                boolean loaded = false;
                try {
                    loaded = driver.loadSchema(insrc);
                } catch (SAXException ex) {
                    // If the user didn't specify compact-syntax and the schemaFile ends with ".rnc"
                    // try loading the schema using the compact syntax.
                    if (compactSyntax == null && schemaFile != null && schemaFile.endsWith(".rnc")) {
                        triedRNC = true;

                        // Replace the error handler so we don't get the SAXException on the RNC file
                        handler = new RNGErrorHandler();
                        properties.put(ValidateProperty.ERROR_HANDLER, handler);

                        sr = CompactSchemaReader.getInstance();
                        driver = new ValidationDriver(properties.toPropertyMap(), properties.toPropertyMap(), sr);
                        insrc = ValidationDriver.uriOrFileInputSource(schemaFile);
                        if (encoding != null) {
                            insrc.setEncoding(encoding);
                        }
                        loaded = driver.loadSchema(insrc);
                    }
                }

                if (loaded) {
                    insrc = nodeInfoToInputSource(context, source);
                    valid = driver.validate(insrc);
                } else {
                    if (triedRNC) {
                        throw new IllegalArgumentException("Failed to load schema (tried RNG and RNC): " + schemaFile);
                    }
                    throw new IllegalArgumentException("Failed to load schema: " + schemaFile);
                }
            } catch (SAXException | IOException ioe) {
                ioe.printStackTrace();
                throw new IllegalArgumentException(ioe);
            }

            if (!valid && assertValid) {
                throw new RuntimeException("Invalid document: " + handler.getError().getMessage());
            }

            XdmMap map = new XdmMap();
            map = map.put(new XdmAtomicValue("valid"), new XdmAtomicValue(valid));
            map = map.put(new XdmAtomicValue("document"), new XdmNode(source));
            if (!valid) {
                map = map.put(new XdmAtomicValue("errors"), handler.getErrors());
            }

            return map;
        }
    }

    private InputSource nodeInfoToInputSource(XPathContext context, NodeInfo source) {
        // This is a horrible hack
        try {
            Processor processor = (Processor) context.getConfiguration().getProcessor();
            CharArrayWriter writer = new CharArrayWriter();
            Serializer serializer = processor.newSerializer();
            serializer.setOutputWriter(writer);
            serializer.serialize(source);
            ByteArrayInputStream istream = new ByteArrayInputStream(writer.toString().getBytes(StandardCharsets.UTF_8));
            return new InputSource(istream);
        } catch (SaxonApiException se) {
            // I don't think this can actually happen here.
            throw new IllegalArgumentException(se);
        }
    }

    private boolean getBooleanOption(HashMap<String,String> options, String name, boolean defvalue) {
        if (options.containsKey(name)) {
            String value = options.get(name);
            if ("true".equals(value) || "false".equals(value)) {
                return "true".equals(value);
            }
            if ("1".equals(value) || "0".equals(value)) {
                return "1".equals(value);
            }
            if ("yes".equals(value) || "no".equals(value)) {
                return "yes".equals(value);
            }
            throw new IllegalArgumentException("Boolean option " + name + " cannot be " + value);
        }
        return defvalue;
    }

    private HashMap<String,String> parseMap(MapItem item) throws XPathException {
        HashMap<String,String> options = new HashMap<>();
        for (KeyValuePair kv : item.keyValuePairs()) {
            String key = null;
            if (kv.key.getItemType() == BuiltInAtomicType.STRING) {
                key = kv.key.getStringValue();
            } else {
                throw new IllegalArgumentException("Option map keys must be strings");
            }
            String value = kv.value.getStringValue();
            options.put(key, value);
        }
        return options;
    }

    static class RNGErrorHandler implements ErrorHandler {
        SAXParseException error = null;
        XdmArray errors = new XdmArray();

        public SAXParseException getError() {
            return error;
        }

        public XdmArray getErrors() {
            return errors;
        }

        private void addError(SAXParseException err, String etype) {
            XdmMap map = new XdmMap();
            map = map.put(new XdmAtomicValue("type"), new XdmAtomicValue(etype));
            map = map.put(new XdmAtomicValue("error"), new XdmAtomicValue(err.getMessage()));
            if (err.getLineNumber() > 0) {
                map = map.put(new XdmAtomicValue("line"), new XdmAtomicValue(err.getLineNumber()));
            }
            if (err.getColumnNumber() > 0) {
                map = map.put(new XdmAtomicValue("column"), new XdmAtomicValue(err.getColumnNumber()));
            }
            errors = errors.addMember(map);
        }

        @Override
        public void warning(SAXParseException exception) throws SAXException {
            addError(exception, "warning");
        }

        @Override
        public void error(SAXParseException exception) throws SAXException {
            addError(exception, "error");
            if (error == null) {
                error = exception;
            }
        }

        @Override
        public void fatalError(SAXParseException exception) throws SAXException {
            addError(exception, "fatal-error");
            error = exception;
        }
    }

    class JingResolver extends AbstractResolver {
        private final Resolver resolver;

        public JingResolver() {
            XMLResolverConfiguration config = new XMLResolverConfiguration();
            resolver = new Resolver(config);
        }

        public void resolve(Identifier id, Input input) throws IOException, ResolverException {
            // Largely copied from the com.thaiopensource classes, by way of the relaxng-gradle
            // plugin: https://github.com/ndw/relaxng-gradle

            if (input.isResolved()) {
                return;
            }

            String absoluteUri = null;
            try {
                absoluteUri = BasicResolver.resolveUri(id);
                if (id.getUriReference().equals(absoluteUri)) {
                    absoluteUri = null;
                }
            } catch (ResolverException ex) {
                // ignore
            }

            boolean isExternalIdentifier = (id instanceof ExternalIdentifier);

            try {
                if (isExternalIdentifier) {
                    ResolverInputSource resolved = null;
                    if (absoluteUri != null) {
                        resolved = (ResolverInputSource) resolver.resolveEntity(null, absoluteUri);
                    }
                    if (resolved == null) {
                        if (id instanceof ExternalEntityIdentifier) {
                            ExternalEntityIdentifier xid = (ExternalEntityIdentifier) id;
                            resolved = (ResolverInputSource) resolver.resolveEntity(xid.getEntityName(), xid.getPublicId(),
                                    null, xid.getUriReference());
                        } else if (id instanceof ExternalDTDSubsetIdentifier) {
                            ExternalDTDSubsetIdentifier xid = (ExternalDTDSubsetIdentifier) id;
                            resolved = (ResolverInputSource) resolver.getExternalSubset(xid.getDoctypeName(), xid.getUriReference());
                        } else {
                            ExternalIdentifier xid = (ExternalIdentifier) id;
                            resolved = (ResolverInputSource) resolver.resolveEntity(xid.getPublicId(), xid.getUriReference());
                        }
                    }

                    if (resolved != null) {
                        input.setUri(resolved.getSystemId());
                        input.setByteStream(resolved.getByteStream());
                    }
                } else {
                    ResolverSAXSource resolved = null;
                    if (absoluteUri != null) {
                        resolved = ((ResolverSAXSource) resolver.resolve(absoluteUri, (String) null));
                    }

                    if (resolved == null) {
                        resolved = (ResolverSAXSource) resolver.resolve(id.getUriReference(), null);
                    }

                    if (resolved != null) {
                        input.setUri(resolved.getInputSource().getSystemId());
                        input.setByteStream(resolved.getInputSource().getByteStream());
                    }
                }
            } catch (SAXException | TransformerException se) {
                throw new RuntimeException(se);
            } catch (ResolverIOException e) {
                throw e.getResolverException();
            }
            try {
                if (isExternalIdentifier) {
                    ResolverInputSource resolved = null;
                    if (absoluteUri != null) {
                        resolved = (ResolverInputSource) resolver.resolveEntity(null, absoluteUri);
                    }
                    if (resolved == null) {
                        if (id instanceof ExternalEntityIdentifier) {
                            ExternalEntityIdentifier xid = (ExternalEntityIdentifier) id;
                            resolved = (ResolverInputSource) resolver.resolveEntity(xid.getEntityName(), xid.getPublicId(),
                                    null, xid.getUriReference());
                        } else if (id instanceof ExternalDTDSubsetIdentifier) {
                            ExternalDTDSubsetIdentifier xid = (ExternalDTDSubsetIdentifier) id;
                            resolved = (ResolverInputSource) resolver.getExternalSubset(xid.getDoctypeName(), xid.getUriReference());
                        } else {
                            ExternalIdentifier xid = (ExternalIdentifier) id;
                            resolved = (ResolverInputSource) resolver.resolveEntity(xid.getPublicId(), xid.getUriReference());
                        }
                    }

                    if (resolved != null) {
                        input.setUri(resolved.getSystemId());
                        input.setByteStream(resolved.getByteStream());
                    }
                } else {
                    ResolverSAXSource resolved = null;
                    if (absoluteUri != null) {
                        resolved = ((ResolverSAXSource) resolver.resolve(absoluteUri, (String) null));
                    }

                    if (resolved == null) {
                        resolved = (ResolverSAXSource) resolver.resolve(id.getUriReference(), null);
                    }

                    if (resolved != null) {
                        input.setUri(resolved.getInputSource().getSystemId());
                        input.setByteStream(resolved.getInputSource().getByteStream());
                    }
                }
            } catch (SAXException | TransformerException se) {
                throw new RuntimeException(se);
            } catch (ResolverIOException e) {
                throw e.getResolverException();
            }
        }

        public void open(Input input) throws IOException, ResolverException {
            if (!input.isUriDefinitive()) {
                return;
            }

            URI uri;
            try {
                uri = new URI(input.getUri());
            } catch (URISyntaxException e) {
                throw new ResolverException(e);
            }

            if (!uri.isAbsolute()) {
                throw new ResolverException("cannot open relative URI: " + uri);
            }

            URL url = new URL(uri.toASCIIString());
            // XXX should set the encoding properly
            // XXX if this is HTTP and we've been redirected, should do input.setURI with the new URI
            input.setByteStream(url.openStream());
        }
    }
}
