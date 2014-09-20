require 'spec_helper'

describe package('virtualbox-4.3') do
    it { should be_installed }
end

describe command('vboxmanage') do
    it { should return_exit_status 0 }
end

cmd = "vboxmanage list systemproperties | grep 'Default machine'"

describe command("su - vagrant -c \"#{cmd}\"") do
    it { should return_exit_status 0 }
    it { should return_stdout('Default machine folder:          /vagrant') }
end
