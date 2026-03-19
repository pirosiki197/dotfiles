{
  config,
  pkgs,
  ...
}: {
  home.username = "pirosiki";
  home.homeDirectory = "/home/pirosiki";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  imports = [
    ./modules/dev.nix
    ./modules/git.nix
    ./modules/shell.nix
    ./modules/starship.nix
  ];

  home.packages = [
    pkgs.curl
    pkgs.htop
    pkgs.bat
    pkgs.dust
    pkgs.ripgrep
    pkgs.fd
  ];

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
