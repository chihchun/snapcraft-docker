#!/bin/sh

if [ -z $1 ] ; then
    exec snapcraft
else
    if [ $1 != "init" ] && \
    [ $1 != "snap" ] && \
    [ $1 != "login" ] && \
    [ $1 != "logout" ] && \
    [ $(which -- $1) ] ; then
        exec $@
    else
        exec snapcraft $@
    fi
fi
