#!/usr/bin/env bash
set -eu

if [ ! -h ~/.zshrc ]; then
    # Should probably make a stub .zshrc that just `source`es the real one,
    # rather than symlinking.
    pushd ~
    rm .zshrc || true
    ln -s ~/dotfiles/zsh/zshrc.zsh .zshrc
    popd
fi

if [ ! -h ~/.config/Code/User/settings.json ]; then
    mkdir -p ~/.config/Code/User/ || true
    pushd ~/.config/Code/User/
    rm settings.json keybindings.json || true
    ln -s ~/dotfiles/code/settings.json settings.json
    ln -s ~/dotfiles/code/keybindings.json keybindings.json
    popd
fi

cat code/extensions.txt | xargs -L 1 code --install-extension
