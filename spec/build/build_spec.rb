require 'spec_helper'
describe command('packer version') do
  it { should return_stdout 'Packer v0.7.5' }
end


