{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    mouse = true;
    keyMode = "vi";
    escapeTime = 0;
    historyLimit = 10000;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      catppuccin
      yank
    ];
  };
}
