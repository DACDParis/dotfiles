{ pkgs, lib, callPackage, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/hardware/openrgb.nix
    ./modules/hardware/network.nix
    ./modules/hardware/keyboard.nix
    ./modules/hardware/sound.nix
    ./modules/hardware/vm.nix
    ./modules/cli/tmux.nix
    ./prometheus.nix
  ];

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  programs.hyprland = {
    enable = true;
    #   portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      xdgOpenUsePortal = true;
    };
    mime = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "sioyek.desktop";
        "application/epub" = "sioyek.desktop";
        "image/png" = [ "gimp.desktop" ];
      };
      addedAssociations = {

      };
    };
  };

  programs.xwayland.enable = true;
  services.xserver.enable = true;
  services.xserver.displayManager = {
    gdm.enable = true;
    #    autoLogin = {
    #      enable = true;
    #      user = "david";
    #    };
  };

  services.xserver.videoDrivers = [ "intel" ];
  services.libinput.enable = true;

  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channel/nixos-unstable";
  };

  programs.dconf.enable = true;
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

  time.timeZone = "Europe/Paris";
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

  users.users.david = {
    isNormalUser = true;
    description = "david";
    extraGroups =
      [ "networkmanager" "wheel" "video" "audio" "i2c" "libvirtd" "kvm" ];
    packages = with pkgs; [
      spotify
      discord
      # obsidian
      vivaldi
      # electron
      clang
    ];
  };

  services.emacs.enable = true;
  services.emacs.defaultEditor = true;

  # services.opensnitch.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.permittedInsecurePackages = [
  # "electron-25.9.0"
  # ];

  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
  #   }))
  # ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "corefonts" ];

  fonts.packages = with pkgs; [
    corefonts
    source-code-pro
    nerdfonts
    nanum-gothic-coding
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  environment.systemPackages = with pkgs; [
    meson
    python311Full
    jq
    poppler
    gcc-unwrapped
    python311Packages.pillow
    ninja
    cmake
    gnumake
    libtool

    git
    wget
    vim
    emacs29-pgtk
    curl
    fd
    yazi
    tmux
    kitty
    ueberzugpp
    bat
    clinfo
    liquidctl
    openrgb
    lsof
    hwinfo

    google-chrome
    w3m

    fuse
    fuse3
    ifuse
    apfs-fuse
    appimage-run
    #cifs-utils
    networkmanagerapplet
    libGLU

    ffmpeg
    mesa
    silver-searcher
    usbutils
    libstdcxx5
    glaxnimate
    gnome.adwaita-icon-theme

    wayland-protocols
    qt5ct
    libsForQt5.mlt
    libsForQt5.qt5ct
    libsForQt5.breeze-qt5
    libsForQt5.breeze-gtk
    dolphin
    libsForQt5.dolphin-plugins
    adwaita-qt

    nh
    nix-output-monitor
    nvd
    nil

    prometheus

  ];

  qt = {
    enable = true;
    #  style = "breeze";
    #  platformTheme = "qt5ct";
  };

  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = "\\xff\\xff\\xff\\xff\\x00\\x00\\x00\\x00\\xff\\xff\\xff";
    magicOrExtension = "\\x7fELF....AI\\x02";
  };

  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    #    # Not officially in the specification
    #    XDG_BIN_HOME = "$HOME/.local/bin";
    FLAKE = "$HOME/.dotfiles";
    PATH = [ ". $HOME/.cargo/env" ];
  };

  system.stateVersion = "24.05"; # Did you read the comment?

}
