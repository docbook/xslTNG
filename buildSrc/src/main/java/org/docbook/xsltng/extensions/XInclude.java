package org.docbook.xsltng.extensions;

import com.nwalsh.xslt.XIncludeFunction;
import net.sf.saxon.Configuration;
import net.sf.saxon.expr.XPathContext;
import net.sf.saxon.lib.ExtensionFunctionCall;
import net.sf.saxon.lib.ExtensionFunctionDefinition;
import net.sf.saxon.ma.map.KeyValuePair;
import net.sf.saxon.ma.map.MapItem;
import net.sf.saxon.om.Item;
import net.sf.saxon.om.NodeInfo;
import net.sf.saxon.om.Sequence;
import net.sf.saxon.om.StructuredQName;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.XdmNode;
import net.sf.saxon.trans.XPathException;
import net.sf.saxon.type.BuiltInAtomicType;
import net.sf.saxon.value.QNameValue;
import net.sf.saxon.value.SequenceType;

import java.util.HashMap;

/**
 * Saxon extension to perform XInclude. This is just a wrapper around the
 * version from https://github.com/ndw/sinclude. The wrapper means they
 * share an implementation but they have the same extension namespace.
 * And they can be registered with a single -init call.
 */

public class XInclude extends XIncludeFunction {
    private static final StructuredQName qName =
            new StructuredQName("", "http://docbook.org/extensions/xslt", "xinclude");

    @Override
    public StructuredQName getFunctionQName() {
        return qName;
    }
}