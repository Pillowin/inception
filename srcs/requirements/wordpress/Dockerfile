FROM alpine:3.12.7
LABEL maintener="agautier <agautier@student.42.fr>"

RUN apk update && \
    apk add php php7-fpm

RUN	sed -i 's/listen = 127\.0\.0\.1:9000/listen = 0\.0\.0\.0:9000/g' /etc/php7/php-fpm.d/www.conf

#RUN	echo '[global]' > /etc/php7/php-fpm.d/docker.conf; \
#	echo 'daemonize = no' >> /etc/php7/php-fpm.d/docker.conf; \
#	echo >> /etc/php7/php-fpm.d/docker.conf; \
#	echo '[www]' >> /etc/php7/php-fpm.d/docker.conf; \
#	echo 'listen = 9000' >> /etc/php7/php-fpm.d/docker.conf

#RUN mkdir /usr/share/webapps && \
#	cd /usr/share/webapps/ && \
#	wget http://wordpress.org/latest.tar.gz && \
#	tar -xzvf latest.tar.gz && \
#	rm latest.tar.gz && \
#	#chown -R www /usr/share/webapps/ && \
#	cd /

CMD ["php-fpm7", "-FR"]
