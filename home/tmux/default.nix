{ ... }:
{
  xdg.configFile."tmux/tmux.conf".source = ./tmux.conf;
  xdg.configFile."tmux/config/options.conf".source = ./config/options.conf;
  xdg.configFile."tmux/config/keybindings.conf".source = ./config/keybindings.conf;
  xdg.configFile."tmux/config/theme.conf".source = ./config/theme.conf;
}
