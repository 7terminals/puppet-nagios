import 'nagios' include 'nagios::server::core'
include nagios::server::commands include nagios::server::contactgroups include nagios::server::contacts include nagios::server::hostdependencys include nagios::server::hostgroups include nagios::server::hosts include nagios::server::services include nagios::server::timeperiods nagios_hostgroup {
	'hostgroup-linux-servers' :
		alias => 'Hostgroup for all Linux Servers',
		ensure => present,
		members => 'localhost',
}
nagios_host {
	'localhost' :
		address => '127.0.0.1',
		use => 'host-template-linux-server',
}
nagios_service {
	'localhost-check_ping' :
		use => 'service-template-generic-service',
		host_name => 'localhost',
		service_description => 'PING',
		check_command => 'check_ping!100.0,20%!500.0,60%'
}

