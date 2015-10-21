#!/usr/bin/env bash

#Configuration variable. You will have to modify these.
export INTERNET_ROUTER_IP="10.10.12.1"

#apt-get update
#apt-get upgrade
##Misc packages that may be nice to have
#apt-get install -y vim curl module-assistant debhelper make
##Mallory-specific dependencies. Based on this guide https://www.nccgroup.trust/us/about-us/resources/mallory-and-me-setting-up-a-mobile-mallory-gateway/
#apt-get install -y mercurial python-pyasn1 python-netfilter libnetfilter-conntrack-dev python2.7 python2.7-dev python-setuptools
#easy_install pynetfilter_conntrack
#curl http://launchpadlibrarian.net/19436940/netfilter-extensions-source_20080719%2Bdebian-1_all.deb > nfs.deb
#dpkg -i nfs.deb
#apt-get install -y libnetfilter-conntrack3-dbg python-paramiko python-imaging
##wget http://ubuntu.cs.utah.edu/ubuntu/pool/universe/libn/libnetfilter-conntrack/libnetfilter-conntrack1_0.0.99-1_amd64.deb
##sudo dpkg -i libnetfilter-conntrack1_0.0.99-1_amd64.deb
#apt-get install hostapd

#Setup routes
ip route del 0/0
route add default gw $INTERNET_ROUTER_IP dev eth1
