FROM debian:bullseye

ARG DOMAIN

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y gettext \
      nginx \
      openssl
RUN mkdir -p /etc/nginx/conf_temp

COPY ./requirements/nginx/conf/nginx.conf.template /etc/nginx/conf_temp/nginx.conf.template
RUN envsubst '${DOMAIN}' < /etc/nginx/conf_temp/nginx.conf.template > /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
