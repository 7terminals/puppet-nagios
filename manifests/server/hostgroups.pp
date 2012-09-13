class nagios::server::hostgroups {
	resources {
		'nagios_hostgroup' :
			name => 'nagios_hostgroup',
			purge => true,
	}

}