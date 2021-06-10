FROM alpine:3.12.7
LABEL maintener="agautier <agautier@student.42.fr>"


RUN apk update --no-cache && \
	apk add nginx

COPY ./conf/ /conf/
COPY /conf/nginx.conf /etc/nginx/
#RUN mv /conf/nginx.conf /etc/nginx/nginx.conf

RUN adduser -D -g 'www' www && \
	mkdir /run/nginx

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443
