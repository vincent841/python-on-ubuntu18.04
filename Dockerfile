FROM ubuntu:18.04
LABEL org.opencontainers.image.created='2021-06-15'       
LABEL org.opencontainers.image.authors='jinwon@ai-doop.com'
LABEL org.opencontainers.image.version='1.0.0'
LABEL org.opencontainers.image.vendor='AIdoop'


ENV DEBIAN_FRONTEND=noninteractive

# install python3
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*

# install node.js & additional modules to build aidoop factory.
RUN apt-get update \
  && apt-get install -y ghostscript \
  && apt-get -y install curl \
  && apt-get -y install wget \
  && apt-get -y install git \
  && curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_14_setup.sh \
  && bash nodesource_14_setup.sh \
  && apt-get -y install nodejs \
  && npm install -g yarn \
  && npm install -g cordova \
  && npm install -g yo \
  && npm install -g generator-things-factory \
  && npm install -g node-gyp \
  && apt-get -y install build-essential \
  && apt-get -y install libavahi-compat-libdnssd-dev \
  && apt-get -y install libcups2-dev
