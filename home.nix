{ pkgs, config, lib, ... }: {

  imports = [
    ./programs/git.nix
    ./programs/starship.nix
    ./programs/nushell.nix
    ./programs/zsh.nix
    ./programs/direnv.nix
    ./programs/emacs.nix
    ./programs/tmux
    ./programs/wezterm.nix
    ./programs/gnome.nix
  ];

  home.username = "saidgeek";
  home.homeDirectory = "/home/saidgeek";
  home.stateVersion = "24.05";

  # TODO: move this to other file to be common
  home.packages = with pkgs; [
    spotify
    vlc
    obsidian
    gotop
    flameshot
    discord
    fzf
    ripgrep
    fd
    unzip
    exa
    gcc
    jq
    neovim
    emacsPackages.vterm
    firefox
    fastfetch

    # languages 
    ## javascript / typescript
    nodejs
    nodePackages.npm
    nodePackages.typescript-language-server

    ## python
    python3
    python310Packages.pip

    ## nix
    rnix-lsp
    nixpkgs-fmt

    ## Lua
    luajit
    lua-language-server
    stylua
  ];

  # programs.home-manager.enable = true;
}
