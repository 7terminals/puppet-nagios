class nagios::server::commands {
  resources { 'nagios_command':
    name  => 'nagios_command',
    purge => true,
  }

  # SAMPLE SERVICE CHECK COMMANDS
  # The following 'check_local_...' functions are designed to monitor
  # various metrics on the host that Nagios is running on.

  nagios_command { 'check_local_disk':
    ensure       => present,
    command_line => '$USER1$/check_disk -w $ARG1$ -c $ARG2$ -p $ARG3$',
  }

  nagios_command { 'check_local_load':
    ensure       => present,
    command_line => '$USER1$/check_load -w $ARG1$ -c $ARG2$',
  }

  nagios_command { 'check_local_procs':
    ensure       => present,
    command_line => '$USER1$/check_procs -w $ARG1$ -c $ARG2$ -s $ARG3$',
  }

  nagios_command { 'check_local_users':
    ensure       => present,
    command_line => '$USER1$/check_users -w $ARG1$ -c $ARG2$',
  }

  # The following 'check_...' commands are used to monitor services on
  # both local and remote hosts.


  nagios_command { 'check_dns':
    ensure       => present,
    command_line => '$USER1$/check_dns -H www.yahoo.com -s $HOSTADDRESS$',
  }

  nagios_command { 'check_ftp':
    ensure       => present,
    command_line => '$USER1$/check_ftp -H $HOSTADDRESS$',
  }

  nagios_command { 'check_hpjd':
    ensure       => present,
    command_line => '$USER1$/check_hpjd -H $HOSTADDRESS$ -C public',
  }

  nagios_command { 'check_http':
    ensure       => present,
    command_line => '$USER1$/check_http -H $HOSTADDRESS$',
  }

  nagios_command { 'check_nntp':
    ensure       => present,
    command_line => '$USER1$/check_nntp -H $HOSTADDRESS$',
  }

  nagios_command { 'check_ping':
    ensure       => present,
    command_line => '$USER1$/check_ping -H $HOSTADDRESS$ -w $ARG1$ -c $ARG2$ -p 5',
  }

  nagios_command { 'check_pop':
    ensure       => present,
    command_line => '$USER1$/check_pop -H $HOSTADDRESS$',
  }

  nagios_command { 'check_smtp':
    ensure       => present,
    command_line => '$USER1$/check_smtp -H $HOSTADDRESS$',
  }

  nagios_command { 'check_tcp':
    ensure       => present,
    command_line => '$USER1$/check_tcp -H $HOSTADDRESS$ -p $ARG1$',
  }

  nagios_command { 'check_telnet':
    ensure       => present,
    command_line => '$USER1$/check_tcp -H $HOSTADDRESS$ -p 23',
  }

  nagios_command { 'check_udp':
    ensure       => present,
    command_line => '$USER1$/check_udp -H $HOSTADDRESS$ -p $ARG1$',
  }

  # SAMPLE HOST CHECK COMMANDS
  # This command checks to see if a host is "alive" by pinging it
  # The check must result in a 100% packet loss or 5 second (5000ms) round trip
  # average time to produce a critical error.
  # Note: Only one ICMP echo packet is sent (determined by the '-p 1' argument)


  nagios_command { 'check-host-alive':
    ensure       => present,
    command_line => '$USER1$/check_ping -H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -p 1',
  }

  # SAMPLE NOTIFICATION COMMANDS
  # These are some example notification commands.  They may or may not work on
  # your system without modification.  As an example, some systems will require
  # you to use "/usr/bin/mailx" instead of "/usr/bin/mail" in the commands below.


  nagios_command { 'host-notify-by-email':
    ensure       => present,
    command_line => '/usr/bin/printf "%b" "***** Nagios 2.12 *****\n\nNotification Type: $NOTIFICATIONTYPE$\nHost: $HOSTNAME$\nState: $HOSTSTATE$\nAddress: $HOSTADDRESS$\nInfo: $HOSTOUTPUT$\n\nDate/Time: $LONGDATETIME$\n" | /bin/mail -s "Host $HOSTSTATE$ alert for $HOSTNAME$!" $CONTACTEMAIL$',
  }

  nagios_command { 'notify-by-email':
    ensure       => present,
    command_line => '/usr/bin/printf "%b" "***** Nagios 2.12 *****\n\nNotification Type: $NOTIFICATIONTYPE$\n\nService: $SERVICEDESC$\nHost: $HOSTALIAS$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\n\nDate/Time: $LONGDATETIME$\n\nAdditional Info:\n\n$SERVICEOUTPUT$" | /bin/mail -s "** $NOTIFICATIONTYPE$ alert - $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **" $CONTACTEMAIL$',
  }

  # SAMPLE PERFORMANCE DATA COMMANDS
  # These are sample performance data commands that can be used to send performance
  # data output to two text files (one for hosts, another for services).  If you
  # plan on simply writing performance data out to a file, consider using the
  # host_perfdata_file and service_perfdata_file options in the main config file.

  nagios_command { 'process-host-perfdata':
    ensure       => present,
    command_line => '/usr/bin/printf "%b" "$LASTHOSTCHECK$\t$HOSTNAME$\t$HOSTSTATE$\t$HOSTATTEMPT$\t$HOSTSTATETYPE$\t$HOSTEXECUTIONTIME$\t$HOSTOUTPUT$\t$HOSTPERFDATA$\n" >> /var/log/nagios/host-perfdata.out',
  }

  # nagios_command { 'process-service-perfdata':
  #  ensure       => present,
  #  command_line => '/usr/bin/printf "%b"
  #  "$LASTSERVICECHECK$\t$HOSTNAME$\t$SERVICEDESC$\t$SERVICESTATE$\t$SERVICEATTEMPT$\t$SERVICESTATETYPE$\t$SERVICEEXECUTIONTIME$\t$SERVICELATENCY$\t$SERVICEOUTPUT$\t$SERVICEPERFDATA$\n" >>
  #  /var/log/nagios/service-perfdata.out',
  #}
}

