MANIFEST=${1:-manifests/default.pp}
puppet apply --modulepath=modules:static-modules $MANIFEST --hiera_config hiera.yaml $@
