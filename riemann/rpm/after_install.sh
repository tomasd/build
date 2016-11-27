#!/bin/sh

ln -f -s /usr/lib/riemann-0.2.11 /usr/lib/riemann
mkdir -p /var/lib/riemann
chown riemann:riemann /var/lib/riemann