## This image is for s905x4 yocto
FROM ubuntu:18.04
LABEL org.opencontainers.image.authors="dongsheng.qu@roadwaysmart.com"

RUN groupadd -r ubuntu && useradd --no-log-init -r -g ubuntu ubuntu

RUN apt update && apt purge libc6-dev && \
  apt install -y --no-install-recommends \
    locales libc6-dev libc6-dev-i386 gcc-multilib g++-multilib libssl-dev \
    build-essential bison python python3 python3-distutils net-tools \
    chrpath cpio diffstat file gawk git wget vim iputils-ping ca-certificates && \
  rm -rf /var/lib/apt/lists/* && \
  localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
  update-ca-certificates

ENV LANG en_US.utf8
USER ubuntu
WORKDIR /home/ubuntu