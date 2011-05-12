Facter.add("vim_version") do
        setcode do
           vim_version = %x(vim --version)
           vim_version =~ /.*(Vi IMproved \d.\d).*/
           version = $~[1] if $~
           vim_version =~ /Included patches: \d-\d*/ 
           patch_level = $~[0] if $~
           "#{vim_version} #{patch_level}"
        end
end

