require 'spec_helper'

describe package('docker') do
    it { should be_installed }
end

describe service('docker') do
    it { should be_running }
end

describe command('docker-compose') do
    its(:exit_status) { should eq 1 }
end


