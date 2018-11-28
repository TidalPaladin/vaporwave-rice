#!/bin/sh

# file: .profile
# Runs on login
export PATH="$PATH:$HOME/.scripts:$HOME/.platformio/penv/bin:$HOME/.local/bin"
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"
export EDITOR="/usr/bin/nvim"
export BROWSER="firefox"
export PAGER="less"
export TERMINAL="/usr/bin/alacritty"
export TERM="xterm-256color"
export SHELL="/usr/bin/zsh"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# File paths
export SW="$HOME/Dropbox/Software"
export CS3340="$SW/CS3340"
export CS6360="$SW/CS6360"
export CS6375="$SW/CS6375"

if [ "$(TTY)" = "/dev/tty1" ]; then
	pgrep -x i3 || exec startx
fi

# Run pywal to apply color scheme
wal -R
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# Run script to remap caps lock
xmodmap "$HOME/.scripts/.xmodmap-caps"
unclutter -idle 2 -root &>/dev/null &

