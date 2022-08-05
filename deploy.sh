#!/bin/bash

#set -x

repo_dir_path=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_symlink_if_not_exists () {
    source=$1
    destination=$2
    
    # Ensure the directory structure exists.
    mkdir -p $(bash -c "dirname $destination")

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

# Nvim config
find "$repo_dir_path/.config" -type f -print0 | while IFS= read -r -d '' src; do
    dest="$HOME${src//$repo_dir_path/}"
    create_symlink_if_not_exists "$src" "$dest"
done

# Fonts
#   NOTE: I think "~/.local/share/fonts" maybe only works on Ubuntu.
find "$repo_dir_path/fonts" -type f -print0 | while IFS= read -r -d '' src; do
    dest="$HOME/.local/share${src//$repo_dir_path/}"
    create_symlink_if_not_exists "$src" "$dest"
done
