#!/bin/bash

apt update

if [ ! -z "$APPS" ]; then
    apt install -y $APPS
fi

exec /usr/bin/supervisord