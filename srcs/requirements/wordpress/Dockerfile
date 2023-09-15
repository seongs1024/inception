FROM alpine:3.17
ARG PHP_VERSION=81 \
    DB_NAME \
    DB_USER \
    DB_USER_PASS \
	WP_TITLE \
	WP_ADMIN \
	WP_ADMIN_PASS \
	WP_ADMIN_EMAIL \
	WP_USER \
	WP_USER_PASS \
	WP_USER_EMAIL

RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-cgi \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-phar \
	mariadb-client \
	curl \
    wget \
    unzip && \
#    sed -i "s|user = nobody|user = nginx|g" \
#      /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
#    sed -i "s|group = nobody|group = nginx|g" \
#      /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*
EXPOSE 9000
WORKDIR /var/www
#RUN wget https://wordpress.org/latest.zip && \
#    unzip latest.zip && \
#    cp -rf wordpress/* . && \
#    rm -rf wordpress latest.zip
#RUN sh wp_config.sh && rm wp_config.sh && \
#    chmod -R 0777 wp-content/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	wp core download --allow-root
#	wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_USER_PASS} --dbhost=mariadb --allow-root && \
#	wp core install --allow-root --url=${DOMAIN} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} && \
#	wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS}
COPY ./requirements/wordpress/tools/wp_config.sh /etc/wp_config.sh
RUN chmod +x /etc/wp_config.sh
CMD ["sh", "-c",  "/etc/wp_config.sh"]
#ENTRYPOINT ["sh", "-c",  "/var/www/wp_config.sh"]
#CMD ["/usr/sbin/php-fpm81", "-F"]
