# Add Homebrew to PATH
export PATH="/usr/local/bin:$PATH"

# Add QT 5.5 to PATH
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

# Add Postgres to PATH
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias ctags="`brew --prefix`/bin/ctags"
