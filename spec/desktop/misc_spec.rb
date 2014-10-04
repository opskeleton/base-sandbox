require 'spec_helper'

describe file('/etc/sane.d/net.conf') do
  it { should contain '1.2.3.4' }
end

describe file('/etc/default/apport') do
  it { should contain 'enabled=0' }
end

