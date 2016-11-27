#!/bin/sh

/usr/bin/getent group pushgateway > /dev/null || /usr/sbin/groupadd -r pushgateway
/usr/bin/getent passwd pushgateway > /dev/null || /usr/sbin/useradd -r -s /sbin/nologin -g pushgateway pushgateway