#!/bin/sh

sudo sed -i -e 's://archive://jp.archive:g' /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y build-essential


if [ ! -d $(pwd)/osc-kyoto-walb ]; then
  git clone https://github.com/hk220/osc-kyoto-walb.git

  WORK_DIR=$(pwd)/osc-kyoto-walb
  cd ${WORK_DIR}/walb-driver
  sudo make setup
  make
  sudo make install
  sudo make autoload
  sudo make load-module

  cd ${WORK_DIR}/walb-tools
  sudo make setup
  make
  sudo make install

  cd ${WORK_DIR}
  sudo sh setup_disk.sh
  
  sudo reboot
fi