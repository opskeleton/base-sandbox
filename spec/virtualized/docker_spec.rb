require 'spec_helper'

describe package('lxc-docker') do
    it { should be_installed }
end

describe service('docker') do
    it { should be_running }
end

describe command('fig') do
    it { should return_exit_status 1 }
end


