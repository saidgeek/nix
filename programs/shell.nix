{ pkgs, ... }: {
  programs.starship = {
    enable = true;
  };

  programs.nushell = {
    enable = true;
    shellAliases = {
      l = "ls";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
  };
}
