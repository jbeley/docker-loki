FROM ubuntu:xenial
MAINTAINER jbeley

ENV version 1.0.4

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common apt-transport-https
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:gift/stable
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --force-yes install python-plaso
RUN DEBIAN_FRONTEND=noninteractive apt-get clean &&  rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN useradd plaso


WORKDIR /home/plaso/
ENV HOME /home/plaso

VOLUME ["/data"]
USER plaso
