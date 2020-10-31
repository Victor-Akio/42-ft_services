#!/bin/sh

influxd & telegraf --config /etc/telegraf.conf --config-directory /etc/telegraf.conf.d