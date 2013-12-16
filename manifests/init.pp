# == Class: aptmirror
#
# Full description of class aptmirror here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class aptmirror (
) inherits aptmirror::params {

  # validate parameters here

  anchor { 'aptmirror::begin': } ->
  class { 'aptmirror::install': } ->
  class { 'aptmirror::config': }
  class { 'aptmirror::service': } ->
  anchor { 'aptmirror::end': }

  Anchor['aptmirror::begin']  ~> Class['aptmirror::service']
  Class['aptmirror::install'] ~> Class['aptmirror::service']
  Class['aptmirror::config']  ~> Class['aptmirror::service']
}
