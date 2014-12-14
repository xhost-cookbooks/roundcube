Roundcube Webmail Cookbook
==========================

[![Roundcube Cookbook](http://img.shields.io/badge/cookbook-roundcube%20v0.2.0-green.svg)](https://github.com/xhost-cookbooks/roundcube)
[![Build Status](https://travis-ci.org/xhost-cookbooks/roundcube.svg)](https://travis-ci.org/xhost-cookbooks/roundcube)
[![Code Climate](https://codeclimate.com/github/xhost-cookbooks/system.png)](https://codeclimate.com/github/xhost-cookbooks/roundcube)

A Chef cookbook for Roundcube Webmail, a PHP-based webmail application.

Upstream:
- https://github.com/roundcube/roundcubemail
- http://roundcube.net/
- http://trac.roundcube.net/wiki

Prerequisites
-------------

### Database Setup
This cookbook purposely does not provide any functionality to setup and configure the database component of Roundcube. It is recommended that a different host is used as the database server.

Create a database and import the initial SQl, see http://trac.roundcube.net/wiki/Howto_Install#DatabaseConfiguration.

#### MySQL Quick Setup

##### Grant privileges

```
GRANT ALL ON *.* to roundcube@localhost IDENTIFIED BY 's3cure_as';
```
Or, all hosts:
```
GRANT ALL ON *.* to roundcube@'%' IDENTIFIED BY 's3cure_as';
```

Requirements
------------
### Supported Platforms
 * Debian/Ubuntu

Contribution for other platforms welcome (submit a pull request).

Attributes
----------

 * `node['roundcube']['version']` - Roundcube Version string
 * `node['roundcube']['download_url']` - URL to fetch the Roundcube tarball from
 * `node['roundcube']['download_checksum']` - The checksum of the Roundcube tarball
 * `node['roundcube']['install_dir']` - The destination directory to extract Roundcube to (minus the trailing /roundcube)
 * `node['roundcube']['default_host']` - The IMAP server host for Roundcube to interface
 * `node['roundcube']['support_url']` - The support URL to display for the Roundcube service
 * `node['roundcube']['product_name']` - The product name to display for the Roundcube service
 * `node['roundcube']['skin']` - The name of the skin to use for Roundcube's appearance
 * `node['roundcube']['listen_port']` - The listen port to configure with Roundcube's web server
 * `node['roundcube']['server_name']` - The server_name to configure with Roundcube's web server
 * `node['roundcube']['database']['user']` - Username to grant access privileges for database
 * `node['roundcube']['database']['password']` - Database password for the roundcube database user
 * `node['roundcube']['database']['schema']` - Name of the Roundcube database
 * `node['roundcube']['smtp']['server']` - The hostname or IP of the SMTP server for Roundcube to interface with for sending mails
 * `node['roundcube']['smtp']['port']` - The port of the SMTP server for sending mails
 * `node['roundcube']['smtp']['user']` = The SMTP username
 * `node['roundcube']['smtp']['password']` = The SMTP password

Recipes
-------
#### `roundcube::default`
The default recipe will update the apt package list initially, then install PHP & MySQL client and lastly install and configure Roundcube.

#### `roundcube::install`
Installs Roundcube as defined by node attributes using ark.

#### `roundcube::configure`
Configures Roundcube only.

#### `roundcube::nginx`
Installs and configures NGINX including needed dependencies and a vhost for Roundcube.

#### `roundcube::nginx_vhost`
A dry recipe that provides a configuration file for an NGINX Roundcube vhost only. The NGINX service is notified to restart.

Usage
-----
The default recipe will install and configure Roundcube intefacing GMail for both IMAP and SMTP; no web server is configured - it is recommended to also add the `roundcube::nginx` recipe to the run_list (Apache HTTPd support TODO or contrib welcome).

When utilizing the nginx recipe, the `php-fpm` cookbook is used to configure PHP-FPM which by default provides a pool named 'www' with the socket residing in `/var/run/php-fpm-www.sock`.

Note: this cookbook does not configure a database server for Roundcube, this should be done independently (see prerequisites above).

Prototyping
-----------
For further prototyping Roundcube on a server node: https://github.com/chef-blueprints/roundcube.

Troubleshooting
---------------

For Roundcube itself, see http://trac.roundcube.net/wiki/Howto_Install#Troubleshooting.

License & Authors
-----------------
- Author:: Chris Fordham (<chris@fordham-nagy.id.au>)

```text
Copyright 2014 Chris Fordham

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
