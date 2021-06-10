FROM alpine:3.12.7
LABEL maintener="agautier <agautier@student.42.fr>"


RUN apk update --no-cache && \
	apk add nginx

COPY ./conf/ /conf/

RUN adduser -D -g 'www' www && \
	mkdir /run/nginx && \
	mv /conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443
