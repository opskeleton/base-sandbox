require 'spec_helper'

describe command('zfs') do
    it { should return_exit_status 2 }
end

describe file('/etc/sudoers.d/zfs') do
  it { should contain 'C_ZFS' }
end

describe file('/etc/modprobe.d/zfs.conf') do
  it { should contain 'options zfs zfs_arc_max=4294967296' }
end
