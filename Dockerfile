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
  libSM 

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
                 mesa-libGL-devel \
                 mesa-libGLU-devel \
                 perl-DBD-SQLite \
                 perl-ExtU \
                 tils-MakeMaker \
                 gcc gcc-c++ \
                 libffi-devel

# xclock
RUN yum install -y xclock

# what do we still need?
#RUN wget https://scisoft.fnal.gov/scisoft/bundles/tools/checkPrerequisites && \
#    chmod +x checkPrerequisites && \
#    ./checkPrerequisites 

# Don't ask ssh confirmation
RUN sed -i 's/#   StrictHostKeyChecking ask/   StrictHostKeyChecking no/g' /etc/ssh/ssh_config
