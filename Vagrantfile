# -*- mode: ruby -*-
# # vi: set ft=ruby :

$script = <<SCRIPT
echo "---> Chef install status:"
dpkg-query -l chef
dpkg -i /vagrant/chef_11.12.8-2_amd64.deb
cd /vagrant

echo "---> Chef install status:"
dpkg-query -l chef

echo "---> Start chef run"
chef-client -z -o chef-purge

echo "---> Chef install status:"
dpkg-query -l chef
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.define "core", primary: true do |core|
    core.vm.box = "precise"
    core.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
    core.vm.network :forwarded_port, guest: 80, host: 8880

    # run shell script
    core.vm.provision "shell", inline: $script
  end
end

