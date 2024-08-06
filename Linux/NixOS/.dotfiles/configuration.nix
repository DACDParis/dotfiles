{ pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/hardware/openrgb.nix
    ./modules/hardware/network.nix
    ./modules/hardware/keyboard.nix
    ./modules/hardware/sound.nix
    ./modules/hardware/vm.nix
    ./modules/cli/tmux.nix
    ./nvidia.nix
    #./modules/wm/kde.nix
    # ./prometheus.nix
    #./gnome.nix

  ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = "\\xff\\xff\\xff\\xff\\x00\\x00\\x00\\x00\\xff\\xff\\xff";
      magicOrExtension = "\\x7fELF....AI\\x02";
    };
  };

  programs = {
    hyprland = {
      enable = true;
      #   portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

    xwayland.enable = true;

    zsh.enable = true;

    dconf.enable = true;

    nix-ld.enable = true;
    nix-ld.libraries = [
      # Add any missing dynamic libraries for unpackaged programs
      # here, NOT in environment.systemPackages
    ];

    steam = {
      enable = true;
      remotePlay.openFirewall =
        true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall =
        true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall =
        true; # Open ports in the firewall for Steam Local Network Game Transfers
      protontricks.enable = true;
      gamescopeSession.enable = true;
    };

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
        "image/png" = [ "gwenview.desktop" ];
        "x-directory/normal" = [ "kde-dolphin.desktop" ];
      };
      addedAssociations = {

      };
    };
  };

  #  system.autoUpgrade = {
  #    enable = true;
  #    channel = "https://nixos.org/channel/nixos-unstable";
  #    allowReboot = true;
  #``  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
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

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.sddm.wayland.enable = true;
    libinput.enable = true;

    emacs.enable = true;
    emacs.defaultEditor = true;

    flatpak.enable = true;

    gvfs.enable = true;

    # opensnitch.enable = true;

  };

  users = {
    defaultUserShell = pkgs.zsh;

    users.david = {
      isNormalUser = true;
      description = "david";
      extraGroups =
        [ "networkmanager" "wheel" "video" "audio" "i2c" "libvirtd" "kvm" ];
      packages = with pkgs; [
        spotify
        discord
        obsidian
        # vivaldi
        # electron
        clang
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      # nixpkgs.config.permittedInsecurePackages = [
      # "electron-25.9.0"
      # ];

      # nixpkgs.overlays = [
      #   (import (builtins.fetchTarball {
      #     url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
      #   }))
      # ];

      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          #      "corefonts"
          #      "steam"
          #      "steam-original"
          #      "steam-run"
        ];
    };
  };

  fonts.packages = with pkgs; [
    corefonts
    source-code-pro
    nerdfonts
    nanum-gothic-coding
    ubuntu_font_family
  ];

  environment = {
    shells = with pkgs; [ zsh ];

    sessionVariables = {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
      "QT_STYLE_OVERRIDE" = "kvantum";

      #    # Not officially in the specification
      #    XDG_BIN_HOME = "$HOME/.local/bin";
      FLAKE = "$HOME/.dotfiles";
      PATH = [ ". $HOME/.cargo/env" ];
    };

    systemPackages = with pkgs; [
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

      home-manager

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
      cifs-utils
      networkmanagerapplet
      libGLU

      ffmpeg-full
      nv-codec-headers
      kdePackages.kcodecs
      mesa

      silver-searcher
      usbutils
      libstdcxx5
      glaxnimate
      adwaita-icon-theme

      nh
      #nix-output-monitor
      nvd
      nil

      # prometheus

      lutris

      nvidia-vaapi-driver
      nvidia-texture-tools

      beekeeper-studio

    ];
  };

  #qt = {
  #  enable = true;
  #  platformTheme = "qt5ct";
  #};

  system.stateVersion = "24.11"; # Did you read the comment?

}
