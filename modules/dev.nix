{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    lua-language-server
  ];

  programs.go.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/go/bin"
  ];
}
