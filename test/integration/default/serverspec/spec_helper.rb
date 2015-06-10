# Encoding: utf-8
require 'serverspec'
require 'infrataster/rspec'

set :backend, :exec

RSpec.configure do |c|
  c.before :all do
    c.path = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
  end
end

Infrataster::Server.define(:web) do |server|
  server.address = '127.0.0.1'
end
