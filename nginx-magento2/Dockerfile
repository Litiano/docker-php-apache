FROM nginx:stable

LABEL maintainer="litiano.moura@yahoo.com.br"

RUN apt update && apt install -y nano

COPY magento2.nginx /etc/nginx/conf.d/default.conf
