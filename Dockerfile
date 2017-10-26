FROM ubuntu:xenial
MAINTAINER jbeley

ENV version 1.0.6
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install software-properties-common apt-transport-https
RUN add-apt-repository -y ppa:gift/stable
RUN apt-get update
RUN apt-get -y --force-yes install python-plaso plaso-tools
RUN apt-get -y --force-yes install python-pip

# Incompatible with current l2t for now
#ADD cdqr.py /usr/local/bin
RUN pip install elasticsearch \
        timesketch
RUN apt-get -y clean
RUN apt-get -y autoremove
RUN rm -rf /var/cache/apt/* /var/lib/apt/lists/*
RUN useradd plaso


WORKDIR /home/plaso/
ENV HOME /home/plaso

VOLUME ["/data"]
USER plaso
