#!/usr/bin/env python3

"""This is a wrapper script around the Saxon command line interface.
It attempts to make sure that the classpath is correct and that third
party and other libraries are available."""

import os
import sys
import json
import shutil
import subprocess
from pathlib import Path
from xml.dom.minidom import parse, Node


class JavaClassRunnerException(Exception):
    """Subclass of Exception for errors raised by the runner."""


class JavaClassRunner:
    """Executes a java process based on a set of parameters read from a
    configuration file. It constructs a class path that contains the
    transitive closure of all dependencies rooted at the modules listed
    in `maven-packages`. You must download the dependencies first,
    see https://xsltng.docbook.org/guide/ch02.html#python-script
    """

    # Yes, I have a lot of instance attributes. I'm also using camelCase names,
    # which aren't the Pythonic way, but they are the POM way. And I know some
    # methods could be functions.
    # pylint: disable=R0902,C0103,R0201

    def __init__(self, args):
        self.version = "@@VERSION@@"

        # The obvious thing to do here would be to make the seed
        # org.docbook:docbook-xslTNG:@@VERSION@@, but if we do that
        # then it's very hard to run the script in the build
        # environment because that version may not be published yet.
        # Instead, we rely on the fact that we can get the
        # docbook-xslTNG package from the distribution environment and
        # we seed with its dependencies.
        self.seeds = set(["@@PACKAGE_LIST@@"])

        self.config = {
            "maven-local": str(Path.home()) + "/.m2/repository",
            "maven-packages": [],
            "pinned-packages": ["xml-apis:xml-apis:1.4.01"],
            "excluded-packages": ["xml-resolver:xml-resolver:1.2",
                                  "org.jdom:jdom:*",
                                  "org.jdom:jdom2:*",
                                  "xom:xom:*",
                                  "dom4j:dom4j:*",
                                  "jline:jline:*",
                                  "org.apache.ws.commons.axiom:axiom:*",
                                  "org.apache.ws.commons.axiom:axiom-dom:*",
                                  "org.apache.ws.commons.axiom:axiom-impl:*"],
            "args": [],
            "classpath": [],
            "class": "net.sf.saxon.Transform",
        }
        self.depends = {}
        self._cp = {}
        self._seen = {}

        # This script assumes it's in /path/to/somewhere/docbook/bin/python
        # where "docbook" is the root of the distribution. If you move
        # this script into /usr/local/bin or something, it won't work.
        self.root = os.path.abspath(__file__)
        self.root = self.root[0:self.root.rfind(os.sep)]  # strip /docbook
        self.root = self.root[0:self.root.rfind(os.sep)]  # strip /bin

        self.config_file = str(Path.home()) + "/.docbook-xsltng.json"
        self.stylesheet = None
        self.output = None
        self.catalogs = []
        self.verbose = False
        self.debug = False
        self._java = None
        self._app_args = []

        self._parse_args(args)

        self.catalogs.append(f"{self.root}/xslt/catalog.xml")
        if not self.stylesheet:
            self.stylesheet = f"-xsl:{self.root}/xslt/docbook.xsl"
            self._app_args.append(self.stylesheet)

        try:
            with open(self.config_file, "r") as depfile:
                # There's a real potential for this to become a nest of hacks.
                # I want the excluded files to be a union of what the user
                # might have suggested and what the script suggests.
                excluded = self.config['excluded-packages']
                self.config = json.load(depfile)
                for package in excluded:
                    if package not in self.config['excluded-packages']:
                        self.config['excluded-packages'].append(package)
        except FileNotFoundError:
            with open(self.config_file, "w") as depfile:
                depfile.write(json.dumps(self.config, indent=2, sort_keys=True))

        self.verbose = self.verbose or self.config.get("verbose", False)

        if not self._java:
            self._java = self.config.get("java", shutil.which("java"))
            if not self._java:
                raise JavaClassRunnerException(
                    "The 'java' command is not on your path."
                )

        for pkg in self.config.get("maven-packages", []):
            self.seeds.add(pkg)

        if "class" not in self.config:
            raise JavaClassRunnerException("Configuration must specify 'class'")

        if "verbose" not in self.config:
            self.config["verbose"] = False

    # No, pylint, there aren't too many branches in this method.
    # pylint: disable=R0912
    def _parse_args(self, args):
        resources = None

        # Can't use any of the nice arg parsers here because these
        # are mostly args for Saxon.
        done = False
        for arg in args:
            if done:
                self._check_arg(arg)
            else:
                if arg == "--":
                    done = True
                elif arg.startswith("--config:"):
                    self.config_file = arg[9:]
                elif arg.startswith("--java:"):
                    self._java = arg[7:]
                elif arg.startswith("--root:"):
                    self.root = arg[7:]
                elif arg.startswith("--resources"):
                    if arg.startswith("--resources:"):
                        resources = arg[12:]
                    else:
                        resources = ""
                elif arg == "--help":
                    self._help()
                    sys.exit(0)
                elif arg == "--verbose":
                    self.verbose = True
                elif arg == "--debug":
                    self.debug = True
                else:
                    self._check_arg(arg)

        if resources is not None:
            if resources == "" and not self.output:
                self._message(f"Cannot determine output directory; ignoring --resources")
            else:
                if resources == "":
                    resources = os.path.abspath(self.output)
                    resources = os.path.dirname(resources)
                else:
                    resources = os.path.abspath(resources)
                self._configure_resources(resources)

    def _help(self):
        print(f"""DocBook xslTNG version @@VERSION@@

Usage: {sys.argv[0]} [options]

This helper script is a convenience wrapper around Saxon. It sets up
the Java classpath and automatically configures a catalog resolver and
the DocBook extension functions.

The initial options, all introduced by two hyphens, are interpreted by
this script. All the remaining options are passed directly to Saxon.

Options:
  --help            Print this message
  --config:file     Use 'file' as the configuration file. The default
                    configuration file is .docbook-xsltng.json in your
                    home directory.
  --java:file       Use 'file' as the Java executable. The default
                    java executable is the first one on your PATH.
  --root:dir        Use 'dir' as the "DocBook xslTNG" root directory.
                    This should be the location where you unzipped the
                    distribution.
  --resources[:dir] Copy stylesheet resources (CSS and JS files) to the
                    output 'dir'. If 'dir' is not specified, the output
                    directory is determined from the -o: option to Saxon.
  --help            Print this help message
  --verbose         Enable 'verbose' mode. This prints more messages.
  --debug           Enable 'debug' mode. Instead of running the
                    transformation, print out the command that would
                    have been run.
  --                Immediately stop interpreting options.

The Saxon options -x, -y, -r, and -init may not be specified as the
wrapper sets these automatically.
""")

    def _check_arg(self, arg):
        if ":" in arg:
            pos = arg.index(":")
            name = arg[0:pos]
            value = arg[(pos + 1):]
            if name in ("-x", "-y", "-r", "-init"):
                raise JavaClassRunnerException(
                    f"The {arg} option cannot be specified")
            if name == "-catalog":
                self.catalogs.append(value)
                return
            if name == "-xsl":
                self.stylesheet = arg
            elif name == "-o":
                self.output = value
        self._app_args.append(arg)

    def _message(self, message):
        if self.verbose:
            print(message)

    def _configure_resources(self, path):
        if os.path.isdir(f"{self.root}/resources/css"):
            rsrcroot = f"{self.root}/resources"
        elif os.path.isdir(f"{self.root}/stage/zip/resources/css"):
            rsrcroot = f"{self.root}/stage/zip/resources"
        else:
            self._message(f"Failed to find CSS under {self.root}: ignoring --resources")
            return

        # Make sure this is likely to succeed
        for fdir in (path, f"{path}/css"): ##, f"{path}/js"):
            try:
                if not os.path.isdir(fdir):
                    os.makedirs(fdir)
            except:
                self._message(f"Failed to create output directory: {path}")
                return

        pos = len(rsrcroot)
        for (root, dirs, files) in os.walk(rsrcroot):
            targetdir = path + root[pos:]
            for name in dirs:
                target = f"{targetdir}/{name}"
                if not os.path.isdir(target):
                    os.makedirs(target)
            for name in files:
                source = f"{root}/{name}"
                target = f"{targetdir}/{name}"
                shutil.copy2(source, target)

    def _pom(self, groupId, artifactId, version):
        groupPath = groupId.replace(".", "/")
        pom = f"{self.config['maven-local']}/"
        pom += f"{groupPath}/{artifactId}/{version}/{artifactId}-{version}.pom"
        try:
            with open(pom, "r") as pomfile:
                return parse(pomfile)
        except IOError:
            return None

    def _get_value(self, node, tag):
        for child in node.childNodes:
            if child.nodeType == Node.ELEMENT_NODE \
              and child.tagName == tag \
              and child.childNodes.length == 1:
                return child.childNodes[0].nodeValue
        return None

    def _jar(self, groupId, artifactId, version):
        mavenLocal = self.config["maven-local"]
        jardir = groupId.replace(".", "/")
        jardir = f"{mavenLocal}/{jardir}/{artifactId}/{version}"
        jarfile = f"{jardir}/{artifactId}-{version}.jar"
        if os.path.exists(jarfile):
            return jarfile
        return None

    def _skip(self, groupId, artifactId, version):
        return (groupId is None or "${" in groupId
                or artifactId is None or "${" in artifactId
                or version is None or "${" in version)

    def _save_config(self):
        with open(self.config_file, "w") as depfile:
            depfile.write(json.dumps(self.config, indent=2, sort_keys=True))

    def _update_dependencies(self, groupId, artifactId, version):
        #self._message(f"Update {groupId}:{artifactId}:{version}")

        if groupId not in self.depends:
            self.depends[groupId] = {}

        if artifactId not in self.depends[groupId]:
            self.depends[groupId][artifactId] = {}

        if version in self.depends[groupId][artifactId]:
            return

        if f"{groupId}:{artifactId}:{version}" in self.config["excluded-packages"] \
            or f"{groupId}:{artifactId}:*" in self.config["excluded-packages"]:
            return

        jar = self._jar(groupId, artifactId, version)
        if not jar:
            self._message(f"No jar: {groupId}:{artifactId}:{version}")
            return

        pkgconfig = {}
        pkgconfig["jar"] = jar
        pkgconfig["dependencies"] = []
        self.depends[groupId][artifactId][version] = pkgconfig

        if self._skip(groupId, artifactId, version):
            self._message(f"Skipping: {groupId}:{artifactId}:{version}")
            return

        # Get the dependencies from the POM
        if not self._pom(groupId, artifactId, version):
            self._message(f"No pom: {groupId}:{artifactId}:{version}")
            return

        #self._message(f"Checking {groupId}:{artifactId}:{version}")
        pkgconfig["dependencies"] = self._artifact_dependencies(groupId, artifactId, version)
        self.depends[groupId][artifactId][version] = pkgconfig
        self._save_config()

    def _artifact_dependencies(self, groupId, artifactId, version):
        # Note: we blindly assume the POM will be formatted the way we expect
        # I don't care that this method has 16 local variables.
        # pylint: disable=R0914
        pom = self._pom(groupId, artifactId, version)
        project = pom.documentElement

        properties = {"project.groupId": groupId,
                      "project.artifactId": artifactId,
                      "project.version": version}
        for node in project.childNodes:
            if node.nodeType == Node.ELEMENT_NODE and node.tagName == "properties":
                for child in node.childNodes:
                    if child.nodeType == Node.ELEMENT_NODE and child.childNodes.length == 1:
                        properties[child.tagName] = child.childNodes[0].nodeValue

        deps = []
        for node in project.childNodes:
            if node.nodeType == Node.ELEMENT_NODE and node.tagName == "dependencies":
                for depnode in node.getElementsByTagName("dependency"):
                    depGroupId = self._get_value(depnode, "groupId")
                    depArtifactId = self._get_value(depnode, "artifactId")
                    depVersion = self._get_value(depnode, "version")
                    if depGroupId is None or depArtifactId is None or depVersion is None:
                        pass
                    else:
                        depGroupId = self._expandProperties(depGroupId, properties)
                        depArtifactId = self._expandProperties(depArtifactId, properties)
                        depVersion = self._expandProperties(depVersion, properties)
                        scope = self._get_value(depnode, "scope")
                        if not scope or scope != "test":
                            depkey = f"{depGroupId}:{depArtifactId}:{depVersion}"
                            deps.append(depkey)
                            self._update_dependencies(depGroupId, depArtifactId, depVersion)

        return deps

    def _expandProperties(self, value, properties):
        for prop in properties:
            repl = "${" + prop + "}"
            if repl in value:
                value = value.replace(repl, properties[prop])
        return value

    def compute_dependencies(self):
        """Find all the (transitive closure) of available dependencies
        among the packages that we're going to use.
        """
        required_list = []
        for package in self.seeds:
            required_list.append(package)
        for package in self.config["pinned-packages"]:
            required_list.append(package)
        
        found = True
        for package in required_list:
            group, artifact, version = package.split(":")
            self._update_dependencies(group, artifact, version)
            if group not in self.depends \
              or artifact not in self.depends[group] \
              or version not in self.depends[group][artifact] \
              or self.depends[group][artifact][version] is None:
                print(f"Required package not found: {group}:{artifact}:{version}")
                found = False

        if not found:
            sys.exit(1)

    def _higher_version(self, curver, newver):
        if curver == newver:
            return False

        curlist = curver.split(".")
        newlist = newver.split(".")
        while curlist and newlist:
            cur = curlist[0]
            curlist = curlist[1:]
            new = newlist[0]
            newlist = newlist[1:]

            if cur != new:
                if cur.isdigit() and new.isdigit():
                    # print(f"{curver}/{newver}: {cur}/{new}: {int(new)>int(cur)}")
                    return int(new) > int(cur)
                # Meh. We could try to do better, but...
                # print(f"{curver}/{newver}: {cur}/{new}: {new>cur}")
                return new > cur

        # If there are more pieces in the new version, call it newer
        return len(newlist) > 0

    def _add_to_classpath(self, package):
        # I don't think reorganizing this method into smaller pieces
        # would make it easier to understand. It's just messy.
        # pylint: disable=R0912

        if package in self._seen:
            return
        self._seen[package] = True

        group, artifact, version = package.split(":")

        try:
            if group not in self._cp:
                self._cp[group] = {}
            if artifact not in self._cp[group]:
                self._cp[group][artifact] = {}

            if version in self._cp[group][artifact]:
                # We already have this version of this package
                return

            # [expletive] xml-apis:xml-apis:2.x is not
            # compatible with xml-apis:xml-apis:1.x so we
            # need a provision for pinning versions. Sigh.
            basepkg = f"{group}:{artifact}"
            usever = None
            for pkg in self.config.get("pinned-packages", []):
                if pkg.startswith(basepkg):
                    usever = pkg[len(basepkg) + 1 :]

            if usever:
                pass
            elif not self._cp[group][artifact]:
                usever = version
            else:
                # Sigh again. We've already got a jar for this artifact
                # but we're being asked to add another. Pick the one
                # with the higher version number. N.B. There should
                # only ever be one key in the artifact dict
                curver = list(self._cp[group][artifact].keys())[0]
                if self._higher_version(curver, version):
                    usever = version
                else:
                    usever = curver

            if usever in self._cp[group][artifact]:
                # We already have this version of this package
                return

            jar = self.depends[group][artifact][usever]["jar"]
            if jar not in ("SKIPPED", "NOTFOUND"):
                self._cp[group][artifact] = {}
                self._cp[group][artifact][usever] = jar
        except KeyError:
            # I guess we don't have one
            pass

        # Note that we could end up with more things on the classpath
        # than we need. If, for example, we add x:y for version 1.4 of
        # some package and then later we replace 1.4 with 1.5.2 which
        # no longer has a dependency on x:y. I'm assuming that'll be
        # harmless.
        try:
            depends = self.depends[group][artifact][version]
            for dep in depends.get("dependencies", []):
                self._add_to_classpath(dep)
        except KeyError:
            pass

    def classpath(self):
        """Compute the class path for this run."""
        for package in self.seeds:
            self._add_to_classpath(package)

        # Work out what jar files are included in the distribution.
        # We don't want to put them on the class path because then
        # there are two copies of them and SLF4J screams bloody
        # murder about that.
        distlibs = []
        for (_, _, filenames) in os.walk(self.root + "/libs/lib"):
            distlibs += filenames

        cplist = []
        if "CLASSPATH" in os.environ:
            for path in os.environ["CLASSPATH"].split(os.pathsep):
                cplist.append(path)

        for group in self._cp:
            for archive in self._cp[group]:
                for version in self._cp[group][archive]:
                    cpjar = self._cp[group][archive][version]
                    if os.path.basename(cpjar) not in distlibs:
                        cplist.append(cpjar)

        # Where is the distribution jar file?
        libpath = os.sep.join([self.root, f"libs/docbook-xslTNG-{self.version}.jar"])
        cplist.append(libpath)

        for path in self.config.get("classpath", []):
            cplist.append(path)

        return os.pathsep.join(cplist)

    def args(self):
        """Compute the java arguments."""
        args = []
        argset = set()
        for arg in self._app_args:
            args.append(arg)
            if ":" in arg:
                argset.add(arg[0:arg.index(":")])
            else:
                argset.add(arg)

        for arg in self.config.get("args", []):
            if ":" in arg:
                key = arg[0:arg.index(":")]
            else:
                key = arg
            if key not in argset:
                args.append(arg)

        for arg in ["-x:org.xmlresolver.tools.ResolvingXMLReader",
                    "-y:org.xmlresolver.tools.ResolvingXMLReader",
                    "-r:org.xmlresolver.Resolver",
                    "-init:org.docbook.xsltng.extensions.Register"]:
            if ":" in arg:
                key = arg[0:arg.index(":")]
            else:
                key = arg
            if key not in argset:
                args.append(arg)

        return args

    def run(self):
        """Run the process."""
        cp = self.classpath()
        args = self.args()
        jopt = ["-Dxml.catalog.files=" + ";".join(self.catalogs)]
        jopt = jopt + self.config.get("java-options", [])
        if self.debug:
            print(self._java)
            for item in jopt:
                print(f"\t{item}")
            print("-cp (in addition to libs/lib/*.jar)")
            for item in cp.split(os.pathsep):
                print(f"\t{item}")
            print(self.config["class"])
            for item in args:
                print(f"\t{item}")
        else:
            cmd = [self._java] + jopt + ["-cp", cp] + [self.config["class"]] + args
            subprocess.call(cmd)


if __name__ == "__main__":
    # I'm perfectly happy with the name 'docbook'
    # pylint: disable=C0103

    try:
        docbook = JavaClassRunner(sys.argv[1:])
        docbook.compute_dependencies()
        docbook.run()
    except JavaClassRunnerException as err:
        print(str(err))
        sys.exit(1)
