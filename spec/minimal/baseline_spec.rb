require 'spec_helper'

describe package('sshfs') do
    it { should be_installed }
end

describe package('pwgen') do
    it { should be_installed }
end

describe file('/home/vagrant/.zshrc') do
    it { should contain 'plugins' }
    it { should be_file }
    it { should be_linked_to '/home/vagrant/.oh-my-zsh/.zshrc' }
end


describe user('upgrade') do
  it { should exist }
end

describe file('/etc/sudoers.d/upgrade') do
    it { should be_file }
end

describe package('rng-tools') do
    it { should be_installed }
end


