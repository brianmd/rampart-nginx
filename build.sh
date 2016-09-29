#!/bin/bash
# using automated builds, but building directly is useful during development.

usage_msg="Usage: $0 [version-to-build] [rampart-port]"

if [[ "$#" -ge 1 ]]; then
    RAMPART_NGINX_VERSION=$1
elif [[ -z $RAMPART_NGINX_VERSION ]]; then
    echo $usage_msg
    echo "RAMPART_NGINX_VERSION is not set, and it wasn't passed. Using '0.0.0'"
    echo "(note: 0.0.0 is chosen to prevent overwriting a stable version)"
    echo
    RAMPART_NGINX_VERSION=0.0.0
fi

if [[ "$#" -ge 2 ]]; then
    RAMPART_NGINX_VERSION=$2
elif [[ -z $RAMPART_PORT ]]; then
    echo "RAMPART_PORT not set or passed. Using port 3003."
    RAMPART_PORT=3003
fi

sed "s/RAMPART_PORT/$RAMPART_PORT/" <config-template >config

IMAGE_NAME="bach/rampart-nginx:$RAMPART_NGINX_VERSION"
docker build -t $IMAGE_NAME .

echo
echo "built $IMAGE_NAME"
