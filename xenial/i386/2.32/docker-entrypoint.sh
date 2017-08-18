#!/bin/sh
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

run_snapcraft () {
    LAST=$(($(date +%s) - $(date +%s -r /var/cache/apt/archives/lock)))
    # update APT if the image is older than one month
    if [ $LAST -qe 2592000 ] ; then
        sudo apt-get update
    fi
    exec snapcraft $@
}

if [ -z $1 ] ; then
    run_snapcraft
else
    if [ $1 != "init" ] && \
    [ $1 != "snap" ] && \
    [ $1 != "login" ] && \
    [ $1 != "logout" ] && \
    [ $(which -- $1) ] ; then
        exec $@
    else
        run_snapcraft $@
    fi
fi
