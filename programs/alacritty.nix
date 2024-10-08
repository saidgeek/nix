{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
      window = {
        opacity = 0.9;
        blur = true;
        decorations_theme_variant = "Dark";
      };
      font = {
        normal = {
          family = "VictorMono Nerd Font";
          style = "Bold";
        };
        size = 10;
      };
      colors = {
        primary = {
          background = "0x0d1117";
          foreground = "0xc9d1d9";
        };
        cursor = {
          text = "0x0d1117";
          cursor = "0xc9d1d9";
        };
        normal = {
          black = "0x484f58";
          red = "0xec8e2c";
          green = "0x58a6ff";
          yellow = "0xd29922";
          blue = "0x58a6ff";
          magenta = "0xbc8cff";
          cyan = "0x39c5cf";
          white = "0xb1bac4";
        };
        bright = {
          black = "0x6e7681";
          red = "0xfdac54";
          green = "0x79c0ff";
          yellow = "0xe3b341";
          blue = "0x79c0ff";
          magenta = "0xbc8cff";
          cyan = "0x39c5cf";
          white = "0xb1bac4";
        };
      };
    };
  };
}
