FROM alpine:3.12

RUN apk update && \
	apk add mysql mysql-client && \
	addgroup mysql mysql && \
	rm -rf /var/cache/apk/*

COPY ./start.sh /bin/start.sh
COPY ./mysql.cnf /etc/mysql/mysql.cnf

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["/bin/start.sh"]