FROM snapcraft/xenial-amd64:2.20
MAINTAINER Rex Tsai "http://about.me/chihchun"

ENV UBUNTUIMAGE_VERSION=0.10+real1
RUN apt-get install -y --no-install-recommends \
        devscripts \
        equivs \
        git


WORKDIR /tmp
RUN git clone --depth 1 --branch ${UBUNTUIMAGE_VERSION} https://github.com/CanonicalLtd/ubuntu-image \
 && cd ubuntu-image \
 && mk-build-deps debian/control -i --tool 'apt-get -y --no-install-recommends' \
 && dpkg-buildpackage -us -uc \
 && apt-get install -y ../*.deb 

RUN apt-get remove --purge -y devscripts equivs git python3-fixtures python3-responses python3-setuptools python3-testscenarios python3-testtools \
 && apt-get autoremove -y \
 && apt-get clean -y
RUN rm -rf /tmp/* /var/tmp/*
