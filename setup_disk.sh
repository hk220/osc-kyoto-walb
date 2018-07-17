#!/bin/sh

if [ ! -f /dev/sdc1 ]; then
  sudo parted -s -a optimal /dev/sdc -- mklabel gpt
  sudo parted -s -a optimal /dev/sdc -- mkpart primary 1 -1
  sudo pvcreate /dev/sdc1
  sudo vgcreate demo /dev/sdc1
fi
