#!/bin/sh
set -e
cd /var/www
if [ ! -f "/var/www/wp-config.php" ]; then
	#sed -i "s/username_here/${DB_USER}/g" wp-config-sample.php
	#sed -i "s/password_here/${DB_USER_PASS}/g" wp-config-sample.php
	#sed -i "s/localhost/mariadb/g" wp-config-sample.php
	#sed -i "s/database_name_here/${DB_NAME}/g" wp-config-sample.php
	#mv wp-config-sample.php wp-config.php
	wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_USER_PASS} --dbhost=mariadb --allow-root
	wp core install --url=${DOMAIN} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --allow-root
	wp user create ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS} --allow-root
fi
#exec "$@"
exec /usr/sbin/php-fpm81 -F
