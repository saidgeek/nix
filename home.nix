{ pkgs, config, lib, ... }: {

  imports = [
    ./programs/shell.nix
    ./programs/git.nix
    ./programs/direnv.nix
    ./programs/emacs.nix
    ./programs/tmux
    ./programs/vscode
    ./programs/wezterm.nix
  ];

  home.username = "saidgeek";
  home.homeDirectory = "/home/saidgeek";
  home.stateVersion = "22.11";

  # TODO: move this to other file to be common
  home.packages = with pkgs; [
    git
    spotify
    vlc
    obsidian
    gotop
    flameshot
    discord
    fzf
    ripgrep
    unzip
    exa
    gcc
    jq
    neovim
    emacsPackages.vterm
    firefox

    # gnome
    gnomeExtensions.pop-shell

    # languages 
    ## javascript / typescript
    nodejs
    nodePackages.npm
    nodePackages.typescript-language-server

    ## python
    # python3
    # python310Packages.pip

    ## nix
    rnix-lsp
    nixpkgs-fmt

    ## Lua
    luajit
    lua-language-server
    stylua
  ];

  ## reference: https://hoverbear.org/blog/declarative-gnome-configuration-in-nixos/
  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
  };
  # programs.home-manager.enable = true;
}
