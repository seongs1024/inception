FROM alpine:3.17

ARG DOMAIN

RUN apk update && apk upgrade && apk add nginx gettext
RUN mkdir -p /etc/nginx/conf.d

COPY ./requirements/nginx/conf/nginx.conf.template /etc/nginx/conf.d/nginx.conf.template
RUN envsubst < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
