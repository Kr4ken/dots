typeset -U path

# prepends
path=(
    ~/.bin/
    "$path[@]")

# appends

export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

# prune paths that don't exist
path=($^path(N))
