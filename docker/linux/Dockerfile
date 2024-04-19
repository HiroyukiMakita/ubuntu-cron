FROM ubuntu:latest

WORKDIR /project

RUN apt-get -y update && \
    apt-get -y install cron procps rsyslog systemctl less tzdata vim && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY cron/schedule /etc/cron.d/schedule
COPY docker/linux/startup.sh /project/docker/linux/startup.sh
COPY docker/linux/aliases.txt /project/docker/linux/aliases.txt

RUN chmod 0644 /etc/cron.d/schedule && \
    chown root /etc/cron.d/schedule && \
    chmod 0744 /project/docker/linux/startup.sh && \
    /project/docker/linux/startup.sh && \
    touch /tmp/schedule.log && \
    touch /tmp/schedule-error.log && \
    cat /project/docker/linux/aliases.txt >> ~/.bashrc