source 'https://rubygems.org'

gem 'berkshelf', '> 3.1'

# Uncomment these lines if you want to live on the Edge:
#
# group :development do
#   gem "berkshelf", github: "berkshelf/berkshelf"
#   gem "vagrant", github: "mitchellh/vagrant", tag: "v1.5.2"
# end
#
# group :plugins do
#   gem "vagrant-berkshelf", github: "berkshelf/vagrant-berkshelf"
#   gem "vagrant-omnibus", github: "schisamo/vagrant-omnibus"
# end

gem 'chef', ENV.key?('CHEF_VERSION') ? ENV['CHEF_VERSION'] : '> 11'
gem 'ohai', '~> 7.4' if RUBY_VERSION < '2' # Fix Ruby 1.9.3 support
gem 'rake'
gem 'rubocop'
gem 'foodcritic'
gem 'chefspec'
gem 'test-kitchen'
gem 'kitchen-vagrant'
gem 'guard', '>= 2.6'
gem 'guard-rubocop', '>= 1.1'
gem 'guard-foodcritic', '>= 1.0.2'
