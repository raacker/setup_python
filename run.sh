#!/bin/bash

apt-get install -y python3
apt-get install -y python3-pip
pip3 install --upgrade pip

if [ -f /usr/bin/pip ]; then
	rm -rf /usr/bin/pip
fi
sudo ln -s /usr/local/bin/pip /usr/bin/pip

pip3 install numpy
pip3 install pandas

echo "alias python='python3'" >> ~/.bashrc
echo "alias pip='pip3'" >> ~/.bashrc
