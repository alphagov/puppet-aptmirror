# == Class aptmirror::install
#
class aptmirror::install {
  include aptmirror::params

  package { $aptmirror::params::package_name:
    ensure => present,
  }
}
