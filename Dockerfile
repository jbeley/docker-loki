FROM ubuntu:xenial
MAINTAINER @jbeley

ENV version 1.0.7
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq -y update && \
        apt-get -qq -y --no-install-recommends install \
            software-properties-common \
            apt-transport-https && \
        add-apt-repository -u -y ppa:gift/stable && \
        apt-get -qq -y --force-yes --no-install-recommends install \
            python-setuptools \
            curl \
            python-plaso \
            plaso-tools \
            python3 \
            python-pip && \
            rm -rf /var/cache/apt/ /var/lib/apt/lists/

RUN curl -s -o /usr/bin/cdqr.py https://raw.githubusercontent.com/orlikoski/CDQR/master/src/cdqr.py
RUN chmod 755 /usr/bin/cdqr.py

RUN apt-get -qq -y clean && \
    apt-get remove -qq -y \
        apt-transport-https\
        ca-certificates\
        curl\
        distro-info-data\
        gir1.2-glib-2.0\
        iso-codes\
        libasn1-8-heimdal\
        libcurl3-gnutls\
        libdbus-1-3\
        libdbus-glib-1-2\
        libgirepository-1.0-1\
        libglib2.0-0\
        libgnutls30\
        libgssapi-krb5-2\
        libgssapi3-heimdal\
        libhcrypto4-heimdal\
        libheimbase1-heimdal\
        libheimntlm0-heimdal\
        libhogweed4\
        libhx509-5-heimdal\
        libidn11\
        libk5crypto3\
        libkeyutils1\
        libkrb5-26-heimdal\
        libkrb5-3\
        libkrb5support0\
        libldap-2.4-2\
        libnettle6\
        libp11-kit0\
        libroken18-heimdal\
        librtmp1\
        libsasl2-2\
        libsasl2-modules-db\
        libtasn1-6\
        libwind0-heimdal\
        lsb-release\
        makedev\
        openssl\
        python-apt-common\
        python-pip\
        python-pip-whl\
        python-pkg-resources\
        python-setuptools\
        python3-apt\
        python3-dbus\
        python3-gi\
        python3-pycurl\
        python3-software-properties\
        software-properties-common && \
    apt-get -qq -y autoclean && \
    apt-get -qq -y autoremove


RUN useradd plaso


WORKDIR /home/plaso/
ENV HOME /home/plaso

VOLUME ["/data"]
USER plaso
