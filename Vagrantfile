Vagrant.configure("2") do |config|
  # Set the base box to CentOS Stream 9
  config.vm.box = "generic/centos9s"

  # Define the prod machine
  config.vm.define "prod" do |prod|
    prod.vm.hostname = "prod"
    prod.vm.network "private_network", ip: "192.168.56.101"
    prod.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
  end

  # Define the dev machine
  config.vm.define "dev" do |dev|
    dev.vm.hostname = "dev"
    dev.vm.network "private_network", ip: "192.168.56.102"
    dev.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
  end

  # Define the infra machine
  config.vm.define "infra" do |infra|
    infra.vm.hostname = "infra"
    infra.vm.network "private_network", ip: "192.168.56.103"
    infra.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
  end

end
