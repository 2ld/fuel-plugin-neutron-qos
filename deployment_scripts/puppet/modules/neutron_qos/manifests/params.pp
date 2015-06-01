class neutron_qos::params {

  if ($::osfamily == 'RedHat') {
    $server_service = 'neutron-server'
    $qos_agent_service = 'neutron-qos-agent'
  } else {
    fail("Unsopported osfamily ${::osfamily}")
  }

}
