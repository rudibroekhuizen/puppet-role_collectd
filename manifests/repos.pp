# == Class: base::repos
#
class base::repos {

  case $::osfamily {
    debian: {
      # Add ppa for latest version, only works on Ubuntu 12.04
      include apt
      apt::ppa { 'ppa:croscondevops/collectd-latest': 
      }
    }
    
    redhat: {
      notify { "continue": 
      }
    }
  }
}
