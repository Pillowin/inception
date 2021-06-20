FROM alpine:3.12.7
LABEL maintener="agautier <agautier@student.42.fr>"

ARG db_user

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

RUN sh -c "mysqld &" &&\
    sleep 5 && \
	echo "CREATE DATABASE wordpress" | mysql &&\
	echo "CREATE USER '$db_user'@'%' IDENTIFIED BY 'password';" | mysql &&\
	echo "GRANT ALL PRIVILEGES ON wordpress.* TO '$db_user'@'%';" | mysql &&\
	echo "FLUSH PRIVILEGES;" | mysql

EXPOSE 3306

CMD ["mysqld"]
