require 'spec_helper'

describe user('zfs') do
  it { should exist }
end


describe package('ubuntu-zfs') do
  it { should be_installed }
end
