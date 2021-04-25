package org.docbook.xsltng.extensions;

import com.drew.imaging.ImageMetadataReader;
import com.drew.metadata.Metadata;
import org.docbook.xsltng.BuildConfig;
import net.sf.saxon.Configuration;
import net.sf.saxon.lib.Initializer;

import java.io.ByteArrayInputStream;
import java.util.Base64;

public class Register implements Initializer {
    @Override
    public void initialize(Configuration config) {
        // Unfortunately, Saxon doesn't have a .debug() method on its standard logger
        DebuggingLogger logger = new DebuggingLogger(config.getLogger());

        logger.debug(DebuggingLogger.REGISTRATION, "Registering " + BuildConfig.TITLE + " extension functions (version " + BuildConfig.VERSION + ")");

        //System.err.println("Registering DocBook extension functions...");
        config.registerExtensionFunction(new Cwd());
        config.registerExtensionFunction(new ImageProperties());
        try {
            String gif1x1 = "R0lGODlhAQABAPAAAP///wAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==";
            byte[] decoded = Base64.getDecoder().decode(gif1x1);
            ByteArrayInputStream stream = new ByteArrayInputStream(decoded);
            Metadata metadata = ImageMetadataReader.readMetadata(stream);
            if (metadata != null) {
                config.registerExtensionFunction(new ImageMetadata());
            }
        } catch (Exception e) {
            logger.debug(DebuggingLogger.REGISTRATION, BuildConfig.TITLE + " extension function ext:image-metadata unavailable");
            // Ignore it; this is intended to catch the case where
            // the metadata-extractor classes aren't on the classpath.
        }
        config.registerExtensionFunction(new Pygmentize());
        config.registerExtensionFunction(new PygmentizeAvailable());
        config.registerExtensionFunction(new XInclude());
        config.registerExtensionFunction(new ValidateRNG());
    }
}
