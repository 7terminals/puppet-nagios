class nagios::server::hostgroups {
	resources {
		'nagios_hostgroup' :
			name => 'nagios_hostgroup',
			purge => true,
	}
	nagios_hostgroup {
		'hostgroup-linux-servers' :
			alias => 'Hostgroup for all Linux Servers',
			ensure => present,
			notes => 'Basic hostgroup for all Linux Servers',
	}
}