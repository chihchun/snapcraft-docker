# Docker image for building Ubuntu snaps

This image includes toolchains and [Snapcraft](https://snapcraft.io) to help app and hardware enablement engineers to build a snap software package and [Ubuntu Core](https://developer.ubuntu.com/en/snappy/) image from Ubuntu or other Docker supported platform.

Supported architectures

* amd64
* i386 (amd64 architecture)
* armhf (native and amd64 architecture)
* arm64 (native and amd64 architecture)

# Usage

You can run the docker image by

    alias snapcraft-docker='docker run -u $(id -u) -t -i --rm -v $(pwd):/build  \
    	-v ${HOME}/.snap:/build/.snap \
    	-v ${HOME}/.local/share/snapcraft:/build/.local/share/snapcraft \
    	snapcraft/xenial-amd64 snapcraft'

    snapcraft-docker tour
    cd snapcraft-tour/00-SNAPCRAFT/01-easy-start && snapcraft-docker

You can replace amd64 with i386, to build i386 snap on amd64 hardware platform.

## On ARM platform

You can run the armhf and arm64 images on native arm architecture platform.

    # Running arm64 image
    alias snapcraft-docker='docker run -u $(id -u) -t -i --rm -v $(pwd):/build  \
    	-v ${HOME}/.snap:/build/.snap \
    	-v ${HOME}/.local/share/snapcraft:/build/.local/share/snapcraft \
    	snapcraft/xenial-arm64 snapcraft'

    snapcraft-docker tour
    cd snapcraft-tour/00-SNAPCRAFT/01-easy-start && snapcraft-docker


If you like to build arm target snap on amd64 hardware platform, please install [qemu-user-static](http://packages.ubuntu.com/qemu-user-static) on the docker host machine.

    sudo apt-get install qemu-user-static

# Known issue
* Your user id on docker host must be between 500-1100 to be able to use _sudo apt-get_ from snapcraft.
* docker will create the volume folder with root permission, which will leave ./.local/share/snapcraft and ./snap in current build folder.
* snapcraft will generate amd64 named snap in i386 container, if you are running from amd64 docker host.

Please report issues to https://github.com/chihchun/snapcraft-docker/issues
# TODO
* Support build multi-architecture snap.
* Include Cross build toolchains for arm platform enablement in amd64 image.
* Include ubuntu-image tooling for creating new image for arm platform.
