# Encoding: utf-8

require_relative 'spec_helper'

describe 'roundcube::php_fpm' do
  before { stub_resources }
  let(:chef_runner) { ChefSpec::SoloRunner.new }
  let(:chef_run) { chef_runner.converge(described_recipe) }
  let(:node) { chef_runner.node }

  it 'includes php-fpm recipe' do
    expect(chef_run).to include_recipe('php-fpm')
  end

  it 'creates php FPM pool' do
    expect(chef_run).to create_template(
      "#{node['php-fpm']['pool_conf_dir']}/roundcube.conf"
    )
  end

  context 'on CentOS' do
    let(:chef_runner) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '6.6')
    end

    it 'fixes php session directory' do
      expect(chef_run).to create_directory('/var/lib/php/session')
        .with_owner('nginx')
        .with_group('nginx')
        .with_mode('00700')
    end
  end # on CentOS

  context 'on Fedora' do
    let(:chef_runner) do
      ChefSpec::ServerRunner.new(platform: 'fedora', version: '20')
    end

    it 'does not fix php session directory' do
      expect(chef_run).to_not create_directory('/var/lib/php/session')
    end
  end # on Fedora

  context 'on Ubuntu' do
    let(:chef_runner) do
      ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '12.04')
    end

    it 'does not fix php session directory' do
      expect(chef_run).to_not create_directory('/var/lib/php/session')
    end
  end # on Ubuntu
end
