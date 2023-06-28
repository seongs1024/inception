FROM alpine:3.17

ARG DOMAIN
ARG SSL_CERT
ARG SSL_KEY
ARG SSL_PASS

ENV DOMAIN "${DOMAIN}"
ENV SSL_CERT "${SSL_CERT}"
ENV SSL_KEY "${SSL_KEY}"
ENV SSL_PASS "${SSL_PASS}"

RUN apk update && apk upgrade && apk add nginx gettext
RUN mkdir -p /etc/nginx/conf.d

COPY ./requirements/nginx/conf/nginx.conf.template /etc/nginx/conf.d/nginx.conf.template
EXPOSE 443
RUN envsubst < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/nginx.conf
ENTRYPOINT ["nginx", "-g", "daemon off;"]
