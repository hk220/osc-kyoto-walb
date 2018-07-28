#!/bin/sh

sudo walb-proxy -b /var/log/p0/ -l /var/log/p0.log -p 10100 -bg 1 -fg 2 -id p0 &
sudo walb-archive -b /var/log/a0/ -vg demo -l /var/log/a0.log -p 10200 -fg 2 -id a0 &
