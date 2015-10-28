#!/usr/bin/env bash

#Configuration variable. You will have to modify these.
export INTERNET_ROUTER_IP="192.168.1.1"

#This is needed to supress annoying (but harmeless) error messages from apt-get
#Dont change this value.
export DEBIAN_FRONTEND=noninteractive

#Routes all traffic coming into the instance through ports 6666 (for tcp traffic) and 6667 (for udp traffic)
iptables -t nat -A PREROUTING -i eth1 -p tcp -m tcp -j REDIRECT --to-ports 6666
#TODO: Investigate transparent UDP proxing. Sometimes DNS requests won't forward properly.
#iptables -t nat -A PREROUTING -i eth1 -p udp -m udp -j REDIRECT --to-ports 6667

#Setup routes. This allows the VM to route all traffic (including traffic not intended for the vm) through the proper interface
ip route del 0/0
route add default gw $INTERNET_ROUTER_IP dev eth1
sysctl -w net.ipv4.ip_forward=1
