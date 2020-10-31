FROM alpine:3.12

RUN apk update
RUN apk add influxdb curl jq
RUN apk add telegraf \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY setup.sh /tmp/
RUN chmod +x /tmp/setup.sh
RUN rm -f /etc/telegraf.conf
COPY ./telegraf.conf /etc/

EXPOSE 8086
ENTRYPOINT ["/tmp/setup.sh"]
