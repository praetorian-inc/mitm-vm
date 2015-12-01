#!/usr/bin/env bash

#Environment variable that corresponds to the Internet-facing switch/router.
export INTERNET_ROUTER_IP="192.168.1.1"

#This is needed to supress annoying (but harmeless) error messages from apt-get.
#Do not change this value.
export DEBIAN_FRONTEND=noninteractive

#Route 8888 to 8080. This is used for the Trudy intercept.
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 8888 -m tcp -j REDIRECT --to-ports 8080

#Route all 443 destined traffic (HTTPS) through the VM's port 6443.
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 443 -m tcp -j REDIRECT --to-ports 6443

#Routes all other traffic (i.e. traffic that does not fall under the previous two rules) coming into the instance through port 6666 on the VM.
iptables -t nat -A PREROUTING -i eth1 -p tcp -m tcp -j REDIRECT --to-ports 6666

#TODO: Investigate transparent UDP proxing. Sometimes DNS requests won't forward properly.
#iptables -t nat -A PREROUTING -i eth1 -p udp -m udp -j REDIRECT --to-ports 6667

#Setup routes. This allows the VM to route all traffic (including traffic not intended for the vm) through the proper interface
ip route del 0/0
route add default gw $INTERNET_ROUTER_IP dev eth1
sysctl -w net.ipv4.ip_forward=1
