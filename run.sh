MANIFEST=manifests/default.pp
puppet apply --modulepath=modules:static-modules ${1:-$MANIFEST} --hiera_config hiera.yaml
