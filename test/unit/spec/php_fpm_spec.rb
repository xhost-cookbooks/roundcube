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
end
