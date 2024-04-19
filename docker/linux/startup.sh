#!/usr/bin/env bash

echo "cron.*                                /var/log/cron.log" >> /etc/rsyslog.conf
systemctl start rsyslog