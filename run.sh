#!/bin/bash

apt-get install python3
apt-get install python3-pip
pip install --upgrade pip
if [ -f /usr/bin/pip ]; then
	rm -rf /usr/bin/pip
fi
sudo ln -s /usr/local/bin/pip /usr/bin/pip

pip install numpy
pip install pandas
