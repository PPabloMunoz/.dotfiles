#!/bin/bash

# Bun
bunInstalled=$(which bun)
if [ -z "$bunInstalled" ]; then
  curl -fsSL https://bun.sh/install | bash
else
  echo "Bun already installed"
fi

# Homebrew
brewInstalled=$(which brew)
if [ -z "$brewInstalled" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed"
fi

brew install zoxide eza bat ripgrep fd fzf jq fastfetch tldr stow
brew install neovim tmux
brew install yabai skhd
brew install go fnm

brew install --cask ghostty bitwarden brave-browser yaak orbstack

brew install borders
borders active_color=0xFF01CFDD inactive_color=0xFF494D64 width=4.0 &

hash -r
