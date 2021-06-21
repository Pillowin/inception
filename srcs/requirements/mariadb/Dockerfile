FROM alpine:3.12.7
LABEL maintener="agautier <agautier@student.42.fr>"

ARG DB_CLIENT
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG WP_ADMIN_USER
ARG WP_ADMIN_PASSWORD
ARG WP_USER
ARG WP_PASSWORD

RUN apk update --no-cache && \
	apk add mysql mysql-client

RUN sed -i "7i user=mysql\ndatadir=/var/lib/mysql/" /etc/my.cnf.d/mariadb-server.cnf && \
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql && \
	mkdir /run/mysqld && \
	chown mysql:mysql /run/mysqld

RUN echo "[mysqld]" > /etc/my.cnf.d/mariadb-server.cnf && \
	echo "user = mysql" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "datadir = /var/lib/mysql/" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "port = 3306" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "bind-address = 0.0.0.0" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "skip-networking = false" >> /etc/my.cnf.d/mariadb-server.cnf

RUN mysqld &\
	sleep 5 && \
	echo "CREATE DATABASE $DB_NAME" | mysql && \
	echo "CREATE USER '$DB_USER'@'$DB_CLIENT' IDENTIFIED BY '$DB_PASSWORD';" | mysql && \
	echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'$DB_CLIENT';" | mysql && \
	echo "FLUSH PRIVILEGES;" | mysql
#	echo "INSERT INTO '$DB_NAME'.'wp_users' ('ID', 'user_login', 'user_pass', 'user_nicename', 'user_email', 'user_url', 'user_registered', 'user_activation_key', 'user_status', 'display_name') VALUES ('', MD5('$WP_PASSWORD'), '$WP_USER', '', '', '2021-06-21 00:38:45'. '', '0', '$WP_USER');" | mysql

EXPOSE 3306

CMD ["mysqld"]
