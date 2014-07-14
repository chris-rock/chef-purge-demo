# Chef Purge

This project demonstrates a chef run without internet connection.

 - Installs local package
 - Runs chef-client in local mode
 - Purges the installation of chef

# Usage

Download omnibus package for

```bash
cd /chef-purge
wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/13.04/x86_64/chef_11.12.8-2_amd64.deb
vagrant up
vagrant provision
```

During vagrant provision, the following will be executed:

```bash
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
```

