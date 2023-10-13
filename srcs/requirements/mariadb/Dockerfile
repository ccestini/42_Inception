FROM debian:bullseye

ARG DB_NAME
ARG DB_USER
ARG DB_USER_PASS
ARG DB_ROOT

RUN apt-get update && apt-get upgrade -y && apt-get -y install mariadb-server mariadb-client

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

RUN service mariadb start && mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}; \
    CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASS}'; \
    GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%'; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}'; \
	FLUSH PRIVILEGES;"

CMD ["mysqld_safe"]


# ** My notes**
# to access database-> mysql -u root -p
# SHOW DATABASES;
# USE wordpress;
# SHOW TABLES;
# SELECT user_login FROM wp_users;
# EXIT;
# USE mysql;
# SELECT db FROM db;
