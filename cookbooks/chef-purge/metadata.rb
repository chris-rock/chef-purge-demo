name             "chef-purge"
maintainer       "Christoph Hartmann"
maintainer_email "chris@lollyrock.com"
license          "Apache v2.0"
description      "Uninstalls chef after a successful run"
version          "0.1.0"

recipe 'chef-purge::default', 'removes the chef installer'

supports 'ubuntu'