{ pkgs, ... }: 
let
  config = builtins.readFile ../config/tmux.conf;
in {
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      catppuccin
    ];
    extraConfig = config;
  };
}
