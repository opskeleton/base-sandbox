require 'spec_helper'

describe package('esl-erlang') do
  it { should be_installed }
end

describe file('/usr/share/elixir-v0.14.0') do
  it { should be_directory}
end

describe package('nodejs') do
  it { should be_installed }
end

describe command('node -v') do
  it { should return_stdout 'v0.10.29' }
end

describe ppa('ppa:chris-lea/node.js') do
  it { should exist }
end
