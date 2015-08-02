require 'spec_helper'

describe file('/etc/duply/s3-ex/conf') do
    it { should contain 'TARGET=s3+http://myUniqueBucketName' }
    it { should contain 'GPG_PW=blabla' }
end

describe command('zbackup') do
  its(:stdout) { should include 'Usage' }
  its(:exit_status) { should eq 0 }
end


