{ config, pkgs, ...}:
{


  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Configure console keymap
  console.keyMap = "us";


}
