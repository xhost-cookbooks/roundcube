# Encoding: utf-8

require_relative 'spec_helper'

describe 'roundcube::nginx_vhost' do
  before { stub_resources }
  let(:chef_run) do
    # include ::nginx recipe to avoid `service[nginx] cannot be found` error
    ChefSpec::SoloRunner.new.converge('roundcube::nginx')
  end

  it 'creates nginx roundcube site file' do
    expect(chef_run)
      .to create_template('/etc/nginx/sites-available/00-roundcube')
      .with_source('nginx_vhost.erb')
  end

  context 'nginx roundcube site template' do
    let(:resource) do
      chef_run.template('/etc/nginx/sites-available/00-roundcube')
    end

    it 'notifies nginx restart' do
      expect(resource).to notify('service[nginx]').to(:restart).delayed
    end
  end # nginx rouncube site template
end
