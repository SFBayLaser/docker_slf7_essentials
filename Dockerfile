FROM scientificlinux/sl:latest
LABEL Maintainer: Tracy Usher
# update October 7, 2021

# Install the needed libraries
RUN yum update -y && yum install -y wget 

RUN yum update -y && yum install -y \
        redhat-lsb-core \
        perl \
        perl-DBD-SQLite \
        openssh-server \
        openssh-clients \
        glibc-devel \
        libgcc \
        libstdc++-devel \
        mesa-libGL \
        mesa-dri-drivers \
        ncurses-devel \
        glibc-devel \
        freetype \
        openssl-devel \
        epel-release \
        fontconfig \
        freetype \
        freetype-devel \
        fontconfig-devel \
        libstdc++ \
        libxkbcommon-x11 \
        libXi \
        libXrender \
        libXpm \
        libXft \
        libSM \
        libXau \
        libXdmcp \
        libXext \
        libX11 && \
    rm -rf /var/chache/yum/* 

# Not sure if this is really needed to solve swrast issues encountered previously
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES},display

RUN yum install -y \
        git \
        libXinerama-devel \
        libXext-devel \
        libXrandr-devel \
        libXi-devel \
        libXcursor-devel \
        libXxf86vm-devel \
        vulkan-devel && \
    rm -rf /var/cache/yum/*


# More stuff!
RUN  yum install -y \
          subversion \
          asciidoc \
          bzip2-devel \
          ftgl-devel \
          gdbm-devel \
          giflib-devel \
          gl2ps-devel \
          glew-devel \
          openldap-devel \
          pcre2-devel \
          readline-devel \
          autoconf \
          automake \
          libtool \
          lz4-devel \
          swig \
          texinfo \
          tcl-devel \
          tk-devel \
          xz-devel \
          xmlto \
          xxhash \
          xxhash-devel \
          zstd \
          zstd-devel \
          libAfterImage-devel \
          libcurl-devel \
          libjpeg-turbo-devel \
          libX11-devel libXe \
          xt-devel \
          libXft-devel \
          libXi-devel \
          libXrender-devel \
          libXt-devel \
          libXpm-devel \
          libXmu-devel \
          libzstd-devel \
          libxxhash \
          libxxhash-devel \
          tils-MakeMaker \
          gcc gcc-c++ \
          libffi-devel \
          perl-Digest-SHA

# Make sure we have kerberos
RUN yum install -y \
          krb5-libs \
          krb5-workstation

# Critical stuff!
RUN yum install -y \
        qt5-qtbase-devel

# node.js
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash - && \
    yum install -y nodejs

# xclock
RUN yum install -y xclock

# Don't ask ssh confirmation
RUN sed -i 's/#   StrictHostKeyChecking ask/   StrictHostKeyChecking no/g' /etc/ssh/ssh_config
