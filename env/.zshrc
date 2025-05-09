# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="steeef"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting golang)
source $ZSH/oh-my-zsh.sh

# CUSTOM
export XDG_CONFIG_HOME=$HOME/.config
VIM="nvim"

alias reload="source ~/.zshrc"
alias ls="eza --color=always --icons --no-time --git"
alias ll="eza --color=always --icons --no-time --git --long"
alias la="eza --color=always --icons --no-time --git --long --all"
alias cat="bat -p"
alias cd="z"
alias man="tldr"
alias ta="tmux a"
alias vim="nvim"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

#END CUSTOM
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

[ -s "/Users/pablomunoz/.bun/_bun" ] && source "/Users/pablomunoz/.bun/_bun"
