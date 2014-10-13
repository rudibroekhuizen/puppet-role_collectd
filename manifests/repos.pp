# == Class: role_collectd::repos
#
class role_collectd::repos {

  case $::osfamily {
    debian: {
      case $::lsbdistcodename {
        precise: { include apt
                   apt::ppa { 'ppa:croscondevops/collectd-latest': 
                   }
                 }
        default: { 
                 }
        }
      }
    
    
    redhat: {
      notify { "continue": 
      }
    }
  }
}
