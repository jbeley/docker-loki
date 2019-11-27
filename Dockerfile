FROM python:2.7-alpine

MAINTAINER @jbeley

ENV PIP_NO_CACHE_DIR off
ENV PIP_DISABLE_PIP_VERSION_CHECK on


RUN apk update && \
    apk add --no-cache -t .build-deps \
      openssl-dev \
      python-dev \
      build-base \
      zlib-dev \
      libc-dev \
      jpeg-dev \
      py-pip \
      linux-headers \
      autoconf \
      automake \
      libtool \
      libmagic \
      git \
      flex && \
      git clone --recursive https://github.com/VirusTotal/yara.git /tmp/yara && \
      cd /tmp/yara && \
      ./bootstrap.sh && \
      sync && \
      git clone https://github.com/Neo23x0/Loki /loki && \
      ./configure --prefix=/usr  && \
       make clean all install && \
       pip install --upgrade yara-python psutil netaddr pylzma colorama pycrypto && \
       rm -rf /tmp/* && \
       apk del --purge .build-deps

WORKDIR /loki

RUN python /loki/loki.py --update


VOLUME ["/data"]
USER loki
