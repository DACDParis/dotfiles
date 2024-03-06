{ config, pkgs, lib, home-manager, ...}:

{

  home.packages = with pkgs; [
    kitty-img
    pixcat
  ];



}

