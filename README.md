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
1. Spin-up the mitm-vm.

2. [Turn your Macbook into a Wireless Acces Point](http://support.apple.com/kb/PH13855?locale=en_US)

3. Route all traffic on your Macbook through the VM. 
    * This can be done via your Network System Preferences in OS X. System Preferences → Network → Ethernet → Configure IPv4 → Manually → Set Static IP to a valid static IP, Subnet to the proper subnet, and _router to the ip address of the mitm-vm_.

4. Confirm that you have Internet access on the host, and that traffic is routing through the VM.

# TODO:
* Setup mallory

* Look into socat | http://www.dest-unreach.org/socat/

* Setup HTTP proxies (Burp, ZAP)
