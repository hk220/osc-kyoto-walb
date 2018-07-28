#!/bin/sh

sudo mkdir -p /var/log/a0 /var/log/p0

sudo walb-proxy -b /var/log/p0/ -bg 10 -fg 5 -id backup -l /var/log/p0.log -maxconn 200 -p 10100 -to 600 &
sudo walb-archive -b /var/log/a0/ -fg 20 -id backup -l /var/log/a0.log -maxconn 200 -maxopen 1024 -p 10200 -to 600 -vg demo &
