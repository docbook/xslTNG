# DocBook xslTNG

This is *The Next Generation* of DocBook stylesheets in XSLT. It is a
complete reimplementation of the stylesheets for transforming
[DocBook](https://docbook.org/) into modern, clean, semantically rich
HTML. The presentation is supported by CSS and (if you wish, a small amount of) JavaScript.
The expectation for paginated output is to use HTML+CSS.

The project home page is [https://xsltng.docbook.org/](https://xsltng.docbook.org/).
Documentation can be found in the [DocBook xslTNG Reference](https://xsltng.docbook.org/guide/).
The [latest release](https://github.com/docbook/xslTNG/releases) is probably the place to start.

Building the project, if you clone the repository, is described in
[Chapter 5](https://xsltng.docbook.org/guide/ch05.html). In brief, you’ll want to build the XSLT
with `gradle makeXslt` and the jar file (for the extension functions) with `gradle jar`. You can build
the whole distribution with `gradle zipStage` which will put all of the build artifacts in
`build/stage/zip`.

# Build Dependencies

If you want to build the release artifact yourself, several additional
dependencies are required. Operating systems and package dependencies
change over time. The instructions here were successfull in May, 2023.
If you have trouble, please open an issue.

## OS tools

Install `sass`.

### On Linux

```
sudo apt-get update
sudo apt-get install libxml2-dev libxslt-dev
curl -o /tmp/dart.tar.gz -L https://github.com/sass/dart-sass/releases/download/1.56.0/dart-sass-1.56.0-linux-x64.tar.gz
cd /tmp && tar zxf dart.tar.gz && sudo mv dart-sass/sass /usr/local/bin
```

The `libxml2-dev` and `libxslt-dev` packages support additional
Python packages described below. 

### On macOS

```
brew install sass/sass/sass libxml2 libxslt 
```

The `libxml2` and `libxslt` packages support additional
Python packages described below. 


### On Windows

```
choco install sass
```

## Python packages

You must have `python3` installed and on your path. You must have the
`pygments` and `click` modules installed:

```
python3 -m pip install pygments==2.14.0 click
```

You don’t have to have Pygments version 2.14.0 installed, but if you
install a different version, you may find that some tests fail.

### Additional Python packages

Testing the build requires a few more dependencies. The build will run
run without them, but you won’t get accurate test results.

```
python3 -m pip install cython saxonche
python3 -m pip install --no-binary lxml html5-parser
```

I have been unable to find a way to install `html5-parser` on Windows.

## Ignoring failed builds

If you don’t install all of the dependencies, or if you install a
different version of Pygments, you may get some failing tests that
you’d like to ignore.

To avoid having the whole build fail because of failing tests, run with
the `requireTestSuccess` parameter set to false:

```
gradlew -PrequireTestSuccess=false …
```
