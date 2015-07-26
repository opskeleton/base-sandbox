require 'spec_helper'

describe package('erlang') do
  it { should be_installed }
end

describe file('/usr/share/elixir-v1.0.5') do
  it { should be_directory}
end

describe package('nodejs') do
  it { should be_installed }
end

describe command('node -v') do
  its(:stdout) {should contain 'v0.10.40'}
end

describe command('go version') do
  its(:stdout) {should contain 'go version go1.4 linux/amd64'}
end


# describe ppa('chris-lea/node.js') do
  # it { should exist }
# end
