#!/bin/sh

/usr/bin/getent group riemann > /dev/null || /usr/sbin/groupadd -r riemann
/usr/bin/getent passwd riemann > /dev/null || /usr/sbin/useradd -r -s /sbin/nologin -g riemann riemann

ln -f -s /usr/lib/riemann-0.2.11 /usr/lib/riemann/