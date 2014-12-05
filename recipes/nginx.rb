# Cookbook Name:: roundcube
# Recipe:: nginx
#
# Copyright 2014, Chris Fordham
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'nginx'

# additional packages
[ 'php5-fpm', 'php5-mcrypt', 'php5-intl', 'php5-cli', 'php5-mysql'].each {|package| package package}

service 'php5-fpm' do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end

include_recipe 'roundcube::nginx_vhost'

execute 'nxensite 00-roundcube'

service 'nginx' do
  action [ :enable, :start ]
end
