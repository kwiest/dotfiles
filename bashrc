# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# RVM Info
[[ -s "/usr/local/lib/rvm" ]] && . "/usr/local/lib/rvm"
