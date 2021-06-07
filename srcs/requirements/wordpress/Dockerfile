FROM alpine:3.12.7
LABEL maintener="agautier <agautier@student.42.fr>"

RUN apk update && \
    apk add php php7-fpm

RUN mkdir /usr/share/webapps && \
	cd /usr/share/webapps/ && \
	wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	#chown -R www /usr/share/webapps/ && \
	cd /

#CMD ["php", "-a"]
