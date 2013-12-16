# == Class: aptmirror
#
# Manage apt mirrors using apt-mirror.
#
# === Parameters
#
# [*servers*]
#   A hash of servers and distributions and components to fetch from
#   each. Example:
#      {
#        "http://example.com/ubuntu": {
#          "precise": ["main", "universe"],
#          "precise-updates": ["main"]
#        },
#        "http://example.org/debian": { "sid": ["main"] }
#      }
#
class aptmirror (
  $servers = {}
) {

  # validate parameters here

  package {'apt-mirror':
    ensure => installed
  }

  file {'/etc/apt/mirror.list':
    content => template('aptmirror/mirror.list.erb')
  }

  file {'/etc/cron.d/apt-mirror':
    source => 'puppet:///modules/aptmirror/apt-mirror.cron'
  }
}
