class nagios::server::hosts {
  resources { 'nagios_host':
    name  => 'nagios_host',
    purge => true,
  }

  nagios_host { 'host-template-linux-server':
    active_checks_enabled        => 1,
    /* check_command => '',
     * check_interval => '',
     */
    check_period   => '24x7',
    contact_groups => 'admins',
    ensure         => present,
    event_handler_enabled        => '1',
    failure_prediction_enabled   => '1',
    flap_detection_enabled       => '1',
    max_check_attempts           => '10',
    /* Resend notification every 2 hours */
    notification_interval        => '120',
    notification_options         => 'd,u,r',
    notification_period          => '24x7',
    notifications_enabled        => '24x7',
    process_perf_data            => '1',
    retain_nonstatus_information => '1',
    retain_status_information    => '1',
    /* DONT REGISTER THIS DEFINITION - ITS NOT A REAL HOST, JUST A TEMPLATE! */
    register       => '0'
  }

  # Defination for host localhost
  nagios_host { 'localhost':
    address => '127.0.0.1',
    use     => 'host-template-linux-server',
  }
}
