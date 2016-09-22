#!/bin/sh
# Scripts to build the base images from scratch.

for VERSION in 16.04.1 ; do
    for ARCH in amd64 i386 armhf arm64 ; do
        curl http://cdimage.ubuntu.com/ubuntu-base/releases/$VERSION/release/ubuntu-base-$VERSION-base-$ARCH.tar.gz | docker import - snapcraft/ubuntu-base-$ARCH:$VERSION
    done
done
