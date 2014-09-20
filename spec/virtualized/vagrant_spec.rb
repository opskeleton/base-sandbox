require 'spec_helper'

describe package('vagrant') do
    it { should be_installed }
end

describe command('vagrant version') do
    it { should return_exit_status 0 }
end

describe command("su - vagrant -c 'pecrant'") do
    it { should return_exit_status 0 }
end
