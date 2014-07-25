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

describe command('nodejs') do
  it { should return_stdout 'v0.10.29' }
end

describe ppa('launchpad-username/ppa-name') do
    it { should exist }
end
