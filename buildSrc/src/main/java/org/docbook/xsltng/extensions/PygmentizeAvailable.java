package org.docbook.xsltng.extensions;

import net.sf.saxon.expr.XPathContext;
import net.sf.saxon.lib.ExtensionFunctionCall;
import net.sf.saxon.om.Sequence;
import net.sf.saxon.om.StructuredQName;
import net.sf.saxon.value.BooleanValue;
import net.sf.saxon.value.SequenceType;

/**
 * Saxon extension to run the pygments source highlighter.
 *
 * This class provides a
 * <a href="http://saxonica.com/">Saxon</a>
 * extension to run report if pygmentize is available.
 *
 * <p>Copyright © 2019-2020 Norman Walsh.</p>
 *
 * @author Norman Walsh
 * <a href="mailto:ndw@nwalsh.com">ndw@nwalsh.com</a>
 */

public class PygmentizeAvailable extends PygmentizeDefinition {
    private static final StructuredQName qName =
            new StructuredQName("", "http://docbook.org/extensions/xslt", "pygmentize-available");

    public PygmentizeAvailable() {
        computeExecutable();
    }

    @Override
    public StructuredQName getFunctionQName() {
        return qName;
    }

    @Override
    public int getMinimumNumberOfArguments() {
        return 0;
    }

    @Override
    public int getMaximumNumberOfArguments() {
        return 0;
    }

    @Override
    public SequenceType[] getArgumentTypes() {
        // If it takes no arguments, what's this for?
        return new SequenceType[]{SequenceType.OPTIONAL_NUMERIC};
    }

    @Override
    public SequenceType getResultType(SequenceType[] suppliedArgumentTypes) {
        return SequenceType.SINGLE_BOOLEAN;
    }

    public ExtensionFunctionCall makeCallExpression() {
        return new PygmentizeAvailable.CallPygmentize();
    }

    private class CallPygmentize extends PygmentizeCall {
        public Sequence call(XPathContext xpathContext, Sequence[] sequences) {
            logger = new DebuggingLogger(xpathContext.getConfiguration().getLogger());
            if (foundPygmentize == null) {
                foundPygmentize = (findPygmentize(xpathContext.getConfiguration(), executable, true) != null);
            }
            return BooleanValue.get(foundPygmentize);
        }
    }
}
