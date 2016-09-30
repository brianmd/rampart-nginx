#!/bin/bash
# example run

usage_msg="Usage: $0 rampart-host [local-nginx-port] [version] [local-nginx-port]"

if [[ "$#" -ge 1 ]]; then
    if [[ $1 == "--help" ]]; then
        echo $usage_msg
        exit 1
    fi
    RAMPART_HOST=$1
elif [[ -z $RAMPART_HOST ]]; then
    echo $usage_msg
    echo "Please set the ip address for RAMPART_HOST or pass it as an argument."
    echo "This is the ip address nginx should proxy to."
    echo "Assuming localhost."
    RAMPART_HOST=127.0.0.1
fi

if [[ "$#" -ge 2 ]]; then
    NGINX_PORT=$2
elif [[ -z $NGINX_PORT ]]; then
  echo "NGINX_PORT not set or passed. Using port 80."
  NGINX_PORT=80
fi

if [[ "$#" -ge 3 ]]; then
    RAMPART_NGINX_VERSION=$3
elif [[ -z $RAMPART_NGINX_VERSION ]]; then
    echo "RAMPART_NGINX_VERSION is not set. Using '0.0.0'"
    RAMPART_NGINX_VERSION=0.0.0
fi

IMAGE_NAME="bach/rampart-nginx:$RAMPART_NGINX_VERSION"

# cmd="/usr/bin/systemd-docker run --add-host=rampart-api:$RAMPART_HOST -p 0.0.0.0:$NGINX_PORT:80 --log-driver=journald --rm --name %n $IMAGE_NAME"
cmd="docker run --add-host=rampart-api:$RAMPART_HOST -p 0.0.0.0:$NGINX_PORT:80 --log-driver=journald --rm --name rampart-nginx $IMAGE_NAME"
# print cmd, as it might be useful to copy/paste into service script
echo
echo "running: $cmd"
eval $cmd
