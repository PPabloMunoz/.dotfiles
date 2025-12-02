# My ZSH configuration

# ====== General ======

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

# ====== Exports ======

export PATH=/usr/local/bin:$PATH # Recommended by brew doctor
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export PATH="$HOME/.bun/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH=/opt/homebrew/sbin:$PATH # Recommended by brew doctor
export PATH=/opt/homebrew/bin:$PATH  # Brew is first as everything else uses that
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

export CARAPACE_BRIDGES='zsh'

export NODE_ENV=development
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export XDG_CONFIG_HOME=$HOME/.config
export EDITOR="nvim"

# ====== Aux Functions ======

eval_if_exists() {
    local cmd="$1"
    local eval_str="$2"

    if command -v "$cmd" >/dev/null 2>&1; then
        eval "$eval_str"
    fi
}

function zsh_add_config() {
  [ -f "$XDG_CONFIG_HOME/zsh/$1" ] && source "$XDG_CONFIG_HOME/zsh/$1"
}

function zsh_add_plugin() {
  PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)

  if [ -d "$XDG_CONFIG_HOME/zsh/plugins/$PLUGIN_NAME" ]; then
    zsh_add_config "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || zsh_add_config "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
  else
    git clone "https://github.com/$1.git" "$XDG_CONFIG_HOME/zsh/plugins/$PLUGIN_NAME"
  fi
}

# ====== Completions ======

autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'

_comp_options+=(globdots) # Include hidden files
compinit

eval_if_exists "zoxide" "$(zoxide init zsh)"
eval_if_exists "fnm" "$(fnm env)"
eval_if_exists "ngrok" "$(ngrok completion)"
eval_if_exists "fzf" "$(fzf --zsh)"

[ -s "/Users/pablomunoz/.bun/_bun" ] && source "/Users/pablomunoz/.bun/_bun"

# ====== Plugins ======

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-history-substring-search"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "michaelAquilina/zsh-you-should-use"
zsh_add_plugin "hlissner/zsh-autopair"


# ====== Alias ======

alias ls="eza -s type"
alias ll="eza --color=always --icons --no-time --git --long"
alias la="eza --color=always --icons --no-time --git --long --all"
alias lazygit="lazygit -ucd ~/.config/lazygit/"
alias grep="grep --color=auto"
alias cat="bat --paging=never --wrap=never --style=plain"
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
alias ta="t a"
alias tls="t ls"
alias tn="t new -t"

# Git
alias lg="lazygit"
alias g="git"
alias gl="git pull"
alias gp="git push"

source <(carapace _carapace)

# ====== FZF ======

# Set default config file
export FZF_DEFAULT_OPTS_FILE=~/.fzfrc

# History
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'CTRL-Y to copy into clipboard'
  --height=100%
  --preview-window=:hidden"

# Files / Directories
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target,.DS_Store
  --preview 'fzf-preview.sh {}'
  --height=100%"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow'

# ====== Final ======

eval "$(starship init zsh)"


# ====== Drizzle Gateway ======
# --------------------------------------------------
# drizzle – control your background executable
# Usage: drizzle start | stop | status | restart | logs
# --------------------------------------------------

drizzle() {
  local exe="/usr/local/bin/drizzle-gateway"
  local name="drizzle-gateway"
  local pidfile="$HOME/.cache/${name}.pid"
  local logfile="$HOME/.cache/${name}.log"

  mkdir -p "$HOME/.cache"

  case "$1" in
    start)
      if [[ -f "$pidfile" ]] && kill -0 $(cat "$pidfile") 2>/dev/null; then
        echo "$name is already running (PID $(cat "$pidfile"))"
        return 0
      fi

      # Use argument if given, otherwise environment, otherwise default
      local store_path="${2:-${STORE_PATH:-$HOME/.local/share/drizzle}}"
      mkdir -p "$store_path"

      echo "Starting $name (STORE_PATH=$store_path)..."

      STORE_PATH="$store_path" nohup "$exe" > "$logfile" 2>&1 &
      # or: nohup env STORE_PATH="$store_path" "$exe" > "$logfile" 2>&1 &

      echo $! > "$pidfile"
      echo "$name started (PID $!)"
      ;;

    stop)
      if [[ ! -f "$pidfile" ]]; then
        echo "$name is not running (no PID file)"
        return 1
      fi
      local pid=$(cat "$pidfile")
      if kill -0 "$pid" 2>/dev/null; then
        echo "Stopping $name (PID $pid)..."
        kill "$pid"
        # Wait a moment and force kill if needed
        sleep 2
        if kill -0 "$pid" 2>/dev/null; then
          kill -9 "$pid" 2>/dev/null
        fi
      else
        echo "PID $pid not running, cleaning up"
      fi
      rm -f "$pidfile"
      ;;

    status)
      if [[ -f "$pidfile" ]] && kill -0 $(cat "$pidfile") 2>/dev/null; then
        local pid=$(cat "$pidfile")
        echo "$name is running (PID $pid)"
        ps -p "$pid" -o pid,ppid,user,%cpu,%mem,time,cmd | tail -n1
      else
        echo "$name is not running"
        [[ -f "$pidfile" ]] && rm -f "$pidfile"
      fi
      ;;

    restart)
      "$0" stop 2>/dev/null
      "$0" start
      ;;

    logs)
      tail -f "$logfile"
      ;;

    *)
      echo "Usage: drizzle start [STORE_PATH]|stop|status|restart|logs"
      echo "       If STORE_PATH is omitted, defaults to \$STORE_PATH or $HOME/.local/share/drizzle"
      ;;
  esac
}

_drizzle_gateway_completions() {
  local -a subcommands
  subcommands=(
    'start [STORAGE_PATH]:Start the program'
    'stop:Stop the program'
    'status:Show current status'
    'restart:Restart the program'
    'logs:Follow the log file (tail -f)'
  )
  _describe 'drizzle commands' subcommands
}
compdef _drizzle_gateway_completions drizzle
