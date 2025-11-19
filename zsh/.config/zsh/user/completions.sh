eval_if_exists() {
    local cmd="$1"
    local eval_str="$2"

    if command -v "$cmd" >/dev/null 2>&1; then
        eval "$eval_str"
    fi
}

eval_if_exists "zoxide" "$(zoxide init zsh)"
eval_if_exists "fnm" "$(fnm env)"
eval_if_exists "ngrok" "$(ngrok completion)"
