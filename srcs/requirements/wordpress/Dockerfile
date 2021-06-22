FROM alpine:3.12.7
LABEL maintener="agautier <agautier@student.42.fr>"

COPY ./tools /tools/

ARG DB_HOST
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD

ARG DOMAIN_NAME
ARG TITLE

ARG WP_ADMIN_USER
ARG WP_ADMIN_PASSWORD
ARG WP_ADMIN_MAIL

RUN apk update --no-cache && \
    apk add php php7-fpm php7-mysqli php7-json php7-phar php7-iconv php7-mbstring mariadb-client

RUN sed -i 's/listen = 127\.0\.0\.1:9000/listen = 9000/g' /etc/php7/php-fpm.d/www.conf && \
	sed -i '5ienv[DB_HOST] = $DB_HOST' /etc/php7/php-fpm.d/www.conf && \
	sed -i '5ienv[DB_NAME] = $DB_NAME' /etc/php7/php-fpm.d/www.conf && \
	sed -i '5ienv[DB_USER] = $DB_USER' /etc/php7/php-fpm.d/www.conf && \
	sed -i '5ienv[DB_PASSWORD] = $DB_PASSWORD' /etc/php7/php-fpm.d/www.conf

#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /bin/wp && \
#	chmod +x /bin/wp && \
#	mkdir -p /var/www/html && \
#	rm -f /var/www/html/wp-config.php && \
#	rm -f /var/www/html/wp-config-sample.php && \
#	wp core download --path=/var/www/html/ --locale=fr_FR && \
#	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost="$DB_HOST" --path=/var/www/html/
#	wp core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --path=/var/www/html

CMD ["sh", "/tools/entrypoint.sh"]

EXPOSE 9000
