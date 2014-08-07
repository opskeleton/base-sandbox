require 'spec_helper'

describe command('zfs') do
    it { should return_exit_status 2 }
end

describe file('/etc/sudoers.d/zfs') do
  it { should contain 'C_ZFS' }
end

