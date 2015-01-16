FROM sharaku/build-tools
MAINTAINER sharaku

# ############################################################################
# installation of develop (arm)

RUN \
  echo "deb http://www.emdebian.org/debian/ squeeze main" >> /etc/apt/sources.list.d/emdebian.list && \
  echo "deb http://ftp.uk.debian.org/emdebian/toolchains squeeze main" >> /etc/apt/sources.list.d/emdebian.list && \
  echo "deb http://emdebian.bytesatwork.ch/mirror/toolchains squeeze main" >> /etc/apt/sources.list.d/emdebian.list && \
  echo "deb http://ftp.us.debian.org/debian/ squeeze main" >> /etc/apt/sources.list.d/emdebian.list && \
  dpkg --add-architecture armhf && \
  apt-get install emdebian-archive-keyring

RUN echo `apt-get update` 2>&1
RUN apt-get install -y gcc-4.4-arm-linux-gnueabi g++-4.4-arm-linux-gnueabi

# qemu installed
RUN apt-get install -y qemu

