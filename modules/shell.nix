{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    defaultKeymap = "emacs";

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      save = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
      share = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
    };

    initContent = ''
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

      path=(
          $HOME/.local/bin
          $path
      )
      typeset -U path
    '';
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
