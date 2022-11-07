package org.docbook.xsltng.extensions;

import net.sf.saxon.expr.XPathContext;
import net.sf.saxon.lib.ExtensionFunctionCall;
import net.sf.saxon.lib.ExtensionFunctionDefinition;
import net.sf.saxon.om.Sequence;
import net.sf.saxon.om.StructuredQName;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.trans.XPathException;
import net.sf.saxon.value.SequenceType;

import java.awt.*;
import java.awt.image.ImageObserver;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.regex.Pattern;

import static java.lang.Thread.sleep;

/**
 * Saxon extension to obtain the intrinsic size of images.
 *
 * This class provides a
 * <a href="http://saxonica.com/">Saxon</a>
 * extension to find the intrinsic size of images.
 *
 * <p>The function attempts to load the image with the AWT Image toolkit. If that fails,
 * it searches for a bounding box (present in, e.g., EPS and PDF images).
 *
 * <p>If the image can be loaded or a bounding box is found, the width and height
 * of the image are returned.
 *
 * <p>Copyright © 2002-2020 Norman Walsh.</p>
 *
 * @author Norman Walsh
 * <a href="mailto:ndw@nwalsh.com">ndw@nwalsh.com</a>
 */
public class ImageProperties extends ExtensionFunctionDefinition {
    private static final StructuredQName qName =
            new StructuredQName("", "http://docbook.org/extensions/xslt", "image-properties");

    private static final Pattern dimPatn = Pattern.compile("^(\\d+(\\.\\d*)?)(.*)$");

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
        return 1;
    }

    @Override
    public SequenceType[] getArgumentTypes() {
        return new SequenceType[]{SequenceType.SINGLE_STRING};
    }

    @Override
    public SequenceType getResultType(SequenceType[] suppliedArgumentTypes) {
        return SequenceType.SINGLE_ITEM;
    }

    public ExtensionFunctionCall makeCallExpression() {
        return new PropertiesCall();
    }

    private class PropertiesCall extends ImageCall implements ImageObserver {
        boolean imageLoaded = false;
        boolean imageFailed = false;
        Image image = null;
        int width = -1;
        int depth = -1;

        public Sequence call(XPathContext xpathContext, Sequence[] sequences) throws XPathException {
            context = xpathContext;
            logger = new DebuggingLogger(xpathContext.getConfiguration().getLogger());
            String imageFn = sequences[0].head().getStringValue();

            imageLoaded = false;
            imageFailed = false;
            image = null;

            System.setProperty("java.awt.headless", "true");

            try {
                final URL url;
                File imageFile = new File(imageFn);
                if (imageFile.exists()) {
                    url = imageFile.toURI().toURL();
                } else {
                    url = new URL(imageFn);
                }
                image = Toolkit.getDefaultToolkit().getImage (url);
            } catch (MalformedURLException mue) {
                image = Toolkit.getDefaultToolkit().getImage (imageFn);
            }

            width = image.getWidth(this);
            depth = image.getHeight(this);

            while (!imageFailed && (width == -1 || depth == -1)) {
                try {
                    sleep(50);
                } catch (Exception e) {
                    // nop;
                }
                width = image.getWidth(this);
                depth = image.getHeight(this);
            }

            image.flush();

            if (width >= 0 && depth >= 0) {
                map = map.put(new XdmAtomicValue("width"), new XdmAtomicValue(width));
                map = map.put(new XdmAtomicValue("height"), new XdmAtomicValue(depth));
            }

            if ((width == -1 || depth == -1) && imageFailed) {
                parseImage(imageFn);
            }

            return map.getUnderlyingValue();
        }

        public boolean imageUpdate(Image img, int infoflags,
                                   int x, int y, int width, int height) {
            if (((infoflags & ImageObserver.ERROR) == ImageObserver.ERROR)
                    || ((infoflags & ImageObserver.ABORT) == ImageObserver.ABORT)) {
                imageFailed = true;
                return false;
            }

            // I really only care about the width and height, but if I return false as
            // soon as those are available, the BufferedInputStream behind the loader
            // gets closed too early.
            return (infoflags & ImageObserver.ALLBITS) != ImageObserver.ALLBITS;
        }
    }
}
