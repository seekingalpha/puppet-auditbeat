require 'spec_helper'
describe 'auditbeat' do
  let :default_facts do
    {
      osfamily: 'Debian',
      operatingsystem: 'Debian',
      operatingsystemrelease: '8',
      lsbdistcodename: 'jessie',
      lsbdistid: 'jessie',
      puppetversion: '4.8.1'
    }
  end
  context 'with default values for all parameters' do
    let :facts do
      default_facts
    end

    it do
      is_expected.to compile.with_all_deps
      is_expected.to contain_class('auditbeat')
    end
  end
  context 'repository settings' do
    let :facts do
      default_facts
    end

    it do
      is_expected.to contain_class('auditbeat::repo')
      is_expected.to contain_apt__key('elasticsearch-auditbeat')
      is_expected.to contain_apt__source('elasticsearch-auditbeat')
    end
  end
  context 'installation' do
    let :facts do
      default_facts
    end

    it do
      is_expected.to contain_class('auditbeat::install')
      is_expected.to contain_package('auditbeat').with(
        'ensure' => 'latest'
      )
    end
  end
  context 'configuration' do
    let :facts do
      default_facts
    end

    it do
      is_expected.to contain_class('auditbeat::config')
    end
  end
  context 'service' do
    let :facts do
      default_facts
    end

    it do
      is_expected.to contain_class('auditbeat::service')
      is_expected.to contain_service('auditbeat').with(
        'ensure'     => 'running',
        'enable'     => true,
        'hasstatus'  => true,
        'hasrestart' => true
      )
    end
  end
end
