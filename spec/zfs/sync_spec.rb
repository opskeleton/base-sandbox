require 'spec_helper'

describe user('zfs') do
  it { should exist }
end

describe package('zfsutils-linux') do
  it { should be_installed }
end
