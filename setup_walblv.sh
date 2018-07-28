#!/bin/sh

if [ ! -f /dev/demo/wlog ]; then
  sudo lvcreate -n wlog -L 1G demo
fi

if [ ! -f /dev/demo/wdata ]; then
  sudo lvcreate -n wdata -l 100%FREE demo
fi

sudo mkdir -p /var/log/{a0,p0,s0}

sudo wdevc format-ldev /dev/demo/wlog /dev/demo/wdata

sleep 1

sudo wdevc create-wdev /dev/demo/wlog /dev/demo/wdata -n walb-demo-device

sudo walb-storage -b /var/log/s0/ -l /var/log/s0.log -archive 192.168.3.3:10200 -p 10000 -bg 1 -proxy 192.168.3.3:10100 -fg 2 -id s0 &
sudo walb-proxy -b /var/log/p0/ -l /var/log/p0.log -p 10100 -bg 1 -fg 2 -id p0 &
sudo walb-archive -b /var/log/a0/ -vg demo -l /var/log/a0.log -p 10200 -fg 2 -id a0 &

