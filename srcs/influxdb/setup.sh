#!/bin/sh

influxd &
telegraf --config /etc/telegraf/telegraf.conf --config-directory /etc/telegraf/telegraf.d