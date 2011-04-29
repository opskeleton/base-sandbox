Facter.add("vim_version") do
        setcode do
            %x(vim --version) =~ /.*(Vi IMproved \d.\d).*/
            $~[1] if $~
        end
end

