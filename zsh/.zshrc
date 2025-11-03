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

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# CUSTOM
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR="nvim"

alias reload="source ~/.zshrc"
alias ls="eza --color=always --icons --no-time --git"
alias ll="eza --color=always --icons --no-time --git --long"
alias la="eza --color=always --icons --no-time --git --long --all"
alias cat="bat -p"
alias cd="z"
alias lg="lazygit"
alias g="git"

#END CUSTOM
eval "$(zoxide init zsh)"

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/pablomunoz/.bun/_bun" ] && source "/Users/pablomunoz/.bun/_bun"

# fnm
eval "$(fnm env)"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/you-should-use/zsh-you-should-use.plugin.zsh

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Carapace completions
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'

eval "$(starship init zsh)"
