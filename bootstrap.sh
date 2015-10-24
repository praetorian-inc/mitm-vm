#!/usr/bin/env bash

#Configuration variable. You will have to modify these.
export INTERNET_ROUTER_IP="10.10.12.1"

#This is needed to supress annoying (but harmeless) error messages from apt-get
#Dont change this value.
export DEBIAN_FRONTEND=noninteractive

#Update package information
apt-get update

#Install some miscelanous packages
apt-get install -y curl git golang netsed nmap build-essential make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev python-pip python python-dev python-setuptools

#Mitmproxy installation
apt-get install -y libffi-dev libssl-dev libxml2-dev libxslt1-dev  zlib1g-dev \
        libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk
pip install --upgrade cffi
pip install mitmproxy
#TODO: Symlink a binary/script in the path to run mitmproxy without switching venvs

#SSLStrip installation
cd /home/vagrant/
apt-get install -y python-twisted
pip install service_identity
git clone https://github.com/moxie0/sslstrip.git 
cd sslstrip
python setup.py install
cd ..
#TODO: Create binary in path to avoid venv switching

#SSLSniff installation
apt-get install -y sslsniff

#SoCat installation
apt-get install -y socat

#BTProxy installation
apt-get install -y bluez bluez-cups bluez-dbg bluez-hcidump bluez-tools python-bluez libbluetooth-dev libbluetooth3 python-gobject python-dbus

#Routes all traffic coming into the instance through ports 6666 (for tcp traffic) and 6667 (for udp traffic)
iptables -t nat -A PREROUTING -i eth1 -p tcp -m tcp -j REDIRECT --to-ports 6666
iptables -t nat -A PREROUTING -i eth1 -p udp -m udp -j REDIRECT --to-ports 6667

#Setup routes. This allows the VM to route all traffic (including traffic not intended for the vm) through the proper interface
ip route del 0/0
route add default gw $INTERNET_ROUTER_IP dev eth1
sysctl -w net.ipv4.ip_forward=1
