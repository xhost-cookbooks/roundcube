# Encoding: utf-8

require_relative 'spec_helper'

describe 'roundcube::configure' do
  before { stub_resources }
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'creates config.inc.php template' do
    expect(chef_run)
      .to create_template('/srv/roundcube/config/config.inc.php')
      .with_source('config.inc.php.erb')
  end

  it 'creates /etc/roundcube directory' do
    expect(chef_run).to create_directory('/etc/roundcube')
  end

  it 'creates /etc/roundcube/config symlink' do
    expect(chef_run).to create_link('/etc/roundcube/config')
      .with_to('/srv/roundcube/config/config.inc.php')
  end
end
