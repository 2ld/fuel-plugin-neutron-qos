class neutron_qos (
  $qos_plugin = 'neutron.services.qos.qos_plugin.QosPlugin',
  $roles  = [],
) {

  include neutron_qos::params

  if 'controller' in $roles or 'primary-controller' in $roles {

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
