
require 'spec_helper'

describe package('autossh') do
    it { should be_installed }
end

describe file('/etc/init/test.conf') do
  it { should contain 'ssh tunnel' }
  it { should contain 'exec su vagrant --preserve-environment -c "autossh -M 0 -NF /home/vagrant/.ssh/config -i  /home/vagrant/.ssh/id_rsa -R 1234:localhost:22 vagrant@localhost"' }
end


