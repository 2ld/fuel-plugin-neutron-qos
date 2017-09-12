$fuel_settings = parseyaml($astute_settings_yaml)
$roles = node_roles($fuel_settings['nodes'], $fuel_settings['uid'])

if $fuel_settings {
  class { 'neutron_qos':
    roles => $roles,
  }
}
