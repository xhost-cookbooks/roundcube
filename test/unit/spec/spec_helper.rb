# Encoding: utf-8
require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/application'
require_relative 'matchers'

::LOG_LEVEL = :fatal
::UBUNTU_OPTS = {
  platform: 'ubuntu',
  version: '12.04',
  log_level: ::LOG_LEVEL
}
::CHEFSPEC_OPTS = {
  log_level: ::LOG_LEVEL
}

def stub_resources
  stub_command('which nginx').and_return(true)
  stub_command(
    'test -d /etc/php5/fpm/pool.d || mkdir -p /etc/php5/fpm/pool.d'
  ).and_return(true)
end

at_exit { ChefSpec::Coverage.report! }
