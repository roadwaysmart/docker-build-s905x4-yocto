## This image is for s905x4 yocto
FROM ubuntu:18.04
LABEL org.opencontainers.image.authors="dongsheng.qu@roadwaysmart.com"

RUN groupadd -r ubuntu && useradd --no-log-init -r -g ubuntu ubuntu
RUN apt update && \
  apt install -y --no-install-recommends \
    locales gcc-multilib g++-multilib libssl-dev libncurses-dev \
    build-essential bison flex python python3 python3-distutils net-tools openssh-client \
    chrpath cpio diffstat file gawk git wget vim tmux iputils-ping ca-certificates less && \
  rm -rf /var/lib/apt/lists/* && \
  localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
  update-ca-certificates

COPY repo /usr/local/bin
COPY .bashrc /home/ubuntu/.bashrc
ENV LANG en_US.utf8
ENV TERM xterm-256color
USER ubuntu
WORKDIR /home/ubuntu
