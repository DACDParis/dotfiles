{ pkgs, inputs, ... }:

{
  home.username = "david";
  home.homeDirectory = "/home/david";

  imports =
    [ ./modules/cli/kitty.nix ./modules/cli/zsh.nix ./modules/wm/hyprland.nix ];

  home.stateVersion = "24.05";
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    emacsPackages.dap-mode
    emacsPackages.rustic
    emacsPackages.rust-mode
    emacsPackages.flycheck
    emacsPackages.flycheck-rust
    emacsPackages.flycheck-inline
    emacsPackages.flycheck-indent
    emacsPackages.flycheck-aspell
    emacsPackages.flycheck-grammarly
    emacsPackages.eshell-syntax-highlighting
    emacsPackages.eshell-up
    emacsPackages.magit
    emacsPackages.fzf
    emacsPackages.pdf-tools

    llvm
    unzip
    nodejs
    perl
    ruby_3_3
    go
    gh
    lua5_4_compat
    lldb
    gdb
    nixfmt-classic
    shfmt
    shellcheck
    pandoc
    aspell
    aspellDicts.fr
    aspellDicts.en
    aspellDicts.pt_PT
    aspellDicts.en-computers
    fastfetch

    qbittorrent
    firefox
    thunderbird
    telegram-desktop
    element-desktop
    hexchat

    mu
    isync

    gimp
    nextcloud-client
    libreoffice
    sioyek
    lunarvim

    pamixer
    pulseaudio
    pavucontrol
    mpd
    mpc-cli
    vlc
    losslesscut-bin
    ncmpcpp
    asciinema
    mpv
    audacity
    kodi

    obs-studio
    obs-cli
    obs-studio-plugins.wlrobs
    obs-studio-plugins.waveform
    obs-studio-plugins.obs-tuna
    obs-studio-plugins.obs-vaapi
    obs-studio-plugins.droidcam-obs
    obs-studio-plugins.obs-vkcapture
    obs-studio-plugins.obs-multi-rtmp
    obs-studio-plugins.obs-source-record
    obs-studio-plugins.obs-pipewire-audio-capture

    lazygit
    gitkraken
    ripgrep
    tmuxPlugins.continuum
    tmuxPlugins.resurrect
    tmuxPlugins.tmux-fzf
    zellij
    tealdeer
    ranger
    zoxide
    duf
    ncdu
    killall
    eza
    btop

    idevicerestore
    ideviceinstaller
    usbmuxd
    libusbmuxd
    gnome.gnome-disk-utility
    libsForQt5.ark
    libsForQt5.gwenview

  ];

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  home.file = { };

  programs.git = {
    enable = true;
    userName = "dacdparis";
    userEmail = "dacdparis@gmail.com";
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      vadimcn.vscode-lldb
    ];
  };

  programs.neovim = {
    enable = true;
    plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  xdg.enable = true;

  services.mpd = {
    enable = true;
    musicDirectory = "~/External/HD700/Music";
    network = { startWhenNeeded = true; };
    extraConfig = ''
      audio_output {
      type "pipewire"
      name "My PipeWire Output"
      }
    '';
  };

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

  };
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.gnome.adwaita-icon-theme;
    name = "Adwaita";
    size = 16;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
