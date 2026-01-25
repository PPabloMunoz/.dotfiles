{ pkgs, config, ... }:
let
  nvimConfigPath = config.home.homeDirectory + "/.config/nvim";
in {
  programs.neovim.enable = true;

  xdg.configFile."nvim".source = ./nvim;
}
