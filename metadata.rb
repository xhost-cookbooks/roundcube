# Encoding: utf-8
name             'roundcube'
maintainer       'Chris Fordham'
maintainer_email 'chris@fordham-nagy.id.au'
license          'Apache 2.0'
description      'Installs/Configures Roundcube Webmail.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ ubuntu debian }.each do |os|
  supports os
end

depends          'apt'
depends          'ark'
depends          'mysql'
depends          'nginx'
depends          'openssl'
depends          'php'

recipe           'roundcube::default',      "Installs and configures Roundcube."
recipe           'roundcube::install',      "Installs Roundcube only."
recipe           'roundcube::configure',    "Configures Roundcube."
recipe           'roundcube::nginx',        "Configures Roundcube on NGINX."
recipe           'roundcube::nginx_vhost',  "Sets up an NGINX site only."

attribute 'roundcube/download_url',
  :display_name => 'Roundcube Download URL',
  :description => 'URL to fetch the Roundcube tarball from.',
  :default => 'https://github.com/roundcube/roundcubemail/releases/download/1.0.2/roundcubemail-1.0.2.tar.gz',
  :recipes => ['roundcube::install']

attribute 'roundcube/download_checksum',
  :display_name => 'Roundcube Dowload Checksum',
  :description => 'The checksum of the Roundcube tarball.',
  :default => '1c1560a7a56e6884b45c49f52961dbbb3f6bacbc7e7c755440750a1ab027171c',
  :recipes => ['roundcube::install']

attribute 'roundcube/version',
  :display_name => 'Roundcube Version',
  :description => 'Roundcube Version string.',
  :default => '1.0.2',
  :recipes => ['roundcube::install']

attribute 'roundcube/install_dir',
  :display_name => 'Roundcube Installation Directory',
  :description => 'The destination directory to extract Roundcube to (minus the trailing /roundcube).',
  :default => '/srv/roundcube',
  :recipes => ['roundcube::install']

attribute 'roundcube/database/host',
  :display_name => 'Roundcube Database Host',
  :description => 'Database server host name or IP address.',
  :default => 'localhost',
  :recipes => ['roundcube::configure']

attribute 'roundcube/database/user',
  :display_name => 'Roundcube Database Username',
  :description => 'Username to grant access privileges for database.',
  :default => 'roundcube',
  :recipes => ['roundcube::configure']

attribute 'roundcube/database/schema',
  :display_name => 'Roundcube Database Name',
  :description => 'Name of the Roundcube database.',
  :default => 'roundcubemail',
  :recipes => ['roundcube::configure']

attribute 'roundcube/database/password',
  :display_name => 'Roundcube Database Password',
  :description => 'Random generated string via secure_password or manually set.',
  :default => 'secure_password',
  :recipes => ['roundcube::configure']

attribute 'roundcube/smtp/server',
  :display_name => 'Roundcube SMTP Server',
  :description => 'The hostname or IP of the SMTP server for Roundcube to interface with for sending mails.',
  :default => 'smtp.gmail.com',
  :recipes => ['roundcube::configure']

attribute 'roundcube/smtp/user',
  :display_name => 'Roundcube SMTP User',
  :description => 'The SMTP username.',
  :default => '',
  :recipes => ['roundcube::configure']

attribute 'roundcube/smtp/password',
  :display_name => 'Roundcube SMTP Password',
  :description => 'The SMTP password.',
  :default => '',
  :recipes => ['roundcube::configure']
