FROM ubuntu:14.04
MAINTAINER jbeley

ENV version 1.0.1

RUN apt-get -y install software-properties-common apt-transport-https
RUN add-apt-repository -y ppa:gift/dev
RUN apt-get update
RUN apt-get -y install ipython libbde-python libesedb-python libevt-python libevtx-python libewf-python libfwsi-python liblnk-python libmsiecf-python libolecf-python libqcow-python libregf-python libsigscan-python libsmdev-python libsmraw-python libtsk libvhdi-python libvmdk-python libvshadow-python python-artifacts python-bencode python-binplist python-construct python-dateutil python-dfvfs python-dpkt python-hachoir-core python-hachoir-metadata python-hachoir-parser python-pefile python-protobuf python-psutil python-pyparsing python-six python-yaml python-tz pytsk3
RUN apt-get -y install python-plaso
RUN apt-get clean &&  rm -rf /var/cache/apt/* /var/lib/apt/lists/*
RUN useradd plaso


WORKDIR /home/plaso/
ENV HOME /home/plaso

VOLUME ["/data"]
USER plaso
