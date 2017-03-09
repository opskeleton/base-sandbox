require 'spec_helper'

describe command('/usr/local/bin/zbackup') do
  its(:stderr) { should include 'Usage' }
  its(:exit_status) { should eq 1 }
end


