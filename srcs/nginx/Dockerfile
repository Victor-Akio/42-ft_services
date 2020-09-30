FROM alpine:3.12

LABEL maintainer="vminomiy <vminomiy@student.42sp.org.br>" \
      version="1.0.0"

RUN apk update
RUN apk add nginx openssl openssh-server

COPY ./index.html /var/www/localhost/
COPY ./setup.sh ./
RUN chmod 757 ./setup.sh

RUN mkdir -p /ssl/
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /ssl/cert.key -out /ssl/cert.crt -days 365 -subj '/CN=localhost'

EXPOSE 80 443 22

ENTRYPOINT ["sh", "./setup.sh"]