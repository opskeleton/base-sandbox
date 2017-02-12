
describe command('sbt version') do
  its(:stdout) {should contain 'java version "1.8.0"'}
end

describe file('/usr/lib/jvm/java-8-oracle/lib/security/US_export_policy.jar') do
  it { should exist }
end

describe file('/usr/lib/jvm/java-8-oracle/lib/security/local_policy.jar') do
  it { should exist }
end

