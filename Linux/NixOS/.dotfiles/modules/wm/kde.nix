{ config, pkgs, lib, ...}:
{

  services.desktopManager.plasma6.enable = true;

    #kdePackages.breeze
    #kdePackages.breeze.gtk
    #kdePackages.qt6ct

}
