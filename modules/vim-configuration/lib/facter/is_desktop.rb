Facter.add("is_desktop") do
        setcode do
         system('dpkg -l ubuntu-desktop').to_s 
        end
end

