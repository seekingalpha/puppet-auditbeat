# == Class: metricbeat::repo
#
class metricbeat::repo {
  if $metricbeat::manage_repo {
    include apt
    apt::key { 'elasticsearch-metricbeat':
      ensure => $metricbeat::ensure,
      id     => $metricbeat::repository['key']['id'],
      source => $metricbeat::repository['key']['source'],
    }
    apt::source { 'elasticsearch-metricbeat':
      ensure   => $metricbeat::ensure,
      location => $metricbeat::repository['location'],
      release  => $metricbeat::repository['release'],
      repos    => $metricbeat::repository['repos']
    }
  }
}
