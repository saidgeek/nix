{ config, pkgs, ... }: {
  programs.starship = {
    enable = true;
    settings = {
      character = {
        success_symbol = "[](bold green)";
        error_symbol = "[ ](bold red)";
      };
      nix_shell = {
        symbol = "❄️";
        impure_msg = "[!](bold red)";
        pure_msg = "";
        unknown_msg = "[?](bold green)";
        format = "[$symbol$state](bold blue) ";
      };
      custom.direnv = {
        symbol = "󱁿";
        format = "[$symbol]($style) ";
        style = "fg:blue dimmed";
        when = "env | grep -E '^DIRENV_FILE='";
      };
    };
  };
}
