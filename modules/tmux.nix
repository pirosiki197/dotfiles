{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    mouse = true;
    keyMode = "vi";
    escapeTime = 0;
    historyLimit = 10000;
    terminal = "tmux-256color";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      catppuccin
      yank
    ];
    extraConfig = ''
      set -ag terminal-overrides ",xterm-256color:RGB"
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'
    '';
  };
}
