all: walb-driver

install:
	mkdir -p /lib/modules/`uname -r`/kernel/drivers/block/walb
	cp -p ~/osc-kyoto-walb/walb-driver/walb-driver/module/walb-mod.ko /lib/modules/`uname -r`/kernel/drivers/block/walb/
	depmod `uname -r`

setup:
	apt-get update
	apt-get build-dep -y linux-image-`uname -r`

walb-driver:
	git clone -b for-4.3 --depth 1 https://github.com/walb-linux/walb-driver.git
	cd walb-driver/module; make

clean:
	cd walb-driver/module; make clean
	rm -rf walb-driver

autoload:
	echo walb > /etc/modules-load.d/walb.conf

unautoload:
	rm /etc/modules-load.d/walb.conf

load-module:
	modprobe walb

.PHONY: setup walb-driver install
