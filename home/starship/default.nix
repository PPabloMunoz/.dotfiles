{ pkgs, ... }:
let
  starshipConfig = builtins.readFile ./starship.toml;
in {
  programs.starship.enable = true;

  xdg.configFile."starship.toml".text = starshipConfig;
}
