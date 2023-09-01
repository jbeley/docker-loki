FROM python:3-alpine

MAINTAINER @jbeley

ENV PIP_NO_CACHE_DIR off
ENV PIP_DISABLE_PIP_VERSION_CHECK on


RUN apk update && \
    apk add --no-cache -t .build-deps \
      openssl-dev \
      python3-dev \
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
      bison \
      flex


     # && \
      RUN git clone --recursive https://github.com/VirusTotal/yara.git /tmp/yara && \
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

RUN pip install -r /loki/requirements.txt

RUN python /loki/loki-upgrader.py

RUN adduser -D -s /bin/sh loki



VOLUME ["/data"]
USER loki
