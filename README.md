
# Unofficial build

This repository is an unofficial build for cross-build purpose. Please use the official build [snapcraft](https://hub.docker.com/r/snapcore/snapcraft) if you need newer version of snapcraft.

If you have questions or issues with this docker image, feel free to report bug on https://github.com/chihchun/snapcraft-docker/issues

## Docker image for building Ubuntu snaps

This image includes toolchains and [Snapcraft](https://snapcraft.io) to help app and hardware enablement engineers to build a snap software package and [Ubuntu Core](https://developer.ubuntu.com/en/snappy/) image from Ubuntu or other Docker supported platform.

Supported architectures

* amd64
* i386 (amd64 architecture)
* armhf (native and amd64 architecture)
* arm64 (native and amd64 architecture)

## Usage

You can run the docker image by using this script

    # Download & Install
    wget https://raw.githubusercontent.com/chihchun/snapcraft-docker/master/snapcraft-docker
    chmod u+x snapcraft-docker
    export PATH=${PWD}:$PATH

    # Use the snapcraft command
    snapcraft-docker -v
    snapcraft-docker -h

    snapcraft-docker tour
    cd snapcraft-tour/00-SNAPCRAFT/01-easy-start && snapcraft-docker

If you like to build i386 snap on amd64 hardware platform, please run the command
    ARCH=i386 snapcraft-docker

### On ARM platform

You can run the armhf and arm64 images on native arm architecture platform.

    # Running arm64 image
    export ARCH=arm64
    snapcraft-docker tour
    cd snapcraft-tour/00-SNAPCRAFT/01-easy-start && snapcraft-docker


If you like to build arm target snap on amd64 hardware platform, please install [qemu-user-static](http://packages.ubuntu.com/qemu-user-static) on the docker host machine.

    sudo apt-get install qemu-user-static

### Debug

You can a shell in the container, and run the following command to build a prime folder. You can hack around in the prime folder, then run snapcraft snap to build the final snap package.

    snapcraft-docker bash
    snapcraft prime
    # hack, hack, hack
    snapcraft snap

## Known issue
* Your user id on docker host must be between 500-1100 to be able to use _sudo apt-get_ from snapcraft.
* snapcraft will generate amd64 named snap in i386 container, if you are running from amd64 docker host.

Please report issues to https://github.com/chihchun/snapcraft-docker/issues
