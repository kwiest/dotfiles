#!/bin/bash

echo ">>>> Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null

echo ">>>> Installing apps from Brewfile..."
brew bundle

echo ">>>> Linking config via stow..."
stow -R -v -t ~ -d ~/dotfiles/home .
