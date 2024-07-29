{ config, ... }:

let repo = builtins.fetchGit {
  url = "git@github.com:saidgeek/nvim-v2.git";
  ref = "main";
  rev = "e96e4dbb50bcbc76dd1055e935ecac0b14fe998f";
};
in
{
  xdg.configFile."nvim/lua".source = config.lib.file.mkOutOfStoreSymlink "${repo}/lua";
  xdg.configFile."nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink "${repo}/init.lua";

  programs.neovim = {
    enable = true;
  };
}
