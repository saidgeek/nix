{ pkgs, config, lib, ... }: {

  imports = [
    # ./home/modules/hyprland.nix
  ];

  home.username = "saidgeek";
  home.homeDirectory = "/home/saidgeek";
  home.stateVersion = "22.11";
  # TODO: move this to other file to be common
  home.packages = with pkgs; [
    git
    wezterm
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

    ## rust
    rustup

    ## python
    # python3
    # python310Packages.pip

    ## nix
    rnix-lsp

    ## Lua
    luajit
    lua-language-server
    stylua
  ];

  home.shellAliases = {
    nv = "nvim";
    l = "exa --group-directories-first -h --git --icons -l -a";
  };

  # programs.home-manager.enable = true;

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    enableUpdateCheck= true;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons  
      bbenoist.nix
    ];
    userSettings = {
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "workbench.iconTheme" ="catppuccin-macchiato";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  programs.git = {
    enable = true;
    userName = "saidgeek";
    userEmail = "me@saidgeek.land";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nvim";
    };
  };

  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.catppuccin
    ];
    extraConfig = builtins.readFile ./config/tmux.conf;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
}
