FROM scientificlinux/sl7
LABEL Maintainer: Tracy Usher

# Install the needed libraries
RUN yum update && yum install -y \
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
  fontconfig \
  freetype \
  freetype-devel \
  fontconfig-devel \
  libstdc++ \
  libxkbcommon-x11

