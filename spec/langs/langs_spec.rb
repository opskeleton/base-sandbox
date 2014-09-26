require 'spec_helper'

describe package('esl-erlang') do
  it { should be_installed }
end

describe file('/usr/share/elixir-v0.15.1') do
  it { should be_directory}
end

describe package('nodejs') do
  it { should be_installed }
end

describe command('node -v') do
  it { should return_stdout 'v0.10.32' }
end

# describe ppa('chris-lea/node.js') do
  # it { should exist }
# end
