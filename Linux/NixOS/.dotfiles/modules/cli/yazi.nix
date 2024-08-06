{ config, lib, pkgs, home-manager, ... }:

{
  programs.yazi = {
    enable = true;
    package =
      yazi.packages.${pkgs.system}.default; # if you use overlays, you can omit this
  };
}
