FROM alpine:3.12.7
LABEL maintener="agautier <agautier@student.42.fr>"

RUN apk update --no-cache && \
	apk add mysql mysql-client

RUN sed -i "7i user=mysql\ndatadir=/var/lib/mysql/" /etc/my.cnf.d/mariadb-server.cnf && \
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql && \
	mkdir /run/mysqld && \
	chown mysql:mysql /run/mysqld

RUN echo "[mysqld]\
	user = mysql\
	datadir = /var/lib/mysql/\
	port = 3306\
	bind-address = 0.0.0.0\
	skip-networking = false" > /etc/my.cnf

EXPOSE 3306

CMD ["mysqld", "-umysql"]
