{ pkgs, ... }: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        color_scheme = 'Palenight (Gogh)',
        font = wezterm.font("NotoMono Nerd Font", { weight = 'Bold' }),
        font_size = 10.0,
        window_padding = {
          left = 2,
          right = 2,
          top = 0,
          bottom = 0,
        },
        window_frame = {
          border_left_width = '0.25cell',
          border_right_width = '0.25cell',
          border_bottom_height = '0.15cell',
          border_top_height = '0cell',
          border_left_color = '#232323',
          border_right_color = '#232323',
          border_bottom_color = '#232323',
          border_top_color = '#232323'
        },
        use_fancy_tab_bar = false,
        hide_tab_bar_if_only_one_tab = true,
        tab_bar_at_bottom = true,
      }
    '';
  };
}
