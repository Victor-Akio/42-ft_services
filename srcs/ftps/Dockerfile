FROM alpine:3.12

LABEL maintainer="vminomiy <vminomiy@student.42sp.org.br>" \
      version="1.0.0"

RUN apk upgrade && \
    apk add openssl vsftpd

COPY setup.sh /tmp/
RUN chmod +x /tmp/setup.sh

EXPOSE 21 31000

ENTRYPOINT ["/tmp/setup.sh"]