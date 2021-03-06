class nagios::server::services {
  resources { 'nagios_service':
    name  => 'nagios_service',
    purge => true,
  }

  nagios_service { 'service-template-generic-service':
    active_checks_enabled        => '1',
    check_freshness => '0',
    check_period    => '24x7',
    contact_groups  => 'admins',
    ensure          => present,
    failure_prediction_enabled   => '1',
    flap_detection_enabled       => '1',
    /* Re-check the service up to 4 times in order to determine its final (hard) state */
    max_check_attempts           => '4',
    /* Check the service every 5 minutes under normal conditions */
    normal_check_interval        => '1',
    notification_options         => 'w,u,c,r',
    notification_period          => '24x7',
    notifications_enabled        => '1',
    notification_interval        => '120',
    /* Active service checks should be parallelized (disabling this can lead to major performance problems) */
    parallelize_check            => '1',
    passive_checks_enabled       => '1',
    process_perf_data            => '1',
    retain_nonstatus_information => '1',
    retain_status_information    => '1',
    /*  Re-check the service every minute until a hard state can be determined */
    retry_check_interval         => '1',
    /* DONT REGISTER THIS DEFINITION - ITS NOT A REAL SERVICE, JUST A TEMPLATE! */
    register        => '0',
  }

  # service checks for localhost
  nagios_service { "${fqdn}-ping":
    use                 => 'service-template-generic-service',
    host_name           => 'localhost',
    service_description => 'ping',
    check_command       => 'check_ping!100,20%!500,60%',
  }

  nagios_service { "${fqdn}-load":
    use                 => 'service-template-generic-service',
    host_name           => 'localhost',
    service_description => 'load',
    check_command       => 'check_local_load!10!15',
  }

  nagios_service { "${fqdn}-disk":
    use                 => 'service-template-generic-service',
    host_name           => 'localhost',
    service_description => 'disk',
    check_command       => 'check_local_disk!25%!20%!/!',
  }
}
