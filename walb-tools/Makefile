all: walb-tools

install:
	cd walb-tools; cp -a `make -s echo_binaries` /usr/local/bin/
	cd walb-tools/python; python setup.py install

setup:
	apt-get update
	apt-get install -y libaio-dev libsnappy-dev liblzma-dev zlib1g-dev

walb-tools:
	git clone --depth 1 https://github.com/walb-linux/walb-tools.git
	cd walb-tools; make

clean:
	cd walb-tools; make clean
	rm -rf walb-tools

.PHONY: setup walb-tools install