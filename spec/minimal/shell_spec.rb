require 'spec_helper'

# zsh
describe package('zsh') do
    it { should be_installed }
end

describe file('/home/re-ops/.zshrc') do
    it { should contain 'plugins' }
    it { should be_file }
    it { should be_linked_to '/home/re-ops/.oh-my-zsh/.zshrc' }
end

describe file('/home/re-ops/.oh-my-zsh') do
  it { should be_directory }  
  it { should be_owned_by 're-ops' }
end

describe file('/etc/passwd') do
  it { should contain '/home/re-ops:/bin/zsh' }
end

# ack
describe file('/home/re-ops/.ackrc') do
  it { should contain 'clojure' }
  it { should be_linked_to '/home/re-ops/.dots/.ackrc' }
end

describe package('ack-grep') do
    it { should be_installed }
end

# rlwrap
describe file('/home/re-ops/.inputrc') do
  it { should contain 'vi' }
  it { should be_linked_to '/home/re-ops/.dots/.inputrc' }
end

describe package('rlwrap') do
    it { should be_installed }
end

# tmux
describe package('tmux') do
    it { should be_installed }
end

describe file('/home/re-ops/.tmux.conf') do
  it { should contain 'set' }
  it { should be_linked_to '/home/re-ops/.tmux/.tmux.conf.plugins' }
end

describe package('tmuxinator') do
  it { should be_installed.by('gem') }
end

describe file('/home/re-ops/.tmuxinator') do
  it { should be_directory }
  it { should be_owned_by 're-ops' }
end

