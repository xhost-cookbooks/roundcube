# Encoding: utf-8

require_relative 'spec_helper'

family = os[:family].downcase

web_user, web_group =
  if %w(debian ubuntu).include?(family)
    %w(www-data www-data)
  elsif %w(redhat centos fedora scientific amazon).include?(family)
    %w(nginx nginx)
  elsif %w(suse opensuse).include?(family)
    %w(wwwrun www)
  elsif %w(arch).include?(family)
    %w(http http)
  elsif %w(freebsd).include?(family)
    %w(www www)
  else
    %w(www-data www-data)
  end

describe file('/srv/roundcube') do
  it { should be_directory }
  it { should be_owned_by web_user }
  it { should be_grouped_into web_group }
end

describe file('/srv/roundcube/index.php') do
  it { should be_file }
  it { should be_owned_by web_user }
  it { should be_grouped_into web_group }
  its(:content) { should match 'Roundcube Webmail IMAP Client' }
end

describe file('/srv/roundcube/config/config.inc.php') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_readable.by_user web_user }
end

describe file('/etc/roundcube') do
  it { should be_directory }
end

describe file('/etc/roundcube/config') do
  it { should be_symlink }
  it { should be_linked_to '/srv/roundcube/config/config.inc.php' }
end

describe command('php -l /srv/roundcube/index.php') do
  its(:exit_status) { should eq 0 }
end
