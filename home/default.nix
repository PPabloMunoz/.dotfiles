{ config, pkgs, ... }:
{
  imports = [
    ./shell/default.nix
    ./starship/default.nix
    ./nvim/default.nix
    ./lazygit/default.nix
    ./packages/shared.nix
  ];

  home.username = "pablomunoz";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  programs.fzf.enable = true;
  programs.go.enable = true;
  programs.zoxide.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    FZF_DEFAULT_COMMAND = "fd --type f --strip-cwd-prefix --hidden --follow";
  };
}
