FROM alpine:3.12.7
LABEL maintener="agautier <agautier@student.42.fr>"

RUN apk update --no-cache && \
    apk add php php7-fpm php7-mysqli php7-json php7-phar php7-iconv php7-mbstring mariadb-client

RUN sed -i 's/listen = 127\.0\.0\.1:9000/listen = 9000/g' /etc/php7/php-fpm.d/www.conf

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

CMD ["php-fpm7", "-F"]

EXPOSE 9000
