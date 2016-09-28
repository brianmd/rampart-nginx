#!/bin/bash
# example run
if [[ -z $RAMPART_NGINX ]]; then
    echo "Please set the ip address for RAMPART_NGINX"
    exit 1
fi

if [[ -z $RAMPART_NGINX_VERSION ]]; then
  echo "Please set the ip address for RAMPART_NGINX_VERSION"
  exit 1
fi

/usr/bin/systemd-docker run --add-host=rampart-api:$RAMPART_NGINX -p 0.0.0.0:80:80 --log-driver=journald --rm --name %n bach/rampart-nginx:$RAMPART_NGINX_VERSION
