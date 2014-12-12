# Encoding: utf-8
#
# Cookbook Name:: roundcube
# Recipe:: configure
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

template "#{node['roundcube']['install_dir']}/roundcube/config/config.inc.php" do
  source 'config.inc.php.erb'
  variables(
    database_schema: node['roundcube']['database']['schema'],
    database_host: node['roundcube']['database']['host'],
    database_user: node['roundcube']['database']['user'],
    database_password: node['roundcube']['database']['password'],
    default_host: node['roundcube']['default_host'],
    smtp_server: node['roundcube']['smtp']['server'],
    smtp_port: node['roundcube']['smtp']['port'],
    smtp_user: node['roundcube']['smtp']['user'],
    smtp_password: node['roundcube']['smtp']['password'],
    support_url: node['roundcube']['support_url'],
    product_name: node['roundcube']['product_name'],
    skin: node['roundcube']['skin']
  )
end

directory '/etc/roundcube'

# convenience symlink
link '/etc/roundcube/config' do
  to "#{node['roundcube']['install_dir']}/roundcube/config/config.inc.php"
end
