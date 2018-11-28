#!/bin/sh
# Generates symlinks from config files in the repo
# to various the appropriate system locations

# Symlinks to .config subdirs, except for Code
ls -A1 | grep -Ev 'symlinks.sh|settings.json' | parallel --tty ln -viLsT $PWD/{} $HOME/.config/{}

# VSCode config separately
mkdir -p $HOME/.config/Code/User
ln -visLT $PWD/settings.json $HOME/.config/Code/User/settings.json

