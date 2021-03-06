# == Class: role_collectd
#
# Full description of class role_collectd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { role_collectd:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class role_collectd {

  # Add repos for collectd version 5
  class { 'role_collectd::repos':
  }

  case $::osfamily {
    debian: {
      class { 'collectd':
        purge        => true,
        recurse      => true,
        purge_config => true,
        require      => Class['role_collectd::repos'],
      }    
    }
    
    redhat: {
      # Overrule service_name from inherits collectd::params using resource collector
      Service <| title == 'collectd' |> { name => 'collectd5' }

      # Overrule file name collectd.conf from inherits collectd::params using resource collector
      File <| title == 'collectd.conf' |> { path => '/etc/collectd5.conf' }

      # Install collectd
      class { 'collectd':
        package_name => 'collectd5',
        purge        => true,
        recurse      => true,
        purge_config => true,
        require      => Class['role_collectd::repos'],
      }
    }
  }

  # Install collectd plugins
  class { 'role_collectd::plugins':
    require => Class['collectd'],
  }

}
