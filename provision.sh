#!/bin/sh

sudo sed -i -e 's://archive://jp.archive:g' /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y build-essential

git clone https://github.com/hk220/osc-kyoto-walb.git

WORK_DIR=$(pwd)/osc-kyoto-walb
cd ${WORK_DIR}/walb-driver
sudo make setup

cd ${WORK_DIR}/walb-tools
sudo make setup