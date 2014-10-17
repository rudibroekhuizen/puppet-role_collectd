# Install and configure plugins including output to logstash
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
