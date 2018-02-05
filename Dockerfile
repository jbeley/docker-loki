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
            python-plaso \
            plaso-tools \
            python-pip && \
            rm -rf /var/cache/apt/ /var/lib/apt/lists/

RUN apt-get -qq -y clean && \
    apt-get remove -qq -y \
        gir1.2-glib-2.0 \
        libdbus-glib-1-2 \
        libgirepository-1.0-1 \
        libglib2.0-0 \
        libglib2.0-data \
        libxml2 \
        makedev\
        python3-dbus \
        python3-gi \
        shared-mime-info \
        software-properties-common \
        apt-transport-https \
        xdg-user-dirs \
        apt-transport-https \
        ca-certificates \
        dh-python \
        distro-info-data \
        gir1.2-glib-2.0 \
        iso-codes \
        libasn1-8-heimdal \
        libcurl3-gnutls \
        libdbus-1-3 \
        libdbus-glib-1-2 \
        libgirepository-1.0-1 \
        libglib2.0-0 \
        libgnutls30 \
        libgssapi-krb5-2 \
        libgssapi3-heimdal \
        libhcrypto4-heimdal \
        libheimbase1-heimdal \
        libheimntlm0-heimdal \
        libhogweed4 \
        libhx509-5-heimdal \
        libidn11 \
        libk5crypto3 \
        libkeyutils1 \
        libkrb5-26-heimdal \
        libkrb5-3 \
        libkrb5support0 \
        libldap-2.4-2 \
        libmpdec2 \
        libnettle6 \
        libp11-kit0 \
        libpython3-stdlib \
        libpython3.5-minimal \
        libpython3.5-stdlib \
        libroken18-heimdal \
        librtmp1 \
        libsasl2-2 \
        libsasl2-modules-db \
        libtasn1-6 \
        libwind0-heimdal \
        lsb-release \
        makedev \
        openssl \
        python-apt-common \
        python-pip \
        python-pip-whl \
        python-pkg-resources \
        python-setuptools \
        python3 \
        python3-apt \
        python3-dbus \
        python3-gi \
        python3-minimal \
        python3-pycurl \
        python3-software-properties \
        python3.5 \
        python3.5-minimal \
        software-properties-common && \
    apt-get -qq -y autoremove

RUN useradd plaso

#ADD cdqr.py /usr/local/bin

#RUN chmod 755 /usr/local/bin/cdqr.py

WORKDIR /home/plaso/
ENV HOME /home/plaso

VOLUME ["/data"]
USER plaso
