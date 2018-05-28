source 'https://rubygems.org'

gem 'puppet', ENV.fetch('PUPPET_GEM_VERSION', '>= 4.8')
gem 'facter', '>= 2.0', :require => false

gem 'puppetlabs_spec_helper', '>= 0.1.0'
gem 'puppet-lint', '>= 1.1.0'
gem 'metadata-json-lint'
gem 'rspec-puppet-facts', :require => false

group :acceptance do
  gem 'beaker-rspec'
end
