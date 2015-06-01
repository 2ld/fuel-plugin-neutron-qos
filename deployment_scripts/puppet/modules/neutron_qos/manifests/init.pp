class neutron_qos (
  $qos_plugin = 'neutron.services.qos.qos_plugin.QosPlugin',
  $node_role  = undef,
) {

  include neutron_qos::params

  if $node_role == 'controller' or $node_role == 'primary-controller' {

    service { $neutron_qos::params::server_service:
      ensure => running,
      enable => true,
    }

    neutron_config { 'DEFAULT/service_plugins':
      value          => $qos_plugin,
      append_to_list => true,
    }

    Neutron_config<||> ~> Service[$neutron_qos::params::server_service]

  }

  service { $neutron_qos::params::qos_agent_service:
    ensure => running,
    enable => true,
  }

}
