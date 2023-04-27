{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "braden";
  home.homeDirectory = "/home/braden";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  targets.genericLinux.enable = true;

  # Allow unfree packages. As of May 2023, there is 
  # a bug with the standard 'nixpkgs.config.allowUnfree = true' 
  # with stand alone home-manager, the following line works.
  # Ref: https://discourse.nixos.org/t/home-manager-standalone-module-or-flake/23920/3
  nixpkgs.config.allowUnfreePredicate = pkg: true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Development tools
    git
    neovim
    lazygit

    # Terminal
    ripgrep
    bat
    fd
    lsd

    # Networking & downloads
    wget
    curl

    # Disk usage & system monitoring
    htop
    ncdu

    # Desktop applications
    slack
    obsidian
  ];

  # Manually managed configuration files, home-manager will
  # place these files/directories in ~/.config/ 
  xdg.configFile.nvim = {
    source = ./app-configs/nvim;
    recursive = true;
  };

  xdg.configFile.terminator = {
   source = ./app-configs/terminator;
   recursive = true;
  };
}
