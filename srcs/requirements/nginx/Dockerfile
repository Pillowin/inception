FROM alpine:3.12.7
LABEL maintener="agautier <agautier@student.42.fr>"

COPY ./conf /conf

# Download - Install
RUN apk update && \
    apk add nginx

RUN adduser -D -g 'www' www && \
    mkdir -p /var/www

RUN mv /conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir /run/nginx

RUN chown -R www:www /var/lib/nginx && \
    chown -R www:www /var/www

RUN echo "<!DOCTYPE html>\
<html lang="en">\
<head>\
    <meta charset="utf-8" />\
    <title>HTML5</title>\
</head>\
<body>\
    Server is online\
</body>\
</html>" > /var/www/index.html

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443
