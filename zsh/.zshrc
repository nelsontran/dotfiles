#   -----------------------------------
#   1.  ZSH CONFIGURATION
#   -----------------------------------

DISABLE_AUTO_UPDATE=true               # Disable automatic updates

ZSH=/usr/share/oh-my-zsh/              # Path to Oh My Zsh Installation
ZSH_CUSTOM=~/.oh-my-zsh/custom         # Path to custom Oh My Zsh folder
ZSH_THEME="powerline"                  # Zsh theme to load from ~/.oh-my-zsh/themes

plugins=(git zsh-syntax-highlighting)  # Plugins to load in ~/.oh-my-zsh/plugins/*
# -->                                  # Custom plugins in  ~/.oh-my-zsh/custom/plugins

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache   # Zsh cache directory
if [[ ! -d $ZSH_CACHE_DIR ]]; then     # Create directory if not already created
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh               # Initialize Oh My Zsh

#   -----------------------------------
#   2.  TERMINAL MULTIPLEXER
#   -----------------------------------

if ! [ -z "$PS1" ] && ! [ -z "$DISPLAY" ]; then
  if [ -z "$TMUX" ]; then
    exec tmux -2                       # Force tmux to start with 256-color support
  fi                                   # so that Powerline can be displayed properly
fi

vim -c q!                              # tmux theme doesn't load until vim-airline loads
clear

#   -----------------------------------
#   3.  COMMAND ALIASES
#   -----------------------------------

alias pacman='sudo pacman'             # I have super powers! ^.^
alias shutdown='sudo shutdown'

alias ls='ls --color=auto'             # Colorize the ls output
alias ll='ls -l'                       # Use a long listing format
alias l.='ls -d .* --color=auto'       # Show hidden files
alias la='ls -a'                       # Show all files

alias cp='cp -iv'                      # Confirm before overwriting stuff
alias mv='mv -iv'                      # Confirm before overwriting stuff
alias mkdir='mkdir -pv'                # Create nested directories

alias df='df -h'                       # Human-readable sizes
alias free='free -m'                   # Show sizes in MB

alias grep='grep --color=auto'         # Colorize grep
alias egrep='egrep --color=auto'       # Colorize egrep
alias fgrep='fgrep --color=auto'       # Colorize fgrep

alias cd..='cd ../'                    # Go up 1 directory level
alias ..='cd ../'                      # Go up 1 directory level
alias ...='cd ../../'                  # Go up 2 directory levels
alias .3='cd ../../../'                # Go up 3 directory levels
alias .4='cd ../../../../'             # Go up 4 directory levels
alias .5='cd ../../../../../'          # Go up 5 directory levels
alias .6='cd ../../../../../../'       # Go up 6 directory levels

#   -----------------------------------
#   4.  Vi Mode
#   -----------------------------------

set -o vi                              # Use vi mode instead of emacs
bindkey -M viins 'jj' vi-cmd-mode      # Map 'jj' to the <ESC> key

#   -----------------------------------
#   5.  PATH ENVIRONMENT
#   -----------------------------------

export PATH=$HOME/bin:/usr/local/bin:$PATH

