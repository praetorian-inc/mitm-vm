#!/usr/bin/env bash

#Configuration variable. You will have to modify these.
export INTERNET_ROUTER_IP="10.10.12.1"

#This is needed to supress annoying (but harmeless) error messages from apt-get
export DEBIAN_FRONTEND=noninteractive

#Misc packages that may be nice to have
apt-get update
#apt-get upgrade
apt-get install -y curl module-assistant debhelper git bzip2 sqlite3 mercurial libbz2-dev libsqlite3-dev python-qt4 pyro-gui python-twisted-web python-qt4-sql libqt4-sql-sqlite swig libtiff4-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev

#Pyenv is awesome.
git clone https://github.com/yyuu/pyenv.git /home/root/.pyenv
export PYENV_ROOT="/home/root/.pyenv"
echo 'export PYENV_ROOT="/home/root/.pyenv"' >> /home/root/.bashrc
export PATH="$PYENV_ROOT/bin:$PATH"
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> /home/root/.bashrc
eval "$(/home/root/.pyenv/bin/pyenv init -)"
echo 'eval "$(/home/root/.pyenv/bin/pyenv init -)"' >> /home/root/.bashrc
#Pyenv with virtualenv is even better.
git clone https://github.com/yyuu/pyenv-virtualenv.git /home/root/.pyenv/plugins/pyenv-virtualenv
eval "$(/home/root/.pyenv/bin/pyenv virtualenv-init -)"
echo 'eval "$(/home/root/.pyenv/bin/pyenv virtualenv-init -)"' >> /home/root/.bashrc

/home/root/.pyenv/bin/pyenv install 2.7.3
/home/root/.pyenv/bin/pyenv virtualenv --system-site-packages 2.7.3 mallory

#Mallory installation
/home/root/.pyenv/versions/mallory/bin/pip install pyasn1 netfilter paramiko IPy M2Crypto==0.22.3 Pillow Twisted
/home/root/.pyenv/versions/mallory/bin/pip install -e /vagrant/deps/pynetfilter_conntrack
apt-get install -y libnetfilter-conntrack-dev libnetfilter-conntrack3-dbg python-imaging
git clone https://github.com/regit/pynetfilter_conntrack.git
curl -s http://launchpadlibrarian.net/19436940/netfilter-extensions-source_20080719%2Bdebian-1_all.deb > nfs.deb
dpkg -i nfs.deb
dpkg -i /vagrant/deps/libnetfilter-conntrack1_0.0.99-1_amd64.deb
iptables -t nat -A PREROUTING -i eth1 -p tcp -m tcp -j REDIRECT --to-ports 20755
iptables -t nat -A PREROUTING -i eth1 -p udp -m udp -j REDIRECT --to-ports 20755
#cd /vagrant/deps/mallory/src
#/home/root/.pyenv/versions/mallory/bin/python mallory.py

#Setup routes
ip route del 0/0
route add default gw $INTERNET_ROUTER_IP dev eth1
sysctl -w net.ipv4.ip_forward=1
