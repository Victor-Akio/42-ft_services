FROM alpine:3.12

LABEL maintainer="vminomiy <vminomiy@student.42sp.org.br>" \
	version="1.0.0"

RUN apk update && \
	apk add nginx && \
	mkdir -p /var/run/nginx && \
	apk add openssl openssh && \
    rm -rf /var/cache/apk/*

RUN mkdir /www
COPY ./index.html /www

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -newkey rsa:2048 -x509 -days 365 -nodes -keyout /etc/nginx/ssl/services.key -out /etc/nginx/ssl/services.pem -subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42SP, Inc./OU=IT/CN=ft_services"

RUN /usr/bin/ssh-keygen -A
COPY sshd_config /etc/ssh/

RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY ./setup.sh .
RUN chmod +x ./setup.sh

EXPOSE 80 443 22
CMD ./setup.sh