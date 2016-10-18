# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  #config.vm.box = "base"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
  
  config.vm.define "mon1" do |mon1|
    #mon1.vm.box = "ubuntu/trusty64"
    mon1.vm.box = "centos/7"
    mon1.vm.network "private_network", ip: "192.168.50.11"
    mon1.vm.hostname = "mon1"
    mon1.vm.provision "shell", path: "ceph-provision.sh"
    mon1.vm.provision "file", source: "ssh-keys/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
    mon1.vm.provision "file", source: "ssh-keys/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
    mon1.vm.provision "shell", inline: "cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
  end
  config.vm.define "osd1" do |osd1|
    #osd1.vm.box = "ubuntu/trusty64"
    osd1.vm.box = "centos/7"
    osd1.vm.network "private_network", ip: "192.168.50.21"
    osd1.vm.hostname = "osd1"
    osd1.vm.provision "shell", path: "ceph-provision.sh"
    osd1.vm.provision "file", source: "ssh-keys/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
    osd1.vm.provision "file", source: "ssh-keys/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
    osd1.vm.provision "shell", inline: "cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
  end
  config.vm.define "osd2" do |osd2|
    #osd2.vm.box = "ubuntu/trusty64"
    osd2.vm.box = "centos/7"
    osd2.vm.network "private_network", ip: "192.168.50.22"
    osd2.vm.hostname = "osd2"
    osd2.vm.provision "shell", path: "ceph-provision.sh"
    osd2.vm.provision "file", source: "ssh-keys/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
    osd2.vm.provision "file", source: "ssh-keys/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
    osd2.vm.provision "shell", inline: "cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
  end
  config.vm.define "deploy" do |deploy|
    #deploy.vm.box = "ubuntu/trusty64"
    deploy.vm.box = "centos/7"
    deploy.vm.network "private_network", ip: "192.168.50.4"
    deploy.vm.hostname = "deploy"
    deploy.vm.provision "shell", path: "ceph-provision.sh"
    deploy.vm.provision "file", source: "deploy.sh", destination: "/home/vagrant/deploy.sh"
    deploy.vm.provision "file", source: "ssh-keys/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
    deploy.vm.provision "file", source: "ssh-keys/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
    deploy.vm.provision "shell", inline: "cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
  end
end
