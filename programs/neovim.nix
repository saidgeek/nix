{ config, ... }:

# let repo = builtins.fetchGit {
#   url = "git@github.com:saidgeek/nvim-v2.git";
#   ref = "main";
#   rev = "8ca4936be7d8947a5407df30d13bb6e2792612b2";
# };
# in
{
  # xdg.configFile."nvim/lua".source = config.lib.file.mkOutOfStoreSymlink "${repo}/lua";
  # xdg.configFile."nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink "${repo}/init.lua";

  programs.neovim = {
    enable = true;
  };
}
