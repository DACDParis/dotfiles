{ config, pkgs, ...}:

{

  hardware.opengl.extraPackages = [
    intel-compute-runtime
    intel-media-driver
  ];





}
