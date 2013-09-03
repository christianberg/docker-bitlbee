FROM ubuntu:precise

MAINTAINER Christian Berg <berg.christian@gmail.com>

# Enable Ubuntu security updates
RUN echo "deb http://archive.ubuntu.com/ubuntu precise-security main" > /etc/apt/sources.list.d/security.list

# Enable BitlBee nightly build repo
RUN echo "deb http://code.bitlbee.org/debian/devel/precise/amd64/ ./" > /etc/apt/sources.list.d/bitlbee.list
RUN gpg --keyserver pgpkeys.mit.edu --recv-key 94EEA1F2C7E50436 && gpg --export --armor 94EEA1F2C7E50436 | apt-key add -

# Update and install security updates
RUN apt-get update
RUN apt-get upgrade -y && apt-get clean

# This is a hack to stop the bitlbee daemon from starting right after package installation
RUN echo '#!/bin/sh' > /usr/sbin/policy-rc.d
RUN echo 'exit 101' >> /usr/sbin/policy-rc.d
RUN chmod 755 /usr/sbin/policy-rc.d

# Install BitlBee
RUN apt-get install bitlbee