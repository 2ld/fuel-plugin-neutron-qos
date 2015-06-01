$fuel_settings = parseyaml($astute_settings_yaml)

if $fuel_settings {
  class { 'neutron_qos':
    node_role => $fuel_settings['role'],
  }
}
