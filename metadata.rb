# Encoding: utf-8

name             'roundcube'
maintainer       'Chris Fordham'
maintainer_email 'chris@fordham-nagy.id.au'
license          'Apache 2.0'
description      'Installs/Configures Roundcube Webmail.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

%w(ubuntu debian).each do |os|
  supports os
end

depends          'apt'
depends          'build-essential'
depends          'ark'
depends          'mysql'
depends          'nginx'
depends          'openssl'
depends          'php'
depends          'php-fpm'

recipe 'roundcube::default',      'Installs and configures Roundcube.'
recipe 'roundcube::install',      'Installs Roundcube only.'
recipe 'roundcube::configure',    'Configures Roundcube.'
recipe 'roundcube::nginx',        'Configures Roundcube on NGINX.'
recipe 'roundcube::nginx_vhost',  'Sets up an NGINX site only.'

attribute 'roundcube/download_url',
          display_name: 'Roundcube Download URL',
          description: 'URL to fetch the Roundcube tarball from.',
          default: 'https://github.com/roundcube/roundcubemail/releases/download/1.0.2/roundcubemail-1.0.2.tar.gz',
          recipes: ['roundcube::default', 'roundcube::install']

attribute 'roundcube/download_checksum',
          display_name: 'Roundcube Dowload Checksum',
          description: 'The checksum of the Roundcube tarball.',
          default: '1c1560a7a56e6884b45c49f52961dbbb3f6bacbc7e7c755440750a1ab027171c',
          recipes: ['roundcube::default', 'roundcube::install']

attribute 'roundcube/version',
          display_name: 'Roundcube Version',
          description: 'Roundcube Version string.',
          default: '1.0.2',
          recipes: ['roundcube::default', 'roundcube::install']

attribute 'roundcube/install_dir',
          display_name: 'Roundcube Installation Directory',
          description: 'The destination directory to extract Roundcube to (minus the trailing /roundcube).',
          default: '/srv',
          recipes: ['roundcube::default', 'roundcube::install']

attribute 'roundcube/default_host',
          display_name: 'Roundcube Default Host',
          description: 'The IMAP server host for Roundcube to interface (default: GMail).',
          default: 'ssl://imap.gmail.com:993',
          recipes: ['roundcube::default', 'roundcube::configure']

attribute 'roundcube/support_url',
          display_name: 'Roundcube Support URL',
          description: 'The support URL to display for the Roundcube service.',
          default: '',
          recipes: ['roundcube::default', 'roundcube::configure']

attribute 'roundcube/product_name',
          display_name: 'Roundcube Product Name',
          description: 'The product name to display for the Roundcube service.',
          default: 'Roundcube Webmail',
          recipes: ['roundcube::default', 'roundcube::configure']

attribute 'roundcube/skin',
          display_name: 'Roundcube Skin',
          description: 'The name of the skin to use for Roundcube\'s appearance.',
          default: 'larry',
          recipes: ['roundcube::default', 'roundcube::configure']

attribute 'roundcube/listen_port',
          display_name: 'Roundcube Listen Port',
          description: 'The listen port to configure with Roundcube\'s web server.',
          default: '80',
          recipes: ['roundcube::nginx']

attribute 'roundcube/server_name',
          display_name: 'Roundcube Server Name',
          description: 'The server_name to configure with Roundcube\'s web server.',
          default: 'localhost',
          recipes: ['roundcube::nginx']

attribute 'roundcube/database/host',
          display_name: 'Roundcube Database Host',
          description: 'Database server host name or IP address.',
          default: 'localhost',
          recipes: ['roundcube::default', 'roundcube::configure']

attribute 'roundcube/database/user',
          display_name: 'Roundcube Database Username',
          description: 'Username to grant access privileges for database.',
          default: 'roundcube',
          recipes: ['roundcube::default', 'roundcube::configure']

attribute 'roundcube/database/schema',
          display_name: 'Roundcube Database Name',
          description: 'Name of the Roundcube database.',
          default: 'roundcubemail',
          recipes: ['roundcube::default', 'roundcube::configure']

attribute 'roundcube/database/password',
          display_name: 'Roundcube Database Password',
          description: 'Database password for the roundcube database user.',
          default: 'secure_password',
          recipes: ['roundcube::default', 'roundcube::configure']

attribute 'roundcube/smtp/server',
          display_name: 'Roundcube SMTP Server',
          description: 'The hostname or IP of the SMTP server for Roundcube to interface with for sending mails.',
          default: 'tls://smtp.gmail.com',
          recipes: ['roundcube::default', 'roundcube::configure']

attribute 'roundcube/smtp/port',
          display_name: 'Roundcube SMTP Port',
          description: 'The port of the SMTP server for sending mails.',
          default: '587',
          recipes: ['roundcube::default', 'roundcube::configure']

attribute 'roundcube/smtp/user',
          display_name: 'Roundcube SMTP User',
          description: 'The SMTP username (default: user provided on login form).',
          default: '%u',
          recipes: ['roundcube::default', 'roundcube::configure']

attribute 'roundcube/smtp/password',
          display_name: 'Roundcube SMTP Password',
          description: 'The SMTP password (default: password provided on login form).',
          default: '%p',
          recipes: ['roundcube::default', 'roundcube::configure']
