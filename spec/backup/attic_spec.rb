require 'spec_helper'

describe command('attic init foo') do
  its(:stdout) { should include 'Initializing repository at "foo"' }
  its(:exit_status) { should eq 0 }
end

describe command('attic create foo::Today /home/vagrant/.ssh') do
  its(:exit_status) { should eq 0 }
end

describe command('mkdir /home/vagrant/dest') do
  its(:exit_status) { should eq 0 }
end

describe command('sudo attic mount foo /home/vagrant/dest') do
  its(:exit_status) { should eq 0 }
end

describe command('sudo ls /home/vagrant/dest') do
  its(:stdout) { should include 'Today' }
  its(:exit_status) { should eq 0 }
end




