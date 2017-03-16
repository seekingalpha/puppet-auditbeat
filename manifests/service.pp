#
class metricbeat::service {
  $service_ensure = $metricbeat::ensure ? {
    /absent/ => 'stopped',
    default  => 'running',
  }
  $service_enable = $metricbeat::ensure ? {
    /absent/ => false,
    default  => true,
  }

  service { $metricbeat::service_name:
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}
