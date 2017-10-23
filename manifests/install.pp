# == Class: metricbeat::install
#
class metricbeat::install {
  $package_ensure = $metricbeat::ensure ? {
    /absent/ => 'purged',
    default  => $metricbeat::package_version
  }

  package { $metricbeat::package_name:
    ensure          => $package_ensure,
    install_options => ['--allow-unauthenticated', '-f'],
  }
}
