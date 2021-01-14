FROM php:7.3-fpm-stretch

MAINTAINER sadoknet@gmail.com
ENV DEBIAN_FRONTEND=noninteractive

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.1.0.2/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

RUN \
  	apt-get -y update && \
  	apt-get -y install --no-install-recommends \
  	nginx zip unzip\
    gcc nasm build-essential make wget vim git && \
    rm -rf /var/lib/apt/lists/*

COPY resources/etc/ /etc/

ENV PORT 80

ADD . /var/www/html
WORKDIR /var/www/html

ENTRYPOINT ["/init"]
apt-get update  &&  apt-get install procps