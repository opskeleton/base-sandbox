require 'spec_helper'

describe package('erlang-nox') do
  it { should be_installed }
end

describe package('elixir') do
  it { should be_installed }
end

describe package('nodejs') do
  it { should be_installed }
end

describe command('node -v') do
  its(:stdout) {should contain 'v4'}
end

describe command('go version') do
  its(:stdout) {should contain 'go version go1.7.5 linux/amd64'}
end

