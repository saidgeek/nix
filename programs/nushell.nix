{ config, pkgs, ... }: {
  programs.nushell = {
    enable = true;
    shellAliases = {
      l = "ls";
      ll = "exa --group-directories-first -h --git --icons -l -a";
      nv = "nvim";
      home-reload = "home-manager switch --flake ${config.home.homeDirectory}/.dotfiles#saidgeek@l0kii";
      nixos-reload = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/.dotfiles#l0kii";
    };
    environmentVariables = {
      DIRENV_LOG_FORMAT = "\"\"";
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
}
