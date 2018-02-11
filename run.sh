MANIFEST=manifests/default.pp
puppet apply --modulepath=modules:static-modules $MANIFEST --hiera_config hiera.yaml $@
