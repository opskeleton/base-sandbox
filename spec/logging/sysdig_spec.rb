require 'spec_helper'

describe package('sysdig') do
  it { should be_installed }
end

describe command('sysdig --help') do
   it { should return_exit_status 0 }
end

describe kernel_module('sysdig_probe') do
    it { should be_loaded }
end
