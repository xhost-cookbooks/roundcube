# Encoding: utf-8

require_relative 'spec_helper'

family = os[:family].downcase

packages =
  if %w(debian ubuntu).include?(family)
    %w(php5-mcrypt php5-intl php5-cli php5-mysql)
  elsif %w(fedora).include?(family)
    %w(php-mcrypt php-intl php-cli php-mysqlnd)
  elsif %w(redhat centos scientific amazon).include?(family)
    %w(php-mcrypt php-intl php-cli php-mysql)
  else
    %w(php5-mcrypt php5-intl php5-cli php5-mysql)
  end

packages.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
