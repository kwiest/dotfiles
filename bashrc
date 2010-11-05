source /home/bin/dotfiles/bash/env
source /home/bin/dotfiles/bash/config
source /home/bin/dotfiles/bash/aliases

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# RVM Info
[[ -s "/usr/local/lib/rvm" ]] && . "/usr/local/lib/rvm"
