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

# Install oh-my-zsh & plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

brew install zoxide eza bat ripgrep fd fzf jq fastfetch tldr stow
brew install neovim tmux
brew install yabai skhd
brew install go fnm

brew install --cask ghostty bitwarden brave-browser yaak orbstack raycast
# Raycast Extensions: color picker,

brew install borders
brew services start borders

hash -r
