{ config, pkgs, hostname, ... }:
let
  zshrcFile = if hostname == "mac" then
    ./.zshrc.mac
  else
    ./.zshrc.linux;
in
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    completionInit = "autoload -U compinit; compinit";

    history = {
      size = 1000000;
      save = 1000000;
      path = "$HOME/.zsh_history";
      ignoreAllDups = true;
      share = true;
    };

    initContent = builtins.readFile zshrcFile;
  };
}
