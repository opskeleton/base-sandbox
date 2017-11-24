MANIFEST=manifests/default.pp
ENV=prod
puppet apply --modulepath=modules:static-modules $MANIFEST --hiera_config hiera.yaml $@
