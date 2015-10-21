Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.network "public_network", ip: "192.168.1.200"
  config.vm.provision :shell, path: "bootstrap.sh"
end
