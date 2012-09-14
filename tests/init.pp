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
	"${fqdn}-ping" :
		use => 'service-template-generic-service',
		host_name => 'localhost',
		service_description => 'ping',
		check_command => 'check_ping!100,20%!500,60%',
}
nagios_service {
	"${fqdn}-load" :
		use => 'service-template-generic-service',
		host_name => 'localhost',
		service_description => 'load',
		check_command => 'check_local_load!1!5',
}
nagios_service {
	"${fqdn}-disk":
		use => 'service-template-generic-service',
		host_name => 'localhost',
		service_description => 'disk',
		check_command => 'check_local_disk!25%!20%!/!',
}

