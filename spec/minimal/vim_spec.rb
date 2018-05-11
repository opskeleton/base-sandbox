require 'spec_helper'

describe file('/home/re-ops/.vimrc') do
    it { should contain 'pathogen' }
    it { should be_file }
    it { should be_linked_to '/home/re-ops/.vim/.vimrc' }
end


