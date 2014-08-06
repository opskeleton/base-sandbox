require 'spec_helper'
describe 'zfs' do

  context 'with defaults for all parameters' do
    it { should contain_class('zfs') }
  end
end
