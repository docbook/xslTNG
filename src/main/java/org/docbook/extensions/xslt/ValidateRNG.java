package org.docbook.extensions.xslt;

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
import net.sf.saxon.s9api.QName;
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
import org.iso_relax.verifier.Schema;
import org.iso_relax.verifier.Verifier;
import org.iso_relax.verifier.VerifierConfigurationException;
import org.iso_relax.verifier.VerifierFactory;
import org.xml.sax.ErrorHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import java.io.ByteArrayInputStream;
import java.io.CharArrayWriter;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
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
        public Sequence call(XPathContext context, Sequence[] sequences) throws XPathException {
            NodeInfo source = (NodeInfo) sequences[0].head();
            HashMap<String,String> options = new HashMap<>();
            NodeInfo schema = null;
            String schemaFile = null;
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

            boolean assertValid = getBooleanOption(options, "assert-valid", true);
            boolean dtdCompatibility = getBooleanOption(options, "dtd-compatibility", false);

            boolean valid = false;
            RNGErrorHandler handler = new RNGErrorHandler();

            try {
                VerifierFactory factory = VerifierFactory.newInstance("http://relaxng.org/ns/structure/1.0");
                Processor processor = (Processor) context.getConfiguration().getProcessor();

                Schema docSchema = null;
                CharArrayWriter writer = null;
                Serializer serializer = null;
                ByteArrayInputStream istream = null;

                if (schema == null) {
                    // Cheap and cheerful.
                    try {
                        URL usource = new URL(schemaFile);
                        docSchema = factory.compileSchema(usource.openStream());
                    } catch (MalformedURLException mue) {
                        docSchema = factory.compileSchema(new File(schemaFile));
                    }
                } else {
                    // Hack!
                    writer = new CharArrayWriter();
                    serializer = processor.newSerializer();
                    serializer.setOutputWriter(writer);
                    serializer.serialize(schema);
                    istream = new ByteArrayInputStream(writer.toString().getBytes(StandardCharsets.UTF_8));
                    docSchema = factory.compileSchema(istream, schema.getBaseURI());
                }

                writer = new CharArrayWriter();
                serializer = processor.newSerializer();
                serializer.setOutputWriter(writer);
                serializer.serialize(source);
                istream = new ByteArrayInputStream(writer.toString().getBytes(StandardCharsets.UTF_8));
                InputSource docSource = new InputSource(istream);

                Verifier verifier = docSchema.newVerifier();
                verifier.setErrorHandler(handler);
                valid = verifier.verify(docSource);
            } catch (VerifierConfigurationException | SaxonApiException | IOException | SAXException vce) {
                throw new RuntimeException(vce);
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
    
            return map.getUnderlyingValue();
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

    class RNGErrorHandler implements ErrorHandler {
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
}
