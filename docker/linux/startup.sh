#!/usr/bin/env bash

echo "cron.*                                /var/log/cron.log" >> /etc/rsyslog.conf
service rsyslog start