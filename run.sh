MANIFEST=manifests/default.pp
ENV=prod
puppet apply --modulepath=modules:static-modules ${1:-$MANIFEST} --hiera_config hiera.yaml --environment=${2:-$ENV} "${@:3}"
