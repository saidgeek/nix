{ pkgs, config, lib, ... }: {

  imports = [
    ./programs/starship.nix
    ./programs/nushell.nix
    ./programs/zsh.nix
    ./programs/git.nix
    ./programs/direnv.nix
    ./programs/emacs.nix
    ./programs/tmux
    ./programs/vscode
    ./programs/wezterm.nix
    ./programs/gnome.nix
  ];

  home.username = "saidgeek";
  home.homeDirectory = "/home/saidgeek";
  home.stateVersion = "22.11";

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
    unzip
    exa
    gcc
    jq
    neovim
    emacsPackages.vterm
    firefox

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

  # programs.home-manager.enable = true;
}
