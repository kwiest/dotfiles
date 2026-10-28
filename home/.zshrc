#!bin/bash

# Init Starship
eval "$(starship init zsh)"

# Use NeoVim
alias vim=nvim

# AsyncAPI CLI Autocomplete

ASYNCAPI_AC_ZSH_SETUP_PATH=/Users/kyle/Library/Caches/@asyncapi/cli/autocomplete/zsh_setup && test -f $ASYNCAPI_AC_ZSH_SETUP_PATH && source $ASYNCAPI_AC_ZSH_SETUP_PATH; # asyncapi autocomplete setup


# Per-project env and tool versions (personal mise.local.toml files)
eval "$(mise activate zsh)"

# Work/personal profile rules + claude() account wrapper
source "$HOME/.config/zsh/profiles.zsh"
