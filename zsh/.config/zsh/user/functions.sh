# Change current directory when exiting yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

MY_FOLDERS=(
  ~/Documents
  ~/Downloads
  ~/Desktop
  ~/dev
  ~/.dotfiles
  ~/.config
)

cdf() {
  local dir
  # Convert array to arguments for fd
  dir=$(fd --type d --hidden --follow --exclude ".git" . "${MY_FOLDERS[@]}" 2>/dev/null | \
    fzf --prompt="cd → " \
        --height=40% --border \
        --preview 'tree -C {} | head -200' \
        --preview-window=right:60% \
        --no-clear)

# If user selected something
  if [[ -n "$dir" ]]; then
    cd "$dir" || return
    # Force prompt refresh in three different ways (one of them will always work)
    zle reset-prompt          # works with oh-my-zsh, starship, pure, etc.
    zle && zle redisplay      # fallback redraw
  fi
}

# Create the widget and bind it to Ctrl+O
zle -N cdf                    # registers the function as a zsh widget
bindkey '^O' cdf              # ^O is Ctrl+O (uppercase O, not zero)
