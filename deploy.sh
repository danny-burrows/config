#!/bin/bash

set -x

repo_dir_path=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Tmux config
config_dest="$HOME/.tmux.conf"
if [ -f "$config_dest" ]; then
    echo "Skipping: $config_dest already exists."
elif ln -s $repo_dir_path/.tmux.conf $config_dest; then
    echo "Symlink $config_dest created!"
else
    echo "Error creating symlink"
fi

