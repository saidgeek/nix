{ pkgs, ... }: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        font = wezterm.font("VictorMono Nerd Font", { weight = "Bold" }),
        font_size = 9.0,
        hide_tab_bar_if_only_one_tab = true,
        tab_bar_at_bottom = true,
        window_padding = {
          left = 5,
          right = 5,
          top = 5,
          bottom = 5,
        },

        window_frame = {
          border_left_width = "0.2cell",
          border_right_width = "0.2cell",
          border_bottom_height = "0.1cell",
          border_top_height = "0.1cell",
          border_left_color = "#cdcdcd",
          border_right_color = "#cdcdcd",
          border_bottom_color = "#cdcdcd",
          border_top_color = "#cdcdcd",
        },

        initial_cols = 160,
        initial_rows = 40,
        window_decorations = "INTEGRATED_BUTTONS|RESIZE",
        enable_wayland = false,

        color_scheme = "GitHub Dark",
        colors = {
          background = "#22272e",
        },

        warn_about_missing_glyphs = true,
      }
    '';
  };
}
