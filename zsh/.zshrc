# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Path to your Oh My Zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="powerlevel10k/powerlevel10k"
# plugins=(git tmux golang zsh-autosuggestions zsh-syntax-highlighting you-should-use)
# source $ZSH/oh-my-zsh.sh

# CUSTOM
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR="nvim"

alias reload="source ~/.zshrc"
alias ls="eza --color=always --icons --no-time --git"
alias ll="eza --color=always --icons --no-time --git --long"
alias la="eza --color=always --icons --no-time --git --long --all"
alias cat="bat -p"
alias cd="z"
alias man="tldr"

#END CUSTOM
eval "$(zoxide init zsh)"

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/pablomunoz/.bun/_bun" ] && source "/Users/pablomunoz/.bun/_bun"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/you-should-use/zsh-you-should-use.plugin.zsh

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Enable completion system
autoload -Uz compinit
compinit

# Show all completions on first Tab press
zstyle ':completion:*' menu select
zstyle ':completion:*' list-prompt ''
zstyle ':completion:*' select-prompt ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

eval "$(starship init zsh)"

