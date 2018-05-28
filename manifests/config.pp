# == Class: auditbeat::config
#
class auditbeat::config {
  $settings = $auditbeat::config

  file { '/etc/auditbeat/auditbeat.yml':
    content => inline_template('<%= @settings.to_yaml() %>'),
    notify  => Service[$auditbeat::service_name]
  }

}
