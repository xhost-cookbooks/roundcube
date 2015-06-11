# Encoding: utf-8

name             'roundcube_test'
maintainer       'Xabier de Zuazo'
maintainer_email 'xabier@zuazo.org'
license          'Apache 2.0'
description      'This cookbook is used with test-kitchen to test the parent, '\
                 'roundcube cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'roundcube'
depends 'nokogiri', '~> 0.1.4'
