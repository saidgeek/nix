{pkgs, config, lib, ...}: {

  home.username = "saidgeek";
  home.homeDirectory = "/home/saidgeek";
  home.stateVersion = "22.11";
  home.packages = with pkgs; [
    git
    wezterm
    spotify
    google-chrome
    obsidian
    gotop 
    flameshot
    discord
    nodejs
    nodePackages.npm
    fzf
    ripgrep
    unzip
    rustup
    exa
    gcc
    jq
    neovim

    # hyprland
    waybar
    wofi
  ];

  home.shellAliases = {
    nv = "nvim";
  };

  programs.home-manager.enable = true;

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
    baseIndex = 1;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.catppuccin
    ];
  };
}