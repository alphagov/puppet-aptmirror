# == Class aptmirror::service
#
# This class is meant to be called from aptmirror
# It ensure the service is running
#
class aptmirror::service {
  include aptmirror::params

  service { $aptmirror::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
