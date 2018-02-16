require 'spec_helper'

describe file('/home/vagrant/.zshrc') do
    it { should contain 'plugins' }
    it { should be_file }
    it { should be_linked_to '/home/vagrant/.oh-my-zsh/.zshrc' }
end


describe user('re-ops') do
  it { should exist }
end

describe file('/usr/local/etc/sudoers.d/re-ops') do
    it { should be_file }
end


describe user('celestial') do
  it { should exist }
end

