FROM alpine:3.17

ARG DOMAIN

RUN apk update && apk upgrade && apk add nginx gettext
RUN mkdir -p /etc/nginx/conf_temp

COPY ./requirements/nginx/conf/nginx.conf.template /etc/nginx/conf_temp/nginx.conf.template
RUN envsubst '${DOMAIN}' < /etc/nginx/conf_temp/nginx.conf.template > /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
