FROM alpine:3.12.7
LABEL maintener="agautier <agautier@student.42.fr>"

RUN apk update --no-cache && \
    apk add php php7-fpm php7-mysqli

RUN sed -i 's/listen = 127\.0\.0\.1:9000/listen = 0\.0\.0\.0:9000/g' /etc/php7/php-fpm.d/www.conf

CMD ["php-fpm7", "-F"]

EXPOSE 9000
