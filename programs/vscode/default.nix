{ config, pkgs, ... }:
let
  exts = with pkgs.vscode-extensions; [
    catppuccin.catppuccin-vsc
    catppuccin.catppuccin-vsc-icons
    bbenoist.nix
    jnoortheen.nix-ide
    eamodio.gitlens
    rust-lang.rust-analyzer
    dbaeumer.vscode-eslint
    bradlc.vscode-tailwindcss
    svelte.svelte-vscode
    esbenp.prettier-vscode
    mikestead.dotenv
    astro-build.astro-vscode
    bungcip.better-toml
    ms-python.python
    vscodevim.vim
  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      publisher = "wayou";
      name = "vscode-todo-highlight";
      version = "1.0.5";
      sha256 = "1sg4zbr1jgj9adsj3rik5flcn6cbr4k2pzxi446rfzbzvcqns189";
    }
    {
      publisher = "csstools";
      name = "postcss";
      version = "1.0.9";
      sha256 = "sha256-5pGDKme46uT1/35WkTGL3n8ecc7wUBkHVId9VpT7c2U=";
    }
    {
      publisher = "rubymaniac";
      name = "vscode-direnv";
      version = "0.0.2";
      sha256 = "sha256-TVvjKdKXeExpnyUh+fDPl+eSdlQzh7lt8xSfw1YgtL4=";
    }
    {
      publisher = "whizkydee";
      name = "material-palenight-theme";
      version = "2.0.3";
      sha256 = "sha256-qz2pz9JlnO2OV3eJnRqzbcic1lzpl0ViygwhNjZOWpI=";
    }
    {
      publisher = "whizkydee";
      name = "material-palenight-theme";
      version = "2.0.3";
      sha256 = "sha256-qz2pz9JlnO2OV3eJnRqzbcic1lzpl0ViygwhNjZOWpI=";
    }
    {
      publisher = "hideoo";
      name = "create";
      version = "0.2.0";
      sha256 = "sha256-wIqh3rCKj0QfqFmev+hAePnIB2Pp74G3SYIOpPifG5I=";
    }
  ];
in
{
  xdg.configFile."Code/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/programs/vscode/settings.json";
  xdg.configFile."Code/User/keybindings.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/programs/vscode/keybindings.json";

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    enableUpdateCheck = true;
    mutableExtensionsDir = true;
    extensions = exts;
  };
}
