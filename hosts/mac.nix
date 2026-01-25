# Mac Mini M4 configuration
# Apple Silicon Mac Mini

{
  imports = [
    ./template.nix
    ../home/packages/darwin.nix
    ../home/aerospace/default.nix
    ../home/ghostty/default.nix
    ../home/tmux/default.nix
  ];

  home.homeDirectory = "/Users/pablomunoz";
}
