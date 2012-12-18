Facter.add("is_desktop") do
  setcode do
    ubuntu = system('dpkg -l ubuntu-desktop') 
    xubuntu = system('dpkg -l xubuntu-desktop') 
    res = xubuntu or ubuntu
    res.to_s
  end
end

