#!/bin/bash

# You can modify this script here and the changes will be applied ( pass --dots arg)

update_dotfile() {
    local source_file=$1
    local target_file=$2

    if ! cmp -s "$source_file" "$target_file"; then
        echo "Updating $target_file"
        cp "$source_file" "$target_file"
        echo "Changes copied to $target_file"
    else
        echo "$target_file is already up to date"
    fi
}

# If no arguments are passed, default to --all
if [ "$#" -eq 0 ]; then
    set -- --all
fi


case "$1" in
    -z)
        update_dotfile "$HOME/.config/zsh/.zshrc" "$HOME/Documents/code/dotfiles/.config/.zshrc"
        ;;
    -k)
        update_dotfile "$HOME/.config/kitty/kitty.conf" "$HOME/Documents/code/dotfiles/.config/kitty.conf"
        ;;
    -t)
        update_dotfile "$HOME/.config/tmux/tmux.conf" "$HOME/Documents/code/dotfiles/.config/tmux.conf"
        ;;
    --dots)
        script_path=$(readlink -f "$0")
        sudo cp "$HOME/Documents/code/dotfiles/.config/dotsclone.sh" "$script_path"
        ;;
    --hypr)
        update_dotfile "$HOME/.config/hypr/hyprland.conf" "$HOME/Documents/code/dotfiles/.config/hypr/hyprland.conf"
        update_dotfile "$HOME/.config/hypr/keybindings.conf" "$HOME/Documents/code/dotfiles/.config/hypr/hyprland.conf"
        ;;
    --all)
        update_dotfile "$HOME/.config/zsh/.zshrc" "$HOME/Documents/code/dotfiles/.config/.zshrc"
        update_dotfile "$HOME/.config/kitty/kitty.conf" "$HOME/Documents/code/dotfiles/.config/kitty.conf"
        update_dotfile "$HOME/.config/tmux/tmux.conf" "$HOME/Documents/code/dotfiles/.config/tmux.conf"
        update_dotfile "$HOME/.config/zathura/zathurarc" "$HOME/Documents/code/dotfiles/.config/zathurarc"
        update_dotfile "$HOME/.config/hypr/hyprland.conf" "$HOME/Documents/code/dotfiles/.config/hypr/hyprland.conf"
        update_dotfile "$HOME/.config/hypr/keybindings.conf" "$HOME/Documents/code/dotfiles/.config/hypr/hyprland.conf"
        ;;
    *)
        echo "Usage: dotsclone -z| -k| -t| --dots| --all"
        ;;
esac
