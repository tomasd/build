#!/bin/sh

/usr/bin/getent group riemann > /dev/null || /usr/sbin/groupadd -r riemann
/usr/bin/getent passwd riemann > /dev/null || /usr/sbin/useradd -r -s /sbin/nologin -g riemann riemann