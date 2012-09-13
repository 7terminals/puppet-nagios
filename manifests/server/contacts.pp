class nagios::server::contacts {
		resources {
		'nagios_contact' :
			name => 'nagios_contact',
			purge => true,
	}
	nagios_contact {
		'nagios-admin' :
			alias => 'Nagios Admin',
			service_notification_period => '24x7',
			host_notification_period => '24x7',
			service_notification_options => 'w,u,c,r',
			host_notification_options => 'd,r',
			service_notification_commands => 'notify-by-email',
			host_notification_commands => 'host-notify-by-email',
			email => 'nagios-admin@localhost',
	}
}