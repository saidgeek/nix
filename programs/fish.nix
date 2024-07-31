{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    shellAliases = {
      # nvim
      nv = "nvim";
      # zoxide
      # cd = "z";
      # exa
      l = "eza -G --icons -a -s=type --colour=always -H -I '.git|node_modules'";
      lt = "l -T -L 1";
      lt2 = "l -T -L 2";
      lt3 = "l -T -L 3";
      lt4 = "l -T -L 4";
      # git
      ga = "git add";
      gaa = "git add .";
      g = "git status";
      gl = "git log --oneline";
      gc = "git commit";
      gcm = "git commit -m";
      gca = "git commit --amend";
      gcav = "git commit --amend --no-verify";
      gr = "git rebase";
      gri = "git rebase -i";
      gs = "git switch";
      gsc = "git switch";
    };
    shellInit = ''
      set -g fish_greeting
    '';
  };
}
