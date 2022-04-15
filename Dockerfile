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
        ncurses-devel \
        glibc-devel \
        freetype \
        openssl-devel \
        epel-release \
        libglvnd-opengl \
        #mesa-libGL \
        #mesa-libGLU \
        #mesa-libGL-devel \
        #mesa-libGLU-devel \
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


# Does this solve our swrast problem?
##RUN wget http://mirror.centos.org/centos/7/os/x86_64/Packages/mesa-dri-drivers-18.3.4-10.el7.x86_64.rpm && \
##    yum install mesa-dri-drivers-18.3.4-10.el7.x86_64.rpm -y

# Or will this?
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

# Critical stuff!
RUN yum install -y \
        libxcb-iccm \
        libxcb-render \
        libxcb-render-util \
        libxcb-xinerama \
        libxcb-devel \
        libxcb-util \
        libxcb-util-devel \
        xcb-util \
        xcb-util-wm \
        xcb-util-devel \
        xcb-util-renderutil \
        libxcb 

# node.js
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash - && \
    yum install -y nodejs

# xclock
RUN yum install -y xclock

# what do we still need?
#RUN wget https://scisoft.fnal.gov/scisoft/bundles/tools/checkPrerequisites && \
#    chmod +x checkPrerequisites && \
#    ./checkPrerequisites 

# Don't ask ssh confirmation
RUN sed -i 's/#   StrictHostKeyChecking ask/   StrictHostKeyChecking no/g' /etc/ssh/ssh_config
