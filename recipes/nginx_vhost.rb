# Encoding: utf-8
#
# Cookbook Name:: roundcube
# Recipe:: nginx_vhost
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

template '/etc/nginx/sites-available/00-roundcube' do
  source 'nginx_vhost.erb'
  variables(
    roundcube_dir: "#{node['roundcube']['install_dir']}/roundcube",
    listen_port: node['roundcube']['listen_port'],
    server_name: node['roundcube']['server_name']
  )
  notifies :restart, 'service[nginx]', :delayed
end
