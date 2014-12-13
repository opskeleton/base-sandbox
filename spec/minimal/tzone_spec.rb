
require 'spec_helper'

describe file('/etc/timezone') do
  it { should contain 'Asia/Jerusalem' }
end
