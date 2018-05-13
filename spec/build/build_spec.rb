require 'spec_helper'

describe command('packer version') do
  its(:stdout) { should include 'Packer v1.1.3' }
end

describe command('lein version') do
  its(:stdout) { should include'Leiningen 2.8.1' }
end

describe command('gradle --version') do
  its(:stdout) { should match /Gradle 4.7/ }
end
