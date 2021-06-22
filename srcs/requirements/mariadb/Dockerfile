FROM alpine:3.12.7
LABEL maintener="agautier <agautier@student.42.fr>"

ARG DB_CLIENT
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD

RUN apk update --no-cache && \
	apk add mariadb mariadb-client

RUN sed -i "7i user=mysql\ndatadir=/var/lib/mysql/" /etc/my.cnf.d/mariadb-server.cnf && \
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal && \
	mkdir /run/mysqld && \
	chown mysql:mysql /run/mysqld

RUN echo "[mysqld]" > /etc/my.cnf.d/mariadb-server.cnf && \
	echo "user = mysql" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "datadir = /var/lib/mysql/" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "port = 3306" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "bind-address = 0.0.0.0" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "skip-networking = false" >> /etc/my.cnf.d/mariadb-server.cnf

RUN mysqld &\
	sleep 3 && \
	echo "CREATE DATABASE $DB_NAME" | mysql && \
	echo "CREATE USER '$DB_USER'@'$DB_CLIENT' IDENTIFIED BY '$DB_PASSWORD';" | mysql && \
	echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'$DB_CLIENT';" | mysql && \
	echo "FLUSH PRIVILEGES;" | mysql && \
	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWORD');" | mysql

EXPOSE 3306

CMD ["mysqld"]
