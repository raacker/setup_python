#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Please run with sudo"
   exit 1
fi

apt-get install -y python3
apt-get install -y python3-pip
pip3 install --upgrade pip

if [ -f /usr/bin/pip ]; then
	rm -rf /usr/bin/pip
fi
sudo ln -s /usr/local/bin/pip /usr/bin/pip

# install libraries
pip3 install setuptools
pip3 install numpy
pip3 install pandas
pip3 install jupyter
pip3 install pytest pytest-cov

# create virtual environment directory
apt-get install -y virtualenv
sudo -u haven virtualenv -p python3 $HOME/virtual_py

echo "alias python='python3'" >> ~/.bashrc
echo "alias pip='pip3'" >> ~/.bashrc
echo "alias notebook='jupyter-notebook'" >> ~/.bashrc
echo "alias act-vir='source $HOME/virtual_py/bin/activate'" >> ~/.bashrc
echo "alias deact-vir='deactivate'" >> ~/.bashrc

version="2017.3.1"
# install pycharm
apt-get install -y openjdk-8-jre
wget -O $HOME/Downloads/pycharm.tar.gz https://download.jetbrains.com/python/pycharm-community-$version.tar.gz

tar -xf $HOME/Downloads/pycharm.tar.gz --directory $HOME
echo "export PYCHARM_HOME='$HOME/pycharm-community-$version'" >> ~/.bashrc
echo "alias pycharm='sudo nohup $PYCHARM_HOME/bin/pycharm.sh &'" >> ~/.bashrc
