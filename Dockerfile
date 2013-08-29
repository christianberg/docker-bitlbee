FROM ubuntu:precise

MAINTAINER Christian Berg <berg.christian@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise-security main" > /etc/apt/sources.list.d/security.list

RUN apt-get update
RUN apt-get upgrade -y && apt-get clean
