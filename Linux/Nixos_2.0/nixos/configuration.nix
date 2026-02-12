{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/zsh.nix
    ./modules/network.nix
    #    ./modules/gnome.nix
    ./modules/openrgb.nix
    ./modules/locale.nix
    ./modules/audio.nix
    ./modules/sway.nix
    ./modules/boot.nix
  ];

  programs = {
    firefox.enable = true;
    thunderbird.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    dconf.enable = true;
    seahorse.enable = true;
  };

  services = {
    xserver.xkb = {
      layout = "us,fr";
      options = "grp:alt_space_toggle,ctrl:swapcaps";
    };
    printing.enable = false;
    gnome.gnome-keyring.enable = true;
    emacs.enable = true;
    flatpak.enable = true;
    hardware.openrgb.enable = true;

  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  users.users.david = {
    isNormalUser = true;
    description = "David";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
    ];
    packages = with pkgs; [
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    nixfmt
    nodejs_25
    kitty
    fd
    ripgrep
    cmake
    gnumake
    libtool
    shellcheck
    font-awesome
    openrgb-with-all-plugins

    google-chrome
    vscode
    vim

    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    gcc
    lldb
    openssl
    pkg-config
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  security.polkit.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";
  };

  nix.settings.auto-optimise-store = true;

  system.stateVersion = "26.05";
}
