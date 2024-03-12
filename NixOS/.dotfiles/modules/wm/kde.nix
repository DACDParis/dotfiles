{ config, pkgs, lib, ...}:
{

  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.libinput.enable = true;

# Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

}
