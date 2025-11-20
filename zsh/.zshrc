################################################################################
# ZSH configuration
################################################################################

ZSH_CFG="$XDG_CONFIG_HOME/zsh"

DISABLE_AUTO_TITLE="true" # Disable auto-setting terminal title.
COMPLETION_WAITING_DOTS="true" # Display red dots whilst waiting for completion.
DISABLE_UNTRACKED_FILES_DIRTY="true" # Disable marking untracked files
INC_APPEND_HISTORY="true"
HISTFILE=$HOME/.zsh_history # Persist history
HISTSIZE=1000000
SAVEHIST=1000000
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

setopt appendhistory
setopt HIST_IGNORE_ALL_DUPS # Ensure no duplicates are recorded in the history
setopt autocd extendedglob nomatch menucomplete interactive_comments
unsetopt correct_all BEEP # Unset defaults

autoload -Uz colors && colors # Colors

bindkey -e # Fix to disable vim mode inside tmux

source "$ZSH_CFG/user/functions.sh"

################################################################################
# Command Completions
################################################################################

autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'

_comp_options+=(globdots) # Include hidden files
compinit

source "$ZSH_CFG/user/completions.sh"

################################################################################
# Plugins and packages
################################################################################

source "$ZSH_CFG/user/packages.sh"

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-history-substring-search"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "michaelAquilina/zsh-you-should-use"
zsh_add_plugin "hlissner/zsh-autopair"

zsh_add_config "config/exports.sh"
zsh_add_config "config/aliases.sh"
zsh_add_config "config/fzf.sh"

source <(carapace _carapace)

################################################################################
# Extras
################################################################################

eval "$(starship init zsh)"
