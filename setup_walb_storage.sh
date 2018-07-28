#!/bin/sh

if [ ! -f /dev/demo/wlog ]; then
  sudo lvcreate -n wlog -L 1G demo
fi

if [ ! -f /dev/demo/wdata ]; then
  sudo lvcreate -n wdata -l 100%FREE demo
fi

sudo mkdir -p /var/log/s0

sudo wdevc format-ldev /dev/demo/wlog /dev/demo/wdata

sleep 1

sudo wdevc create-wdev /dev/demo/wlog /dev/demo/wdata -n walb-demo-device

sudo walb-storage -archive 192.168.3.3:10200 -b /var/log/s0/ -bg 10 -fg 5 -id storage -l /var/log/s0.log -maxconn 200 -p 10000 -proxy 192.168.3.3:10100 -to 600 &