#!/usr/bin/env bash

#Environment variable that corresponds to the Internet-facing switch/router.
export INTERNET_ROUTER_IP="192.168.1.1"

#Fix DNS issues
echo "nameserver 8.8.8.8" > /etc/resolv.conf

#This is needed to supress annoying (but harmeless) error messages from apt-get.
#Do not change this value.
export DEBIAN_FRONTEND=noninteractive

#Route 8888 to 8080. This is used for the Trudy intercept. Remove if you do not want to use trudy.
#/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 8888 -m tcp -j REDIRECT --to-ports 8080

#Route all $dport destined traffic through the VM's port 6443. Use this to intercept TLS traffic. Remove if you do not want to use trudy.
#NOTE: If the device you are proxying validates TLS certificates and you do not have a valid TLS certificate
#      you will not want to do this!
/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 443 -m tcp -j REDIRECT --to-ports 6443

#Routes all other TCP traffic (i.e. traffic that does not fall under the previous two rules) coming into the instance through port 6666 on the VM. Remove if you do not want to use trudy.
/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp -m tcp -j REDIRECT --to-ports 6666

#Setup routes. This allows the VM to route all traffic (including traffic not intended for the VM) through the proper interface
/bin/ip route del 0/0
/sbin/route add default gw $INTERNET_ROUTER_IP dev eth1
sysctl -w net.ipv4.ip_forward=1
