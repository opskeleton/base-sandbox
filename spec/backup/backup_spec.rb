require 'spec_helper'

describe command('/usr/bin/zbackup') do
  its(:stdout) { should include 'Usage' }
  its(:exit_status) { should eq 1 }
end

describe command('/usr/bin/octo') do
  its(:stdout) { should include '0.8.0' }
end

describe command('/usr/bin/restic version') do
  its(:stdout) { should include '0.8.3' }
end

describe command('/usr/bin/rclone version') do
  its(:stdout) { should include '1.36' }
end
