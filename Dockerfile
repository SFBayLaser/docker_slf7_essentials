FROM scientificlinux/sl:7
LABEL Maintainer: Tracy Usher

# Install the needed libraries
RUN yum update -y && yum install -y \
  wget \
  redhat-lsb-core \
  perl \
  openssh-server \
  openssh-clients \
  glibc-devel.i686 \
  libgcc.i686 \
  libstdc++-devel.i686 \
  ncurses-devel.i686 \
  glibc-devel \
  freetype \
  openssl-devel \
  mesa-libGL \
  libxcb \
  libxcb-devel \
  xcb-util \
  xcb-util-devel \
  xcb-xinerama0 \
  fontconfig \
  freetype \
  freetype-devel \
  fontconfig-devel \
  libstdc++ \
  libxkbcommon-x11

RUN yum install -y \
  libXi \
  libXrender \
  libXpm \
  libXft \
  libSM 

# Don't ask ssh confirmation
RUN sed -i 's/#   StrictHostKeyChecking ask/   StrictHostKeyChecking no/g' /etc/ssh/ssh_config
