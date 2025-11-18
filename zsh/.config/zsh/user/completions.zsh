eval "$(zoxide init zsh)"
eval "$(fnm env)"

if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi
