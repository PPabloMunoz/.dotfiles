export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

bindkey -e

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

eval "$(zoxide init zsh)"

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/pablomunoz/.bun/_bun" ] && source "/Users/pablomunoz/.bun/_bun"

# fnm
eval "$(fnm env)"

if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

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
