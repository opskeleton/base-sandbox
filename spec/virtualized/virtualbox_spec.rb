require 'spec_helper'

describe package('virtualbox') do
    it { should be_installed }
end

describe command('vboxmanage') do
    it { should return_exit_status 0 }
end

cmd = "vboxmanage list systemproperties | grep 'Default machine'"

# mainly require for cmd to work
# describe command("/etc/init.d/vboxdrv setup") do
#     it { should return_exit_status 0 }
# end
#
describe command("su - vagrant -c \"#{cmd}\"") do
    it { should return_exit_status 0 }
    it { should return_stdout('Default machine folder:          /vagrant') }
end
