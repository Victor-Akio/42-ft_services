FROM alpine:3.12

LABEL maintainer="vminomiy <vminomiy@student.42sp.org.br>" \
      version="1.0.0"

RUN mkdir -p /run/nginx && \
	apk update && \
	apk add nginx && \
    apk add openssh && \
	ssh-keygen -A

COPY ssl/server.crt /etc/nginx/ssl/
COPY ssl/server.key /etc/nginx/ssl/
COPY nginx_start.sh .

EXPOSE 80 443 22

ENTRYPOINT ["sh", "nginx_start.sh"]