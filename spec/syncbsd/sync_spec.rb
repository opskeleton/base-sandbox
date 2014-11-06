require 'spec_helper'


# describe service('syncthing') do
#   it { should be_enabled   }
#   it { should be_running   }
# end
#
# describe port(8080) do
#   it { should be_listening }
# end
#
describe file('/etc/rc.d/syncthing') do
  it { should be_file }
  its(:content) { should match /name=syncthing/ }
  # its(:content) { should match /rcval=syncthing_enable/ }
end
