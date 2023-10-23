FROM debian:bullseye
ARG DB_NAME \
    DB_USER \
    DB_USER_PASS \
	WP_TITLE \
	WP_ADMIN \
	WP_ADMIN_PASS \
	WP_ADMIN_EMAIL \
	WP_USER \
	WP_USER_PASS \
	WP_USER_EMAIL

RUN apt update -y && \
  apt upgrade -y && \
  apt install -y curl \
    php \
    php-fpm \
    php-mysqli \
    mariadb-client

COPY ./requirements/wordpress/conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
  chmod +x wp-cli.phar && \
  mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000
WORKDIR /var/www
#RUN wget https://wordpress.org/latest.zip && \
#    unzip latest.zip && \
#    cp -rf wordpress/* . && \
#    rm -rf wordpress latest.zip
#RUN sh wp_config.sh && rm wp_config.sh && \
#    chmod -R 0777 wp-content/

#	wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_USER_PASS} --dbhost=mariadb --allow-root && \
#	wp core install --allow-root --url=${DOMAIN} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} && \
#	wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS}
COPY ./requirements/wordpress/tools/wp_config.sh /etc/wp_config.sh
RUN chmod +x /etc/wp_config.sh
CMD ["sh", "-c",  "/etc/wp_config.sh"]
#ENTRYPOINT ["sh", "-c",  "/var/www/wp_config.sh"]
#CMD ["/usr/sbin/php-fpm81", "-F"]
