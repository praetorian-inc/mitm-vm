#!/usr/bin/env bash

#Configuration variable. You will have to modify these.
export INTERNET_ROUTER_IP="192.168.1.1"

#This is needed to supress annoying (but harmeless) error messages from apt-get
#Dont change this value.
export DEBIAN_FRONTEND=noninteractive

#Update package information
apt-get update

#Install some miscelanous packages
apt-get install -y curl git golang netsed nmap build-essential make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev python-pip python python-dev python-setuptools tcpdump iptables iptables-dev vim
echo 'export GOPATH="/home/root/go"' >> /home/root/.bashrc
mkdir -p /home/root/go
mkdir -p /home/root/go/src
mkdir -p /home/root/go/pkg
mkdir -p /home/root/go/bin


#Mitmproxy installation
apt-get install -y libffi-dev libssl-dev libxml2-dev libxslt1-dev  zlib1g-dev \
        libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk
pip install --upgrade cffi
pip install --upgrade pyasn1
pip install mitmproxy

#SSLStrip installation
apt-get install -y sslstrip

#SSLSniff installation
apt-get install -y sslsniff

#SoCat installation
apt-get install -y socat

#BTProxy installation
apt-get install -y bluez bluez-cups bluez-dbg bluez-hcidump bluez-tools python-bluez libbluetooth-dev libbluetooth3 python-gobject python-dbus
git clone https://github.com/conorpp/btproxy.git
cd btproxy
python setup.py install

#Killerbee installation
pip uninstall pyyaml
apt-get install -y python-gtk2 python-cairo python-usb python-crypto python-serial python-dev libgcrypt-dev mercurial libyaml-dev libgcrypt11-dev libpython2.7-dev usbutils
pip install pyyaml
hg clone https://bitbucket.org/secdev/scapy-com
cd scapy-com
python setup.py install
cd ..
git clone https://github.com/riverloopsec/killerbee.git
cd killerbee
python setup.py install
chmod +x ./tools/*
echo 'export="$PATH:$HOME/killerbee/tools"' >> ~/.bashrc
cd ~
