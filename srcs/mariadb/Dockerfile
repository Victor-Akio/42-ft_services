FROM alpine:3.12

LABEL maintainer="vminomiy <vminomiy@student.42sp.org.br>" \
      version="1.0.0"

RUN apk update && \
    apk add mysql && \


EXPOSE 3306

ENTRYPOINT ["sh", "mdb_start.sh"]