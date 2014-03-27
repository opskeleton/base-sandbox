require 'spec_helper'

describe package('httpd') do
  it { should be_installed }
end

describe file('/etc/httpd/conf/httpd.conf') do
  it { should be_file }
  its(:content) { should match /ServerName default/ }
end
