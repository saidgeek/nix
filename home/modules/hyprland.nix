{ pkgs, wayland, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = false;
    };
    nvidiaPatches = true;
    extraConfig = builtins.readFile ../../config/hyprland.conf;
  };
}
