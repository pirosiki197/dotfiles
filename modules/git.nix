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
      alias = {
        st = "status";
        br = "branch";
        lograph = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
        ca = "commit --amend --no-edit";
        unstage = "reset HEAD --";
        undo = "reset --soft HEAD^";
        fix = "commit --fixup";
        squash = "rebase -i --autosquash";
      };
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
