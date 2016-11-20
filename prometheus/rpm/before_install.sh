#!/bin/sh

/usr/bin/getent group prometheus > /dev/null || /usr/sbin/groupadd -r prometheus
/usr/bin/getent passwd prometheus > /dev/null || /usr/sbin/useradd -r -s /sbin/nologin -g prometheus prometheus

ln -f -s /usr/lib/prometheus-1.3.1.linux-amd64 /usr/lib/prometheus
mkdir -p /var/lib/prometheus
chown prometheus:prometheus /var/lib/prometheus