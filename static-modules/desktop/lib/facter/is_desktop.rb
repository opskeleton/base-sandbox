Facter.add("is_desktop") do
  setcode do
    Facter.debug("here!")
    ubuntu = system('dpkg -l ubuntu-desktop') 
    xubuntu = system('dpkg -l xubuntu-desktop') 
    if(xubuntu || ubuntu)
	true.to_s
    else
     false.to_s
    end
  end
end

