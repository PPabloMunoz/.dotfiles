# macOS-only packages
# These packages are only installed on macOS systems
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    opencode
  ];
}
