################################################################################
# Aliases
################################################################################

# General
alias ls="eza -s type"
alias ll="eza --color=always --icons --no-time --git --long"
alias la="eza --color=always --icons --no-time --git --long --all"
alias lazygit="lazygit -ucd ~/.config/lazygit/"
alias grep="grep --color=auto"
alias cat="bat --paging=never --wrap=never --style=plain"
# alias cat="bat -p"
alias editdots="cd ~/Personal/Repos/dotfiles; nvim"
alias cd="z"

# Vim
alias vimdiff='nvim -d'
alias vim="nvim"

# ZSH
alias zsh:reload="source $HOME/.zshrc"
alias zsh:edit="nvim $HOME/.zshrc"
alias zsh:alias="cat ~/.config/zsh/config/aliases.sh"
alias zsh:alias:edit="nvim ~/.config/zsh/config/aliases.sh"

# Tmux
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

# Git
alias lg="lazygit"
alias g="git"
alias gl="git pull"
