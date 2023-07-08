{ config, pkgs, ... }: {
  programs.starship = {
    enable = true;
  };

  ## NOTE: It is possible to move this config to its own Nix file afterward
  programs.nushell = {
    enable = true;
    shellAliases = {
      l = "ls";
      ll = "exa --group-directories-first -h --git --icons -l -a";
      nv = "nvim";
      home-reload = "home-manager switch --flake ${config.home.homeDirectory}/.dotfiles#saidgeek@l0kii";
      nixos-reload = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/.dotfiles#l0kii";
    };
    extraConfig = ''
      let-env config = {
        show_banner: false,
      }

      def gl [] {
        git log --pretty=%h»¦«%aN»¦«%s»¦«%aD | lines | split column "»¦«" sha1 committer desc merged_at | first 10
      }
    '';
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
  };
}
