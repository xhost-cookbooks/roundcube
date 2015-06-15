# Additional (recommended) packages
default['roundcube']['php_packages'] =
  case node['platform_family']
  when 'fedora'
    default['roundcube']['php_packages'] =
      %w(php-mcrypt php-intl php-cli php-mysqlnd)
  when 'rhel'
    default['roundcube']['php_packages'] =
      %w(php-mcrypt php-intl php-cli php-mysql)
  else # debian
    default['roundcube']['php_packages'] =
      %w(php5-mcrypt php5-intl php5-cli php5-mysql)
  end
