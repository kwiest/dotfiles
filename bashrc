# Basics

: ${HOME=~}
: ${UNAME=$(uname)}

# Source global definitions
test -r /etc/bashrc &&
    . /etc/bashrc

test -r ~/localrc &&
    . ~/localrc

source ~/dotfiles/bash/env
source ~/dotfiles/bash/config
source ~/dotfiles/bash/aliases

# Add ~/bin to $PATH
export PATH=$PATH:$HOME/bin

# RVM Info for system wide rvm install
# If installed per user, load scripts in localrc with following line:
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "/usr/local/lib/rvm" ]] && . "/usr/local/lib/rvm"

