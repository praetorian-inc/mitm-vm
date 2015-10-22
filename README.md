# MITM-VM (Name Pending)

# Description
This is an easy-to-deploy virtual machine that can provide flexible man-in-the-middle capabilities. This project will require little configuration, require little additional hardware, and provide many utilites and tools to accomplish common (and not so common) man-in-the-middle scenarios.

## Virtual Machine Setup
`git clone https://git.praetorianlabs.com/kludwig/mitm-vm.git`

`cd mitm-vm`

`vagrant up`

When prompted, select the interface that will be the gateway interface


## Host Setup
This is dependent on the use case. The following two use-cases should cover most situations.
### Use Case 1: The device you want to man-in-the-middle connects to the Internet over Wi-Fi.
0. Update the INTERNET_ROUTER_IP environment variable in bootstrap.sh to match the IP address of your host gateway.

1. Spin-up the mitm-vm using `vagrant up`. During initializiation you will be prompted to select an interface for bridging in the vm. Select the interface that will go from the virtual machine to the Internet. In this use-case, it will be your Ethernet interface.


2. Route all traffic on your Macbook through the VM. 
    * This can be done via your Network System Preferences in OS X. System Preferences → Network → Ethernet → Configure IPv4 → Manually → Set Static IP to a valid static IP, set the subnet to 0.0.0.0, and set Router to the ip address of the mitm-vm.

3. Confirm that you have Internet access on the host, and that traffic is routing through the VM.

4. [Turn your Macbook into a Wireless Acces Point](http://support.apple.com/kb/PH13855?locale=en_US)

5. Confirm that the device you want to mitm can access the internet.

6. Run `vagrant ssh` to get on the mitm-vm and do all your sniffing/modifying/etc.

##TODO
* Look into socat | http://www.dest-unreach.org/socat/

* Setup HTTP proxies (Burp, ZAP)
