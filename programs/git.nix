{ ... }: {
  programs.git = {
    enable = true;
    userName = "saidgeek";
    userEmail = "me@saidgeek.land";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nvim";
    };
  };
}
