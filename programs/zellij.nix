{ pkgs, ... }: {
  programs.zellij = {
    enable = true;
    package = pkgs.zellij;
    settings = {
      # default_layout = "compact";
      mouse_mode = false;
      copy_on_select = false;
      copy_command = "wl-copy";
      styled_underlines = false;
      theme = "catppuccin-mocha";
      themes."catppuccin-mocha" = {
        bg = "#585b70";
        fg = "#cdd6f4";
        red = "#f38ba8";
        green = "#a6e3a1";
        blue = "#89b4fa";
        yellow = "#f9e2af";
        magenta = "#f5c2e7";
        orange = "#fab387";
        cyan = "#89dceb";
        black = "#181825";
        white = "#cdd6f4";
      };
    };
  };
}
