class nagios::server::hostgroups {
  resources { 'nagios_hostgroup':
    name  => 'nagios_hostgroup',
    purge => true,
  }

  nagios_hostgroup { 'hostgroup-generic-servers':
    ensure  => present,
    alias   => 'Generic hostgroup',
    members => 'localhost',
  }
}
