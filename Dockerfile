FROM debian:jessie

RUN apt-get update
RUN apt-get install -y cron python-pip
RUN pip install awscli

COPY cron /etc/cron.d/cron
COPY horus.sh /opt/horus.sh
RUN chmod 0644 /etc/cron.d/cron && chmod 0755 /opt/horus.sh

CMD env > /root/env && cron -f -L 15
