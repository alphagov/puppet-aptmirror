# == Class aptmirror::params
#
# This class is meant to be called from aptmirror
# It sets variables according to platform
#
class aptmirror::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'aptmirror'
      $service_name = 'aptmirror'
    }
    'RedHat', 'Amazon': {
      $package_name = 'aptmirror'
      $service_name = 'aptmirror'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
