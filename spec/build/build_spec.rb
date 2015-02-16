require 'spec_helper'

describe command('packer version') do
  it { should return_stdout 'Packer v0.7.5' }
end

describe command('lein version') do
  it { should return_stdout 'Leiningen 2.5.1' }
end

describe command('gradle -v') do
  its(:stdout) { should match /Gradle 2.2.1/ }
end

describe command('sbt version') do
  its(:stdout) { should match /0.1-SNAPSHOT/ }
end
