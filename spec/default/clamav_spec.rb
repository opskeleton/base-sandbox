require 'spec_helper'

describe file('/etc/clamav/scans/all-but-sys-and-dev') do
   it { should be_file }
   it { should be_mode 500}
   it { should contain '/etc/clamav/scans/email_scan' }
end

describe file('/etc/clamav/scans/email_scan') do
   it { should be_file }
   it { should be_mode 500}
   it { should contain 'gookup@gmail.com' }
end
