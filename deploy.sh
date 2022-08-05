#!/bin/bash

#set -x

repo_dir_path=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_symlink_if_not_exists () {
    source=$1
    destination=$2

    # Ensure the directory structure exists.
    mkdir -p $(dirname destination)

    # Attempt to create the symlink if it doesnt exist.
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

for FILE in $(find "$repo_dir_path/.config" -type f); do
    src=$FILE
    dest="$HOME$(sed "s#$repo_dir_path##g" <<< $FILE)"

    create_symlink_if_not_exists $src $dest
done
