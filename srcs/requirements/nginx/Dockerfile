FROM alpine:3.17
RUN apk update && apk upgrade && apk add nginx gettext
RUN mkdir -p /etc/nginx/conf.d
COPY ./requirements/nginx/conf/nginx.conf.template /etc/nginx/conf.d/nginx.conf.template
EXPOSE 443
RUN envsubst < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/my.conf
ENTRYPOINT ["nginx", "-g", "daemon off;"]
