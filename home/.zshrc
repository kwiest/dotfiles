#!bin/bash

# Init Starship
eval "$(starship init zsh)"

# Use NeoVim
alias vim=nvim

# AsyncAPI CLI Autocomplete

ASYNCAPI_AC_ZSH_SETUP_PATH=/Users/kyle/Library/Caches/@asyncapi/cli/autocomplete/zsh_setup && test -f $ASYNCAPI_AC_ZSH_SETUP_PATH && source $ASYNCAPI_AC_ZSH_SETUP_PATH; # asyncapi autocomplete setup


