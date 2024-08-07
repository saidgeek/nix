{ pkgs, ... }: {

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
    ./programs/neovim.nix
    ./programs/zellij.nix
    ./programs/fish.nix
    ./programs/zoxide.nix
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
    gcolor3
    discord
    fzf
    ripgrep
    fd
    unzip
    eza
    gcc
    jq
    wl-clipboard
    emacsPackages.vterm
    firefox
    google-chrome
    slack

    # languages 
    ## javascript / typescript
    nodejs
    nodePackages.npm
    nodePackages.typescript-language-server

    ## python
    python3
    python310Packages.pip

    ## nix
    nil
    nixpkgs-fmt

    ## Lua
    luajit
    lua-language-server
    stylua

    ## Rust
    rustup
  ];

  # programs.home-manager.enable = true;
}
