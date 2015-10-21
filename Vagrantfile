Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise32"
  #The "provision" line is new, and tells Vagrant to use the shell provisioner to setup the machine, with the bootstrap.sh file. 
  #The file path is relative to the location of the project root (where the Vagrantfile is).
  config.vm.provision :shell, path: "bootstrap.sh"
end
