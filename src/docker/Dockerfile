ARG UBUNTU_VERSION=18.04
FROM ubuntu:${UBUNTU_VERSION}
LABEL org.opencontainers.image.authors="Norman Tovey-Walsh <ndw@nwalsh.com>"

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y default-jre maven unzip

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get update
RUN apt-get install -y python3.8 python3-pip

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 10

# Use Maven to install the packages that docbook-xslTNG depends on
@@MAVEN-COMMANDS@@
ARG VERSION=@@VERSION@@

WORKDIR /opt
ADD https://github.com/docbook/xslTNG/releases/download/${VERSION}/docbook-xslTNG-${VERSION}.zip .
RUN unzip docbook-xslTNG-${VERSION}.zip

WORKDIR docbook-xslTNG-${VERSION}

ENTRYPOINT ["bin/docbook"]
