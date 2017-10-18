# == Class: metricbeat::config
#
class metricbeat::config {
  $settings = $metricbeat::config

  file { '/etc/metricbeat/metricbeat.yml':
    content => inline_template('<%= @settings.to_yaml() %>'),
    notify  => Service[$metricbeat::service_name]
  }

}
