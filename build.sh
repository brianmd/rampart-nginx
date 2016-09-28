#!/bin/bash
# using automated builds, but this can be useful for faster development.
if [[ -z $RAMPART_NGINX_VERSION ]]; then
    echo "Please set the ip address for RAMPART_NGINX_VERSION"
    exit 1
fi

docker build -t bach/rampart-nginx:$RAMPART_NGINX_VERSION .
