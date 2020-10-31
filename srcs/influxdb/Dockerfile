FROM alpine:3.12

RUN apk update
RUN apk add influxdb curl jq libc6-compat
# RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/
RUN curl -LO https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_linux_amd64.tar.gz && \
    tar xf telegraf-1.16.1_linux_amd64.tar.gz --strip 2

COPY setup.sh /tmp/
RUN rm -f /etc/telegraf/telegraf.conf
COPY ./telegraf.conf /etc/telegraf/
RUN chmod +x /tmp/setup.sh

EXPOSE 8086
ENTRYPOINT ["/tmp/setup.sh"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]
