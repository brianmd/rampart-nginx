FROM nginx:1.11.3-alpine
MAINTAINER brian@murphydye.com

COPY index.html /usr/share/nginx/html/index.html
COPY config /etc/nginx/conf.d/default.conf

