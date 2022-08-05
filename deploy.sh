#!/bin/bash

set -x

repo_dir_path=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_symlink_if_not_exists () {
    source=$1
    destination=$2

    if [ -f "$destination" ]; then
        echo "Skipping: $destination already exists."
    elif ln -s $source $destination; then
        echo "Symlink $destination created!"
    else
        echo "Error creating symlink"
    fi
}

# Tmux config
config_source="$repo_dir_path/.tmux.conf"
config_dest="$HOME/.tmux.conf"
create_symlink_if_not_exists $config_source $config_dest


