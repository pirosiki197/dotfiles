{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    defaultKeymap = "emacs";

    autosuggestion.enable = false;
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
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      ZSH_AUTOSUGGEST_STRATEGY=(history)

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
      zstyle ':completion:*' menu no

      zstyle ':fzf-tab:*' fzf-flags --height=60% --layout=reverse --border
      zstyle ':fzf-tab:*' switch-group '<' '>'

      zstyle ':fzf-tab:complete:cd:*' fzf-preview \
      '${pkgs.eza}/bin/eza -1 --color=always $realpath'
      zstyle ':fzf-tab:complete:*:*' fzf-preview \
      '[[ -d $realpath ]] && ${pkgs.eza}/bin/eza -1 --color=always $realpath || ${pkgs.bat}/bin/bat --color=always $realpath 2>/dev/null || cat $realpath'
      zstyle ':fzf-tab:complete:(-command-|-parameter-|export|unset):*' fzf-preview \
      'echo ''${(P)word}'

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
