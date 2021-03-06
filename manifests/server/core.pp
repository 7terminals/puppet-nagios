# Class: nagios
#
# This module manages nagios
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class nagios::server::core {
  package { 'nagios': ensure => installed, }

  package { 'nagios-plugins-all':
    ensure  => installed,
    require => Package['nagios'],
  }

  file { '/etc/nagios/localhost.cfg':
    ensure  => absent,
    require => Package['nagios-plugins-all'],
  }

  file { '/etc/nagios/commands.cfg':
    ensure  => absent,
    require => File['/etc/nagios/localhost.cfg'],
  }

  file { '/etc/nagios/cgi.cfg':
    ensure  => present,
    source  => 'puppet:///modules/nagios/server/cgi.cfg',
    require => File['/etc/nagios/commands.cfg'],
  }

  file { '/etc/nagios/nagios.cfg':
    ensure  => present,
    source  => 'puppet:///modules/nagios/server/nagios.cfg',
    require => File['/etc/nagios/cgi.cfg'],
  }

  file { '/etc/nagios/passwd':
    ensure  => present,
    source  => 'puppet:///modules/nagios/server/passwd',
    require => File['/etc/nagios/nagios.cfg'],
  }

  service { 'nagios':
    ensure => running,
    enable => true,
  }
  Nagios_command <<| |>> {
    notify => Service['nagios'],
  }
  Nagios_contactgroup <<| |>> {
    notify => Service['nagios'],
  }
  Nagios_contact <<| |>> {
    notify => Service['nagios'],
  }
  Nagios_hostgroup <<| |>> {
    notify => Service['nagios'],
  }
  Nagios_host <<| |>> {
    notify => Service['nagios'],
  }
  Nagios_service <<| |>> {
    notify => Service['nagios'],
  }
  Nagios_timeperiod <<| |>> {
    notify => Service['nagios'],
  }
  Nagios_servicedependency <<| |>> {
    notify => Service['nagios'],
  }
}
