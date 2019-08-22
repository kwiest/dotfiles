# ~/bin user scripts
set -x PATH $HOME/bin $PATH

# Cargo (Rust)
set -x PATH $HOME/.cargo/bin $PATH

# Postgres
set -x PATH /Applications/Postgres.app/Contents/Versions/Latest/bin $PATH

# Haskell
set -x PATH $HOME/.local/bin $PATH

# Rbenv
set -x PATH $HOME/.rbenv/bin $PATH
rbenv init - | source

# Alias vi/vim -> neovim
alias vi='nvim'
alias vim='nvim'
