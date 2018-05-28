# == Class: auditbeat::repo
#
class auditbeat::repo {
  if $auditbeat::manage_repo {
    include apt
    apt::key { 'elasticsearch-auditbeat':
      ensure => $auditbeat::ensure,
      id     => $auditbeat::repository['key']['id'],
      source => $auditbeat::repository['key']['source'],
    }
    apt::source { 'elasticsearch-auditbeat':
      ensure   => $auditbeat::ensure,
      location => $auditbeat::repository['location'],
      release  => $auditbeat::repository['release'],
      repos    => $auditbeat::repository['repos']
    }
  }
}
