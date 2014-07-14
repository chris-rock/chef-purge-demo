# Chef Purge

This project demonstrates a chef run without internet connection.

 - Installs local package
 - Runs chef-client in local mode
 - Purges the installation of chef via chef

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

# Result

```bash
19:11:34 ∅> vagrant up
Bringing machine 'core' up with 'virtualbox' provider...
[core] VirtualBox VM is already running.
19:12:11 ∅> vagrant provision
[core] Running provisioner: shell...
[core] Running: inline script
---> Chef install status:
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                             Version                           Description
+++-================================-=================================-==============================================================================
un  chef                             <none>                            (no description available)
Selecting previously unselected package chef.
(Reading database ... 61149 files and directories currently installed.)
Unpacking chef (from .../chef_11.12.8-2_amd64.deb) ...
Setting up chef (11.12.8-2) ...
Thank you for installing Chef!
---> Chef install status:
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                             Version                           Description
+++-================================-=================================-==============================================================================
ii  chef                             11.12.8-2                         The full stack of chef
---> Start chef run
[2014-07-14T17:12:31+00:00] WARN: No config file found or specified on command line, using command line options.
[2014-07-14T17:12:31+00:00] INFO: Auto-discovered chef repository at /vagrant
[2014-07-14T17:12:31+00:00] INFO: Starting chef-zero on port 8889 with repository at repository at /vagrant
  One version per cookbook

[2014-07-14T17:12:31+00:00] INFO: Forking chef instance to converge...
[2014-07-14T17:12:31+00:00] WARN: 
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
SSL validation of HTTPS requests is disabled. HTTPS connections are still
encrypted, but chef is not able to detect forged replies or man in the middle
attacks.

To fix this issue add an entry like this to your configuration file:

``
  # Verify all HTTPS connections (recommended)
  ssl_verify_mode :verify_peer

  # OR, Verify only connections to chef-server
  verify_api_cert true
``

To check your SSL configuration, or troubleshoot errors, you can use the
`knife ssl check` command like so:

``
  knife ssl check -c 
``

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

[2014-07-14T17:12:31+00:00] INFO: *** Chef 11.12.8 ***
[2014-07-14T17:12:31+00:00] INFO: Chef-client pid: 3311
[2014-07-14T17:12:33+00:00] WARN: Run List override has been provided.
[2014-07-14T17:12:33+00:00] WARN: Original Run List: []
[2014-07-14T17:12:33+00:00] WARN: Overridden Run List: [recipe[chef-purge]]
[2014-07-14T17:12:33+00:00] INFO: Run List is [recipe[chef-purge]]
[2014-07-14T17:12:33+00:00] INFO: Run List expands to [chef-purge]
[2014-07-14T17:12:33+00:00] INFO: Starting Chef Run for vagrant-ubuntu-precise-64
[2014-07-14T17:12:33+00:00] INFO: Running start handlers
[2014-07-14T17:12:33+00:00] INFO: Start handlers complete.
[2014-07-14T17:12:33+00:00] INFO: HTTP Request Returned 404 Not Found : Object not found: /reports/nodes/vagrant-ubuntu-precise-64/runs
[2014-07-14T17:12:33+00:00] INFO: Loading cookbooks [chef-purge@0.1.0]
[2014-07-14T17:12:33+00:00] INFO: Processing file[/root/x.txt] action create (chef-purge::default line 1)
[2014-07-14T17:12:33+00:00] INFO: Processing package[chef] action purge (chef-purge::default line 6)
[2014-07-14T17:12:35+00:00] INFO: package[chef] purged
[2014-07-14T17:12:35+00:00] WARN: Skipping final node save because override_runlist was given
[2014-07-14T17:12:35+00:00] INFO: Chef Run complete in 1.445303952 seconds
[2014-07-14T17:12:35+00:00] INFO: Running report handlers
[2014-07-14T17:12:35+00:00] INFO: Report handlers complete
---> Chef install status:
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                             Version                           Description
+++-================================-=================================-==============================================================================
un  chef                             <none>                            (no description available)
19:12:40 ∅>

```

