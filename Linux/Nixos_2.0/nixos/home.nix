{ config, pkgs, ... }:

{
  home.username = "david";
  home.homeDirectory = "/home/david";
  home.packages = with pkgs; [
    fastfetch
    fzf
    eza
    bat
    yazi
    zoxide
    duf
    ncdu
    btop

    mpv
    mpd
    ffmpeg-full

    discord
    element-desktop
  ];

  programs = {
    git = {
      settings = {
        enable = true;
        userName = "David Dias";
        userEmail = "dacdparis@gmail.com";
      };
    };
    sioyek = {
      enable = true;
      config = {
        "default_dark_mode" = "1";
        "startup_commands" = "fit_to_page_width_smart";
      };
    };
  };

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
