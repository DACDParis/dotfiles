{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./modules/hardware/boot.nix
      ./hardware-configuration.nix
      ./modules/hardware/network.nix
      ./modules/hardware/keyboard.nix
      ./modules/hardware/vm.nix
      ./modules/wm/kde.nix
#      ./modules/editors/emacs.nix
#      ./modules/cli/tmux.nix
#      ./modules/cli/ranger.nix
      ./modules/wm/hyprland.nix
      ./modules/cli/shells.nix

    ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.david = {
    isNormalUser = true;
    description = "david";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "david";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    tmux
    ranger
    w3m
   ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
  
  


}
