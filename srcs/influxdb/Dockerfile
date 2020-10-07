#Usa a imagem alpine do Dockerhub como base
FROM	alpine:3.12.0

COPY influx_setup.sh /tmp/

#Instala ferramenta auxiliares
RUN apk update && \
	apk add wget && \
	apk add influxdb telegraf openrc\
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ && \
	rm -rf /var/cache/apk/* && \
	apk add --no-cache --upgrade bash


EXPOSE 8086

ENTRYPOINT ["/tmp/influx_setup.sh"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]