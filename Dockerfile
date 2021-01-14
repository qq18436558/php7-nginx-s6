FROM ubuntu:18.04

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.1.0.2/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget tzdata && apt-get -y install procps nginx

COPY resources/etc/ /etc/

ENV PORT 80

ADD . /var/www/html
WORKDIR /var/www/html

ENTRYPOINT ["/init"]