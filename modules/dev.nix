{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gopls
    lua-language-server
    pyright
    yaml-language-server
  ];

  programs.go.enable = true;
  home.sessionPath = [
    "${config.home.homeDirectory}/go/bin"
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.mise = {
    enable = true;
    enableZshIntegration = true;
  };
}
