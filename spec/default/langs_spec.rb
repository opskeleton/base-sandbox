require 'spec_helper'

describe package('esl-erlang') do
  it { should be_installed }
end

describe file('/usr/share/elixir-v0.14.0') do
  it { should be_directory}
end
