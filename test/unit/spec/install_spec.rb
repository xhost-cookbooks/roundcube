# Encoding: utf-8

require_relative 'spec_helper'

describe 'roundcube::install' do
  before { stub_resources }
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }
  let(:version) { '1.0.2' }

  it 'installs roundcube' do
    expect(chef_run).to put_ark('roundcube')
      .with_url(
        'https://github.com/roundcube/roundcubemail/releases/download/'\
        "#{version}/roundcubemail-#{version}.tar.gz"
      )
      .with_path('/srv')
      .with_checksum(
        '1c1560a7a56e6884b45c49f52961dbbb3f6bacbc7e7c755440750a1ab027171c'
      )
      .with_version(version)
      .with_owner('www-data')
      .with_group('www-data')
  end
end
