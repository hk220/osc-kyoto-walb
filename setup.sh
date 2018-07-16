#!/bin/sh

WORK_DIR=$(pwd)/osc-kyoto-walb
cd ${WORK_DIR}/walb-driver
make
sudo make install
sudo make autoload
sudo make load-module

cd ${WORK_DIR}/walb-tools
make
sudo make install
