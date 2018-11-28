#!/bin/sh
# Generates symlinks from config files in the repo
# to various the appropriate system locations

# Create neovim symlinks
ln -rfs home/.vim/* config/nvim/
ln -rfs home/.vimrc config/nvim/init.vim

ln -viLsT $PWD/icons $HOME/.icons
ln -viLsT $PWD/scripts $HOME/.scripts
ln -viLsT $PWD/fonts $HOME/.local/share/fonts
ln -viLsT $PWD/powerlevel9k home/.oh-my-zsh/themes/powerlevel9k
ln -viLsT $PWD/ipython_config.py $HOME/.ipython/profile_default/ipython_config.py
