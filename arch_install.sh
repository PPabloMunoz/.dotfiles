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

# yay
sudo pacman -S --needed git base-devel 
git clone https://aur.archlinux.org/yay.git ~/yay && cd yay && makepkg -si
yay

# oh-my-zsh + plugins
yay -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

yay -S zoxide eza bat ripgrep fd fzf jq fastfetch tldr stow feh brightnessctl xorg-xinit
yay -S neovim tmux fnm go
yay -S ghostty brave-bin firefox
yay -S docker docker-compose

fnm install --lts
fnm install --latest

xset r rate 200 40
brightnessctl set 100%

hash -r
