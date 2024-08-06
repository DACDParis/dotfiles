{ config, lib, pkgs, ... }:

{
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.gnome-settings-daemon.enable = true;

  environment.gnome.excludePackages = [];

 programs.seahorse.enable = true;

#  qt.platformTheme = "gnome";
#
#

  # ...
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = "palenight";
  # ...

}
