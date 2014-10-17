# == Class: role_collectd::plugins
#
class role_collectd::plugins {

  class { 'collectd::plugin::load':
  }

  class { 'collectd::plugin::memory':
  }

  class { 'collectd::plugin::disk':
    disks => ['dm-2'],
  }

  # Output to Logstash
  class { 'collectd::plugin::network':
    servers => { 'localhost' => { 'port' => '25826', 
                                },
               }
  }

}
