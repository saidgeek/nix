{ config, pkgs, ... }: {
  programs.starship = {
    enable = true;
  };

  programs.nushell = {
    enable = true;
    shellAliases = {
      l = "ls";
      ll = "exa --group-directories-first -h --git --icons -l -a";
      nv = "nvim";
      home-reload = "home-manager switch --flake ${config.home.homeDirectory}/.dotfiles#saidgeek@l0kii";
      nixos-reload = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/.dotfiles#l0kii";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
  };
}
