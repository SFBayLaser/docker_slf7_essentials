FROM scientificlinux/sl:7
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
  libxi6 \
  libgconf-2-4 \
  xcb-util \
  xcb-util-devel \
  xcb-xinerama0 \
  fontconfig \
  freetype \
  freetype-devel \
  fontconfig-devel \
  libstdc++ \
  xorg-x11-libs \
  libxkbcommon-x11


# Don't ask ssh confirmation
RUN sed -i 's/#   StrictHostKeyChecking ask/   StrictHostKeyChecking no/g' /etc/ssh/ssh_config
