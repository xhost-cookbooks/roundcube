# Encoding: utf-8

require_relative 'spec_helper'

describe 'roundcube::install' do
  before { stub_resources }
  let(:chef_runner) { ChefSpec::ServerRunner.new }
  let(:chef_run) { chef_runner.converge(described_recipe) }
  let(:version) { '1.0.2' }

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

  context 'on Fedora' do
    let(:chef_runner) do
      ChefSpec::ServerRunner.new(platform: 'fedora', version: '20')
    end

    %w(
      php-mcrypt
      php-intl
      php-cli
      php-mysqlnd
    ).each do |pkg|
      it "installs #{pkg} package" do
        expect(chef_run).to install_package(pkg)
      end
    end # each pkg
  end # on Fedora

  context 'on CentOS' do
    let(:chef_runner) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '6.6')
    end

    %w(
      php-mcrypt
      php-intl
      php-cli
      php-mysql
    ).each do |pkg|
      it "installs #{pkg} package" do
        expect(chef_run).to install_package(pkg)
      end
    end # each pkg
  end # on Fedora

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
