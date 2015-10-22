Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  #Workaround to fix an OS X specific issue
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'" 
  config.vm.network "public_network"
  #Provision all utilities
  config.vm.provision :shell, path: "bootstrap.sh"
end
