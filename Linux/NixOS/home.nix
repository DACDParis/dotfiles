{ config, pkgs, ... }:

{
  home.username = "david";
  home.homeDirectory = "/home/david";

  # Packages to install for the user
  home.packages = with pkgs; [
    fastfetch
  ];

  # Basic git config
  programs.git = {
    enable = true;
    userName = "David Dias";
    userEmail = "dacdparis@gmail.com";
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
