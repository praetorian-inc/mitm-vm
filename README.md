# MITM-VM (Name Pending)

# Description
This is an easy-to-deploy virtual machine that can provide flexible man-in-the-middle capabilities. This project will require little configuration, require little additional hardware, and provide many utilites and tools to accomplish common (and not so common) man-in-the-middle scenarios.

## Virtual Machine Setup
`git clone https://git.praetorianlabs.com/kludwig/mitm-vm.git`

`cd mitm-vm`

`vagrant up`

## Host Setup
This is dependent on the use case. The following two use-cases should cover most situations.
### Use Case 1: The device you want to man-in-the-middle connects to the Internet over Wi-Fi.
1. Point 1

2. Point 2

### Use Case 2: The device you want to man-in-the-middle connects to the Internet via Ethernet.
1. Point 1

2. Point 2

# TODO:
* Setup mallory

* Look into socat | http://www.dest-unreach.org/socat/

* Setup HTTP proxies (Burp, ZAP)
