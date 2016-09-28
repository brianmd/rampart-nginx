FROM nginx:1.11.3-alpine
MAINTAINER brian@murphydye.com

COPY config /etc/nginx/conf.d/default.conf

