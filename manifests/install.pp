# == Class: auditbeat::install
#
class auditbeat::install {
  $package_ensure = $auditbeat::ensure ? {
    /absent/ => 'purged',
    default  => $auditbeat::package_version
  }

  package { $auditbeat::package_name:
    ensure          => $package_ensure,
    install_options => ['--allow-unauthenticated', '-f'],
  }
}
