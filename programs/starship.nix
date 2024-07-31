{ config, pkgs, ... }: {
  programs.starship = {
    enable = true;
    settings = {
      directory = {
        style = "blue";
      };
      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };
      nix_shell = {
        symbol = "";
        impure_msg = " [](bold red)";
        pure_msg = "";
        unknown_msg = " [](bold green)";
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
