#   file: .zshrc
#   Requires powerline, powerlevel9k, dmenu, zsh,
#   neofetch, loadkeys

# Start tmux on ssh
if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
    tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi

#
#   PATH
#
#
bindkey -v # VIM in console
set laststatus=2
export KEYTIMEOUT=1
export TERM="xterm-256color"
export TERMINAL="/usr/bin/alacritty"
export PAGER="less"
export EDITOR='/usr/bin/nvim'
export PATH="$PATH:/usr/local/cuda-10.0/bin/"
export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
ZSH=$HOME/.oh-my-zsh

#
#   ALIAS
#
#
alias utd-vpn='sudo openconnect vpn.utdallas.edu'
alias pia="bash $HOME/.pia.sh"
alias now="date +%Y-%m-%d.%H:%M:%S"
alias SS="sudo systemctl"
alias gac="git add . && git commit -m"
alias gpom="git push origin master"
alias rewal="wal -g -i \"$HOME/Pictures/Wallpapers/vaporwave.jpg\" --saturate 0.75"
alias ls='ls -hN --color=auto --group-directories-first'
alias ccat="highlight --out-format=ansi"
alias raidstart="mdadm --assemble --scan && mount -a"
alias mars-mips="java -jar $HOME/.scripts/Mars4_5.jar"

# Neovim instead of vim
alias vim="nvim"

# Alias function to attach tmux to remote session
function tssh() {
	ssh $1 -t tmux attach-session
}


#
#
# THEME
#
#
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
source ~/.powerline


# Helps to hide username at console prompt?
export DEFAULT_USER="$USER"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  vi-mode
  zsh-syntax-highlighting
)


# ZSH config
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
source $ZSH/oh-my-zsh.sh
ZSH_HIGHLIGHT_HILIGHTERS=(main brackets pattern cursor)
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fix ls colors for sticky bit directories (mounted drives)
#LS_COLORS=$LS_COLORS:'ow=0;36;43:' ; export LS_COLORS

neofetch
source ~/.shortcuts
