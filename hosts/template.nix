# Template for adding new hosts
# Copy this file and customize for your new machine
#
# Usage:
#   1. Copy this file: cp hosts/template.nix hosts/new-hostname.nix
#   2. Edit new-hostname.nix and update:
#      - Set home.homeDirectory to the full path (e.g., "/home/username")
#   3. Add the new hostname to flake.nix in the configs let binding
#   4. Run: nix run home-manager/master -- switch --flake .#new-hostname
#
# Note: The hostname is defined in flake.nix and determines which .zshrc to use.
# Available .zshrc files:
#   - .zshrc.linux (default)
#   - .zshrc.mac
#
# Optional customizations:
#   - Add host-specific imports (e.g., ../home/packages/darwin.nix)
#   - Add host-specific packages to home.packages
#   - Configure host-specific programs

{
  imports = [
    ../home/default.nix
  ];

  home = {
    username = "pablomunoz";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
