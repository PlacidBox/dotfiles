#!/usr/bin/env bash
set -eu

# $1 -- File to remove and change to symlink
# $2 -- dotfile to symlink in to new system
function force_symlink {
    if [[ $1 != "$HOME"* ]]; then # sanity check
        echo "bad link $1 to $2"
        exit 1
    fi
    if [ ! -h $1 ]; then
        mkdir -p `dirname $1` || true
        rm $1 || true
        ln --no-target-directory -s $2 $1
    fi
}

# ZSH config
# Should probably make a stub .zshrc that just `source`es the real one rather than symlinking.
force_symlink ~/.zshrc ~/dotfiles/zsh/zshrc.zsh

# VS code setup, settings, keymaps, extensions
force_symlink ~/.config/Code/User/settings.json     ~/dotfiles/code/settings.json
force_symlink ~/.config/Code/User/keybindings.json  ~/dotfiles/code/keybindings.json
cat code/extensions.txt | xargs -L 1 code --install-extension

# i3-wm
force_symlink ~/.config/i3/config           ~/dotfiles/i3/config
force_symlink ~/.config/i3status/config     ~/dotfiles/i3/status_config
