FROM debian:bullseye

ARG DB_NAME \
    DB_USER \
    DB_USER_PASS \
	DB_ROOT_PASS

RUN apt update -y && \
    apt upgrade -y && \
    apt install mariadb-server -y

RUN mkdir -p /var/run/mysql /var/log/mysql/ && chown -R mysql:mysql /var/run/mysql /var/log/mysql/

COPY ./requirements/mariadb/conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mariadb start && mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}; \
    CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_USER_PASS}'; \
    GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASS}'; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}'; \
    FLUSH PRIVILEGES;" &&  \
    mysqladmin -u root -p${DB_ROOT_PASS} shutdown

EXPOSE 3306

CMD ["mysqld_safe"]
