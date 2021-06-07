FROM alpine:3.13.1
LABEL maintener="agautier <agautier@student.42.fr>"

#COPY ./srcs /srcs
#COPY srcs/my.cnf /etc/my.cnf

RUN apk update && \
	apk add mysql mysql-client

RUN mkdir /run/mysqld && \
	sed -i "7i user=root\ndatadir=/var/lib/mysql/" /etc/my.cnf && \
	mysql_install_db -uroot

#echo "[mysqld]\
#	user = root\
#	datadir = /var/lib/mysql/\
#	port = 3306\
#	log-bin = /var/lib/mysql-bin\
#	bind-address = 0.0.0.0\
#	skip-networking = false\" > /etc/my.cnf &&\

# EXPOSE 3306

#CMD ["mysqld", "-uroot"]
