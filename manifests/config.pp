#
class metricbeat::config {

  # Configure .yml file using https://github.com/cataphract/puppet-yaml_settings module
  yaml_settings { '/etc/metricbeat/metricbeat.yml':
    values => $metricbeat::config, 
  }

}
