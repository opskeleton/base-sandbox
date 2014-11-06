require 'spec_helper'

# zsh
describe package('zsh') do
    it { should be_installed }
end

describe file('/home/vagrant/.zshrc') do
    it { should contain 'plugins' }
    it { should be_file }
    it { should be_linked_to '/home/vagrant/.oh-my-zsh/.zshrc' }
end

describe file('/home/vagrant/.oh-my-zsh') do
  it { should be_directory }  
  it { should be_owned_by 'vagrant' }
end

describe file('/etc/passwd') do
  it { should contain '/home/vagrant:/bin/zsh' }
end

# ack
describe file('/home/vagrant/.ackrc') do
  it { should contain 'clojure' }
  it { should be_linked_to '/home/vagrant/.dots/.ackrc' }
end

describe package('ack-grep') do
    it { should be_installed }
end

describe file('/usr/bin/ack') do
  it { should be_linked_to '/usr/bin/ack-grep' }
end

# rlwrap
describe file('/home/vagrant/.inputrc') do
  it { should contain 'vi' }
  it { should be_linked_to '/home/vagrant/.dots/.inputrc' }
end

describe package('rlwrap') do
    it { should be_installed }
end

# tmux
describe package('tmux') do
    it { should be_installed }
end

describe file('/home/vagrant/.tmux.conf') do
  it { should contain 'set' }
  it { should be_linked_to '/home/vagrant/.tmux/.tmux.con' }
end

describe package('tmuxinator') do
  it { should be_installed.by('gem') }
end

describe file('/home/vagrant/.tmuxinator') do
  it { should be_directory }  
  it { should be_owned_by 'vagrant' }
end

# misc
describe file('/opt/z') do
  it { should be_directory }  
  it { should be_owned_by 'vagrant' }
end

# transcrypt
describe file('/opt/transcrypt') do
  it { should be_directory }  
  it { should be_owned_by 'vagrant' }
end

describe file('/home/vagrant/bin/transcrypt') do
  it { should be_linked_to '/opt/transcrypt/transcrypt' }
end
