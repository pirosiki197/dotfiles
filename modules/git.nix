{pkgs, ...}: {
  programs.git = {
    enable = true;
    includes = [{path = "~/.gitconfig.local";}];
    settings = {
      user = {
        name = "pirosiki197";
      };
      init.defaultBranch = "main";
      fetch.prune = true;
      pull.autostash = true;
      rebase.autostash = true;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.lazygit = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      gui = {
        nerdFontsVersion = "3";
        scrollHeight = 8;
      };
    };
  };
}
