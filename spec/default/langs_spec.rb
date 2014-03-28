require 'spec_helper'

describe package('esl-erlang') do
  it { should be_installed }
end

describe file('/usr/share/elixir-v0.12.4') do
  it { should be_directory}
end
