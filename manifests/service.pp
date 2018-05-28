# == Class: auditbeat::service
#
class auditbeat::service {
  $service_ensure = $auditbeat::ensure ? {
    /absent/ => 'stopped',
    default  => 'running',
  }
  $service_enable = $auditbeat::ensure ? {
    /absent/ => false,
    default  => true,
  }

  service { $auditbeat::service_name:
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
  
}
