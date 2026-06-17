{
  config,
  pkgs,
  ...
}: {
  home.username = "pirosiki";
  home.homeDirectory = "/home/pirosiki";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    ./modules/dev.nix
    ./modules/git.nix
    ./modules/shell.nix
    ./modules/starship.nix
    ./modules/tmux.nix
  ];

  home.packages = [
    pkgs.bat
    pkgs.dust
    pkgs.ripgrep
    pkgs.fd
    pkgs.sd
    pkgs.tree-sitter
    pkgs.awscli2
    pkgs.aws-sam-cli
  ];

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
    sideloadInitLua = true;
    defaultEditor = true;
    extraPackages = [pkgs.nodejs];
  };
}
