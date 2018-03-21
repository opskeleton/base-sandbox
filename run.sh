ARGS=${@:- --hiera_config hiera.yaml manifests/default.pp}
puppet apply --modulepath=modules:static-modules  $ARGS
