require 'spec_helper'

describe command('/usr/bin/zbackup') do
  its(:stderr) { should include 'Usage' }
  its(:exit_status) { should eq 1 }
end


