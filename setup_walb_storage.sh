#!/bin/sh

if [ ! -f /dev/demo/wlog ]; then
  sudo lvcreate -n wlog -L 1G demo
fi

if [ ! -f /dev/demo/wdata ]; then
  sudo lvcreate -n wdata -l 100%FREE demo
fi

sudo mkdir -p /var/log/a0 /var/log/p0 /var/log/s0

sudo wdevc format-ldev /dev/demo/wlog /dev/demo/wdata

sleep 1

sudo wdevc create-wdev /dev/demo/wlog /dev/demo/wdata -n walb-demo-device

sudo walb-storage -b /var/log/s0/ -l /var/log/s0.log -archive 192.168.3.3:10200 -p 10000 -bg 1 -proxy 192.168.3.3:10100 -fg 2 -id s0 &
