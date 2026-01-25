# Linux SSH host configuration (headless)
# This is a generic Linux configuration for headless machines accessed via SSH

{
  imports = [
    ./template.nix
    ../home/packages/linux.nix
    ../home/tmux/default.nix
  ];

  home.homeDirectory = "/home/pablomunoz";
}
