require 'spec_helper'

describe file('/home/vagrant/.vimrc') do
    it { should contain 'pathogen' }
    it { should be_file }
    it { should be_linked_to '/home/vagrant/.vim/.vimrc' }
end


