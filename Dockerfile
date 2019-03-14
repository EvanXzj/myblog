FROM nginx

LABEL maintainer="ChuiDylan<chuidylan@gmail.com>"

COPY ./public /usr/share/nginx/html
COPY blog.chuidylan.conf /etc/nginx/conf.d/

VOLUME [ "/etc/letsencrypt"]
