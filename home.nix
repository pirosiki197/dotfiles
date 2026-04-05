{
  config,
  pkgs,
  ...
}: let
  nvimConfigPath = "${config.home.homeDirectory}/.config/home-manager/nvim";
in {
  home.username = "pirosiki";
  home.homeDirectory = "/home/pirosiki";

  home.stateVersion = "25.11";

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
    pkgs.tree-sitter
  ];

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimConfigPath;
}
