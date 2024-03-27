{ pkgs, lib, config, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/hardware/openrgb.nix
      ./modules/hardware/network.nix
      ./modules/hardware/keyboard.nix
      ./modules/hardware/sound.nix
      ./modules/hardware/vm.nix
      ./modules/wm/kde.nix
#      ./modules/editors/emacs.nix
      ./modules/cli/tmux.nix
#      ./modules/cli/shells.nix
    ];

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
 
  programs.hyprland.enable = true; 
  programs.xwayland.enable = true;
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.libinput.enable = true;

  xdg.portal.xdgOpenUsePortal = true; 

  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channel/nixos-unstable";
  };
  
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  programs.dconf.enable = true;

  # programs.direnv.enable = true;
  services.flatpak.enable = true;
  
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };
  };

  security.polkit.enable = true;

  security.pam.services.swaylock = { }; 
  
  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.david = {
    isNormalUser = true;
    description = "david";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "i2c" "libvirtd" "kvm"];
    packages = with pkgs; [
      spotify
      discord
      obsidian
      vivaldi
      electron
      clang
      vscode
      vscode-extensions.rust-lang.rust-analyzer
    ];
  };

 # nixpkgs.overlays = [
 #   (import (builtins.fetchTarball {
 #     url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
 #   }))
 # ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"

  ];

  # Allow installation of unfree corefonts package
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
    "corefonts"
    ];

  fonts.packages = with pkgs; [
    corefonts
  ];

  # services.opensnitch.enable = true;

  programs.steam = {
	  enable = true;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [
 
 # Add any missing dynamic libraries for unpackaged programs
 # here, NOT in environment.systemPackages
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    fd
    jq
    yazi
    ueberzugpp
    poppler
    gcc
    cmake
    git
    tmux
    google-chrome
    w3m
    clinfo
    python311Packages.pillow
    fuse
    fuse3
    gnumake
    libtool
    appimage-run
    liquidctl
    libsForQt5.mlt
    ffmpeg
    lsof
    cifs-utils
    kdePackages.sddm-kcm
    # kdePackages.qt6ct
    sshfs
    wayland-protocols
    neofetch
    hwinfo
    kitty
    bat
    libGLU
    mesa
    networkmanagerapplet
    home-manager
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
