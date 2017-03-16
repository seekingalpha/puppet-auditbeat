#
class metricbeat::config {

  yaml_settings { '/etc/metricbeat/metricbeat.yml':
    values => $metricbeat::config, 
  }

}
