#!/bin/bash

#set -x

repo_dir_path=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_symlink_if_not_exists () {
    source=$1
    destination=$2

    # Ensure the directory structure exists.
    mkdir -p "$(dirname destination)"

    # Attempt to create the symlink if it doesnt exist.
    if [ -f "$destination" ]; then
        echo "Skipping: $destination already exists."
    elif ln -s "$source" "$destination"; then
        echo "Symlink $destination created!"
    else
        echo "Error creating symlink"
    fi
}

# Tmux config
config_source="$repo_dir_path/.tmux.conf"
config_dest="$HOME/.tmux.conf"
create_symlink_if_not_exists "$config_source" "$config_dest"

find "$repo_dir_path/.config" -type f -print0 | while IFS= read -r -d '' src; do
    dest="$HOME${src//$repo_dir_path/}"
    create_symlink_if_not_exists "$src" "$dest"
done

