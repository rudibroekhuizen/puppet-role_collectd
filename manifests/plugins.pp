# == Class: role_collectd::plugins
#
class role_collectd::plugins {

  class { 'collectd::plugin::load':
  }

  class { 'collectd::plugin::memory':
  }

  class { 'collectd::plugin::disk':
    disks => ['sdb1'],
  }
  
  class { 'collectd::plugin::df':
  }
  
  class { 'collectd::plugin::uptime':
  }
  
  class { 'collectd::plugin::interface':
  }
  
  class { 'collectd::plugin::logfile':
    log_level => 'info',
    log_file  => '/var/log/collectd.log',
  }

  # Output to Logstash
  class { 'collectd::plugin::network':
    timetolive    => '70',
    maxpacketsize => '42',
    forward       => false,
    reportstats   => true,
    servers       => { 'localhost' => { 'port' => '25826',
                                      },
                     },
  }
}
