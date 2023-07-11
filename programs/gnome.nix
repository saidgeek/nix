{ pkgs, ... }: {

  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.pop-shell
    gnomeExtensions.vitals
    palenight-theme
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    # theme = {
    #   name = "palenight";
    #   package = pkgs.palenight-theme;
    # };
    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  # home.sessionVariables.GTK_THEME = "palenight";

  ## reference: https://hoverbear.org/blog/declarative-gnome-configuration-in-nixos/
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "code.desktop"
        "wezterm.desktop"
        "spotify.desktop"
      ];
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "Vitals@CoreCoding.com"
      ];
    };

  };
}
