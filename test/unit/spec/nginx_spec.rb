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

  it 'includes roundcube::nginx_vhost recipe' do
    expect(chef_run).to include_recipe('roundcube::nginx_vhost')
  end

  it 'disables default nginx site' do
    expect(chef_run.node['nginx']['default_site_enabled']).to eq(false)
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
end
