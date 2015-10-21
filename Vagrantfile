Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.network "public_network"
  #Provision all utilities
  config.vm.provision :shell, path: "bootstrap.sh"
end
