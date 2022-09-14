#!/bin/bash

repo_dir_path=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_symlink_if_not_exists () {
    source=$1
    destination=$2
    
    # Ensure the directory structure exists.
    mkdir -p "$(bash -c "dirname $destination")"

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
printf "Tmux Config\n"
config_source="$repo_dir_path/.tmux.conf"
config_dest="$HOME/.tmux.conf"
create_symlink_if_not_exists "$config_source" "$config_dest"

# Nvim config
printf "\nNvim Config\n"
find "$repo_dir_path/.config" -type f -print0 | while IFS= read -r -d '' src; do
    dest="$HOME${src//$repo_dir_path/}"
    create_symlink_if_not_exists "$src" "$dest"
done

# Fonts
printf "\nFonts\n"
find "$repo_dir_path/fonts" -type f -print0 | while IFS= read -r -d '' src; do
    dest="$HOME/.local/share${src//$repo_dir_path/}"
    create_symlink_if_not_exists "$src" "$dest"
done

printf "\nBootstrapping Packer Config\n"
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

printf "\nConfig .bashrc\n"
BASHRC="$HOME/.bashrc"
if $(grep -qxF '# dannys-custom-config' $BASHRC); then
    echo "Skipping: Found config settings."
else
    cat "$repo_dir_path/bashrc" >> $BASHRC
fi

printf "\nConfig .inputrc\n"
config_source="$repo_dir_path/inputrc"
config_dest="$HOME/.inputrc"
create_symlink_if_not_exists "$config_source" "$config_dest"

printf "\nConfig kitty\n"
config_source="$repo_dir_path/.config/kitty/kitty.conf"
config_dest="$HOME/.config/kitty/kitty.conf"
create_symlink_if_not_exists "$config_source" "$config_dest"

config_source="$repo_dir_path/.config/kitty/gruvbox_dark.conf"
config_dest="$HOME/.config/kitty/gruvbox_dark.conf"
create_symlink_if_not_exists "$config_source" "$config_dest"
