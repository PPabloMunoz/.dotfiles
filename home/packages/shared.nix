# Shared packages available on ALL systems (Linux + macOS)
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Version Control
    git
    lazygit

    # File Operations
    ripgrep
    fd
    bat
    fzf
    zoxide
    eza
    jq
    just # Make replacement

    # Shell & Terminal
    tmux
    zsh-completions
    carapace

    # Downloads & Utilities
    curl
    wget
    unzip
    gzip
    xz
    zstd

    # Core Utilities
    coreutils
    findutils

    # Development
    go
    nodejs_24
    fnm
    pnpm
    bun

    # Extra
    htop
    fastfetch
    localsend
  ];
}
