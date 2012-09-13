class nagios::server::contactgroups {
		resources {
		'nagios_contactgroup' :
			name => 'nagios_contactgroup',
			purge => true,
	}
	nagios_contactgroup {
		'admins' :
			alias => 'Nagios Administrators',
			members => 'nagios-admin',
	}
}