package org.docbook.extensions.xslt;

import net.sf.saxon.expr.XPathContext;
import net.sf.saxon.lib.ExtensionFunctionCall;
import net.sf.saxon.ma.map.KeyValuePair;
import net.sf.saxon.ma.map.MapItem;
import net.sf.saxon.om.Item;
import net.sf.saxon.om.Sequence;
import net.sf.saxon.om.StructuredQName;
import net.sf.saxon.trans.XPathException;
import net.sf.saxon.value.SequenceType;
import net.sf.saxon.value.StringValue;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Saxon extension to run the pygments source highlighter.
 *
 * This class provides a
 * <a href="http://saxonica.com/">Saxon</a>
 * extension to run pygmentize.
 *
 * <p>Copyright © 2019-2020 Norman Walsh.</p>
 *
 * @author Norman Walsh
 * <a href="mailto:ndw@nwalsh.com">ndw@nwalsh.com</a>
 */

public class Pygmentize extends PygmentizeDefinition {
    private final String format = "html"; // no others are supported

    private static final StructuredQName qName =
            new StructuredQName("", "http://docbook.org/extensions/xslt", "pygmentize");

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
        return 3;
    }

    @Override
    public SequenceType[] getArgumentTypes() {
        return new SequenceType[]{SequenceType.SINGLE_STRING, SequenceType.OPTIONAL_ITEM, SequenceType.OPTIONAL_ITEM};
    }

    @Override
    public SequenceType getResultType(SequenceType[] suppliedArgumentTypes) {
        return SequenceType.SINGLE_ATOMIC;
    }

    public ExtensionFunctionCall makeCallExpression() {
        return new Pygmentize.CallPygmentize();
    }

    private class CallPygmentize extends PygmentizeCall {
        public Sequence call(XPathContext xpathContext, Sequence[] sequences) throws XPathException {
            logger = new DebuggingLogger(xpathContext.getConfiguration().getLogger());
            if (foundPygmentize == null) {
                pygmentize = findPygmentize(xpathContext.getConfiguration(), executable, false);
                if (pygmentize == null) {
                    logger.debug(DebuggingLogger.PYGMENTIZE_ERRORS, "Failed to find pygmentize: " + executable);
                }
            }

            String source = sequences[0].head().getStringValue();
            HashMap<String,String> options = new HashMap<>();
            HashMap<String,String> pyoptions = new HashMap<>();

            if (pygmentize == null) {
                return new StringValue(source);
            }

            if (sequences.length > 1) {
                Item item = sequences[1].head();
                if (item != null) {
                    if (item instanceof MapItem) {
                        options = parseMap((MapItem) item);
                    } else {
                        options.put("language", item.getStringValue());
                    }
                }
            }

            if (sequences.length > 2) {
                Item item = sequences[2].head();
                if (item != null) {
                    if (item instanceof MapItem) {
                        pyoptions = parseMap((MapItem) item);
                    } else {
                        logger.error("Third argument to ext:pygmentize is not a map: ignored");
                    }
                }
            }

            String language = null;
            if (options.containsKey("language")) {
                language = options.get("language");
            }

            List<String> cmdline = new ArrayList<String>();
            cmdline.add(pygmentize);
            cmdline.add("-f");
            cmdline.add(format);
            if (language != null) {
                cmdline.add("-l");
                cmdline.add(language);
            }

            for (String key : pyoptions.keySet()) {
                cmdline.add("-P");
                cmdline.add(key + "=" + pyoptions.get(key));
            }

            if (logger.enabled(DebuggingLogger.PYGMENTIZE_SHOW_COMMAND)) {
                StringBuilder sb = new StringBuilder();
                for (String s : cmdline) {
                    sb.append(s);
                    sb.append(" ");
                }
                logger.debug(DebuggingLogger.PYGMENTIZE_SHOW_COMMAND, "Pygments: " + sb.toString());
            }

            try {
                String html = runPygmentize(cmdline, source);

                if (logger.enabled(DebuggingLogger.PYGMENTIZE_SHOW_RESULTS)) {
                    logger.debug(DebuggingLogger.PYGMENTIZE_SHOW_RESULTS, "Highlighted: " + html);
                }

                return new StringValue(html);
            } catch (IOException ioe) {
                logger.warning("Pygments failed: " + ioe.getMessage());
                return new StringValue(source);
            }
        }

        private HashMap<String,String> parseMap(MapItem item) throws XPathException {
            HashMap<String,String> options = new HashMap<>();
            for (KeyValuePair kv : item.keyValuePairs()) {
                options.put(kv.key.getStringValue(), kv.value.getStringValue());
            }
            return options;
        }

        private String runPygmentize(List<String> cmdline, String source) throws IOException {
            ProcessBuilder builder = new ProcessBuilder(cmdline);
            Process process = builder.start();
            OutputStream os = process.getOutputStream();
            PrintStream ps = new PrintStream(os);
            ps.print(source);
            ps.close();
            os.close();

            ProcessOutputReader stdoutReader = new ProcessOutputReader(process.getInputStream());
            ProcessOutputReader stderrReader = new ProcessOutputReader(process.getErrorStream());

            Thread stdoutThread = new Thread(stdoutReader);
            Thread stderrThread = new Thread(stderrReader);

            stdoutThread.start();
            stderrThread.start();

            int rc = 0;
            try {
                rc = process.waitFor();
                stdoutThread.join();
                stderrThread.join();
            } catch (InterruptedException tie) {
                throw new RuntimeException(tie);
            }

            String errResult = stderrReader.getResult();
            if (!"".equals(errResult.trim())) {
                logger.warning(errResult);
            }

            return stdoutReader.getResult();
        }

        private class ProcessOutputReader implements Runnable {
            private InputStream is = null;
            private StringBuilder resultBuilder = null;

            public ProcessOutputReader(InputStream is) {
                this.is = is;
                resultBuilder = new StringBuilder();
            }

            public String getResult() {
                return resultBuilder.toString();
            }

            public void run() {
                // If we're not wrapping the lines, a buffered reader doesn't work. It can't
                // tell the difference between a file with a trailing EOL and one without.
                try {
                    InputStreamReader r = new InputStreamReader(is);
                    char[] buf = new char[4096];
                    int len = r.read(buf,0,buf.length);
                    while (len >= 0) {
                        if (len == 0) {
                            Thread.sleep(1000);
                            continue;
                        }
                        String s = new String(buf,0,len);
                        resultBuilder.append(s);
                        len = r.read(buf,0,buf.length);
                    }
                } catch (IOException ioe) {
                    System.err.println("Pygments I/O error: " + ioe.getMessage());
                } catch (InterruptedException ie) {
                    // who cares?
                }
            }
        }
    }
}
