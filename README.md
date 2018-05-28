# auditbeaat

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with auditbeaat](#setup)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Description

Install and configure Auditbeat as easy as include a single module and add all
attributes through hiera. Based off rudibroekhuizen/puppet-metricbeat.

## Setup

### Beginning with auditbeaat

Basic configuration with default bin, sbin and etc paths auditing.

```ruby
class { 'auditbeat':
  config => {
    'auditbeat.modules' => [
      module => 'file_integrity'
    ]
  }
}
```

## Usage

### Install auditbeat 6.2.4 using default config

```ruby
class { 'auditbeat':
  manage_repo => true,
  repository  => {
    location => 'https://artifacts.elastic.co/packages/6.x/apt',
    release  => stable,
    repos    => main,
    key      => {
      id     => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
      source => 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
    }
  },
  package_version => '6.2.4'
}
```

## Reference

### Classes

#### Public classes

* `auditbeat` - Installs and configures auditbeat.

#### Private classes

* `auditbeat::install` - Installs auditbeat package.
* `auditbeat::config` - Configures auditbeat.
* `auditbeat::repo` - Configures auditbeat's source repo.
* `auditbeat::service` - Manages auditbeat's service.

## Limitations

This module is tested on Ubuntu 16.04 (Xenial) and should run on similar
apt-based distributions. Contributions are welcome.
