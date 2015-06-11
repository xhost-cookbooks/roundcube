# Encoding: utf-8

require_relative 'spec_helper'

describe 'roundcube::nginx' do
  before { stub_resources }
  let(:chef_runner) { ChefSpec::SoloRunner.new }
  let(:chef_run) { chef_runner.converge(described_recipe) }

  it 'includes nginx recipe' do
    expect(chef_run).to include_recipe('nginx')
  end

  it 'includes roundcube::php_fpm recipe' do
    expect(chef_run).to include_recipe('roundcube::php_fpm')
  end

  %w(
    php5-mcrypt
    php5-intl
    php5-cli
    php5-mysql
  ).each do |pkg|
    it "installs #{pkg} package" do
      expect(chef_run).to install_package(pkg)
    end
  end # each pkg

  it 'includes roundcube::nginx_vhost recipe' do
    expect(chef_run).to include_recipe('roundcube::nginx_vhost')
  end

  it 'disables default nginx site' do
    expect(chef_run).to run_execute('nxdissite default')
  end

  it 'enables roundcube nginx site' do
    expect(chef_run).to run_execute('nxensite 00-roundcube')
  end

  it 'enables nginx' do
    expect(chef_run).to enable_service('nginx')
  end

  it 'starts nginx' do
    expect(chef_run).to start_service('nginx')
  end

  context 'on Ubuntu' do
    let(:chef_runner) do
      ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '12.04')
    end

    %w(
      php5-mcrypt
      php5-intl
      php5-cli
      php5-mysql
    ).each do |pkg|
      it "installs #{pkg} package" do
        expect(chef_run).to install_package(pkg)
      end
    end # each pkg
  end # on Ubuntu
end
