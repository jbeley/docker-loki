MAINTAINER Jeff Beley <jeff@beley.org>

FROM ubuntu:14.04

RUN sudo apt-get -y install software-properties-common:
RUN sudo add-apt-repository -y ppa:gift/dev
RUN apt-get update
#RUN sudo apt-get -y install ipython libbde-python libesedb-python libevt-python libevtx-python libewf-python libfwsi-python liblnk-python libmsiecf-python libolecf-python libqcow-python libregf-python libsigscan-python libsmdev-python libsmraw-python libtsk libvhdi-python libvmdk-python libvshadow-python python-artifacts python-bencode python-binplist python-construct python-dateutil python-dfvfs python-dpkt python-hachoir-core python-hachoir-metadata python-hachoir-parser python-pefile python-protobuf python-psutil python-pyparsing python-six python-yaml python-tz pytsk3
RUN sudo apt-get -y install python-plaso
RUN useradd plaso


WORKDIR /home/plaso/
ENV HOME /home/plaso

VOLUME ["/data"]
USER plaso