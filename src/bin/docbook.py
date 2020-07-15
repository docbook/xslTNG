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
from xml.dom.minidom import parseString, Node
import requests


class JavaClassRunner:
    """Executes a java process based on a set of parameters read from a
    configuration file. It uses `mvn` to download dependencies and constructs
    a class path that contains the transitive closure of all dependencies
    rooted at the modules listed in `maven-packages`.
    """
    # Yes, I have a lot of instance attributes. I'm also using camelCase names,
    # which aren't the Pythonic way, but they are the POM way. And I know some
    # methods could be functions.
    # pylint: disable=R0902,C0103,R0201


    def __init__(self):
        # The ~ just makes it sort last
        self.depkey = "~depends"
        self.seeds = set(["@@PACKAGE_LIST@@"])
        self.config = {
            "maven-local": str(Path.home()) + "/.m2/repository",
            "maven-repositories": ["https://repo1.maven.org/maven2",
                                   "https://maven.restlet.com"],
            "maven-packages": [],
            "pin-packages": ["xml-apis:xml-apis:1.4.01"],
            "args": ["-init:org.docbook.xsltng.extensions.Register"],
            "classpath": [],
            "class": "net.sf.saxon.Transform"
        }
        self.mvn_dep = "org.apache.maven.plugins:maven-dependency-plugin:2.1:get"
        self._cp = {}
        self._seen = {}

        self.config_file = str(Path.home()) + "/.docbook-xsltng.json"
        self.verbose = False
        self.debug = False
        self._mvn = None
        self._java = None
        self._app_args = []
        self._parse_args()

        try:
            with open(self.config_file, "r") as depfile:
                self.config = json.load(depfile)
        except FileNotFoundError:
            with open(self.config_file, "w") as depfile:
                depfile.write(json.dumps(self.config, indent=2, sort_keys=True))

        self.verbose = self.verbose or self.config.get("verbose", False)

        if not self._mvn:
            self._mvn = self.config.get("mvn", shutil.which("mvn"))
            if not self._mvn:
                raise RuntimeError("The Maven 'mvn' command is not on your path.")

        if not self._java:
            self._java = self.config.get("java", shutil.which("java"))
            if not self._java:
                raise RuntimeError("The 'java' command is not on your path.")

        for key in ["maven-local", "maven-repositories"]:
            if not key in self.config:
                raise RuntimeError(f"Configuration must specify '{key}'")

        for pkg in self.config.get("maven-packages", []):
            self.seeds.add(pkg)

        # Unify the config file with the 

        if "class" not in self.config:
            raise RuntimeError(f"Configuration must specify 'class'")

        if "verbose" not in self.config:
            self.config["verbose"] = False

        if self.depkey not in self.config:
            self.config[self.depkey] = {}

    def _parse_args(self):
        # Can't use any of the nice arg parsers here because these
        # are mostly args for some other application
        done = False
        for arg in sys.argv[1:]:
            if done:
                self._app_args.append(arg)
            else:
                if arg == "--":
                    done = True
                elif arg.startswith("--config:"):
                    self.config_file = arg[9:]
                elif arg.startswith("--mvn:"):
                    self._mvn = arg[6:]
                elif arg.startswith("--java:"):
                    self._java = arg[7:]
                elif arg == "--verbose":
                    self.verbose = True
                elif arg == "--debug":
                    self.debug = True
                else:
                    self._app_args.append(arg)
                    done = True

    def _message(self, message):
        if self.verbose:
            print(message)

    def _pom(self, repo, groupId, artifactId, version):
        groupPath = groupId.replace(".", "/")
        uri = f"{repo}/{groupPath}/{artifactId}/{version}/{artifactId}-{version}.pom"
        # print(uri)
        resp = requests.get(uri)
        if resp.status_code == 200:
            return parseString(resp.text)
        return None

    def _get_value(self, node, tag):
        for child in node.childNodes:
            if child.nodeType == Node.ELEMENT_NODE and child.tagName == tag:
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
                or artifactId is None or "R{" in artifactId
                or version is None or "${" in version)

    def _install(self, groupId, artifactId, version):
        # I'm not really sure how mvn works.
        if self._skip(groupId, artifactId, version):
            self._message(f"Skipping {groupId}:{artifactId}:{version}")
            return "SKIPPED"

        for repo in self.config["maven-repositories"]:
            run = ["mvn",
                   self.mvn_dep,
                   f"-DrepoUrl={repo}",
                   f"-Dartifact={groupId}:{artifactId}:{version}"]
            returnCode = subprocess.run(run, capture_output=True, check=True)
            if returnCode == 0:
                break

        jar = self._jar(groupId, artifactId, version)
        if not jar:
            self._message(f"Failed {groupId}:{artifactId}:{version}")
            return "NOTFOUND"

        self._message(f"Downloaded {groupId}:{artifactId}:{version}")
        return jar

    def _save_config(self):
        with open(self.config_file, "w") as depfile:
            depfile.write(json.dumps(self.config, indent=2, sort_keys=True))

    def _update_dependencies(self, groupId, artifactId, version):
        if groupId not in self.config[self.depkey]:
            self.config[self.depkey][groupId] = {}

        if artifactId not in self.config[self.depkey][groupId]:
            self.config[self.depkey][groupId][artifactId] = {}

        if version in self.config[self.depkey][groupId][artifactId]:
            return

        jar = self._jar(groupId, artifactId, version)
        if not jar:
            jar = self._install(groupId, artifactId, version)

        pkgconfig = {}
        pkgconfig["jar"] = jar
        pkgconfig["dependencies"] = []
        self.config[self.depkey][groupId][artifactId][version] = pkgconfig

        if self._skip(groupId, artifactId, version):
            self._message(f"Skipping: {groupId}:{artifactId}:{version}")
            return

        # Get the dependencies from the POM
        for repo in self.config["maven-repositories"]:
            pom = self._pom(repo, groupId, artifactId, version)
            if pom:
                break

        if not pom:
            print(f"Error: failed to get {artifactId} POM for {groupId} version {version}")
            return

        self._message(f"Checking {groupId}:{artifactId}:{version}")
        pkgconfig["dependencies"] = self._artifact_dependencies(pom)
        self.config[self.depkey][groupId][artifactId][version] = pkgconfig
        self._save_config()

    def _artifact_dependencies(self, pom):
        # Note: we blindly assume the POM will be formatted the way we expect
        deps = []
        for dependencies in pom.getElementsByTagName("dependencies"):
            for node in dependencies.getElementsByTagName("dependency"):
                depGroupId = self._get_value(node, "groupId")
                depArtifactId = self._get_value(node, "artifactId")
                depVersion = self._get_value(node, "version")
                #print(depGroupId, depArtifactId, depVersion)
                if depGroupId is None or depArtifactId is None or depVersion is None:
                    pass
                else:
                    scope = self._get_value(node, "scope")
                    if not scope or scope != "test":
                        depkey = f"{depGroupId}:{depArtifactId}:{depVersion}"
                        deps.append(depkey)
                        self._update_dependencies(depGroupId, depArtifactId, depVersion)
        return deps

    def download_dependencies(self):
        """Download all missing packages, including packages that any of the
        downloaded packages depend on.
        """
        for package in self.seeds:
            group, artifact, version = package.split(":")
            self._update_dependencies(group, artifact, version)
        for package in self.config["pinned-packages"]:
            group, artifact, version = package.split(":")
            self._update_dependencies(group, artifact, version)

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
                    #print(f"{curver}/{newver}: {cur}/{new}: {int(new)>int(cur)}")
                    return int(new) > int(cur)
                # Meh. We could try to do better, but..
                #print(f"{curver}/{newver}: {cur}/{new}: {new>cur}")
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
                    usever = pkg[len(basepkg)+1:]

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

            jar = self.config[self.depkey][group][artifact][usever]["jar"]
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
        if "dependencies" in self.config[self.depkey][group][artifact][version]:
            for dep in self.config[self.depkey][group][artifact][version]["dependencies"]:
                self._add_to_classpath(dep)

    def classpath(self):
        """Compute the class path for this run."""
        for package in self.seeds:
            self._add_to_classpath(package)

        cplist = []
        for group in self._cp:
            for archive in self._cp[group]:
                for version in self._cp[group][archive]:
                    cplist.append(self._cp[group][archive][version])

        # Where is the distribution jar file?
        libpath = os.path.abspath(__file__)
        libpath = libpath[0:libpath.rfind(os.sep)] # strip /docbook
        libpath = libpath[0:libpath.rfind(os.sep)] # strip /bin
        libpath = os.sep.join([libpath, "lib/docbook-xslTNG-0.1.14.jar"])
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
        return args

    def run(self):
        """Run the process."""
        cp = self.classpath()
        args = self.args()
        jopt = self.config.get("java-options", [])
        if self.debug:
            print(self._java)
            for item in jopt:
                print(f"\t{item}")
            print("-cp")
            for item in cp.split(os.pathsep):
                print(f"\t{item}")
            print(self.config['class'])
            for item in args:
                print(f"\t{item}")
        else:
            cmd = [self._java] + jopt + ["-cp", cp] + [self.config['class']] + args
            subprocess.call(cmd)

if __name__ == "__main__":
    # I'm perfectly happy with the name 'docbook'
    # pylint: disable=C0103

    # N.B. JavaClassRunner parses sys.argv!
    docbook = JavaClassRunner()
    docbook.download_dependencies()
    docbook.run()
