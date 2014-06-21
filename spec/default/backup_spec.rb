require 'spec_helper'

describe file('/etc/duply/s3-ex/conf') do
    it { should contain 'TARGET=s3+http://myUniqueBucketName' }
    it { should contain 'GPG_PW=blabla' }
end

describe file('/opt/syncthing/.config/syncthing/config.xml') do
    it { should contain 'tls="true"' }
    it { should contain '~/appliances-1' }
end

describe service('syncthing') do
    it { should be_running}
end
