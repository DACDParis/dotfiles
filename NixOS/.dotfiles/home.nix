{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "david";
  home.homeDirectory = "/home/david";

  imports = [ 
#   ./modules/cli/ranger.nix
   ./modules/cli/kitty.nix
   ./modules/cli/zsh.nix
   ./modules/wm/waybar.nix
#   ./modules/cli/fonts.nix
   ./modules/wm/hyprland.nix
#   ./modules/misc/wofi.nix
#   ./modules/cli/starship.nix
#   ./modules/editors/lvim_overlay.nix
#   ./modules/hardware/openrgb.nix
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
#    cargo
#    rustup
    llvm
    unzip
    nodejs_21
    perl
    ruby_3_3
    go
    gh
    firefox
    nerdfonts
    killall
    lua
    starship
    sioyek
    warp-terminal
    lldb

    qbittorrent
    thunderbird

    gnome.gnome-disk-utility

    libsForQt5.kdenlive
    audacity
    gimp-with-plugins
    btop
    duf # disk usage
    hexchat
    zoxide
    nextcloud-client
    libreoffice
    ncdu # disc usage
    ranger
    borgbackup
    vorta # borgbackup gui 

    pamixer
    pulseaudio
    pavucontrol
    mpd
    mpc-cli
    losslesscut-bin
    easyeffects
    vlc
    ncmpcpp
    asciinema
    mpv

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
#    obs-studio-plugins.obs-backgroundremoval
    obs-studio-plugins.obs-pipewire-audio-capture

    lunarvim
    lazygit
    ripgrep
    tree-sitter
    neovim
    nodePackages.neovim
    tmuxPlugins.continuum
    tmuxPlugins.resurrect
    tmuxPlugins.tmux-fzf
    fzf


     # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/david/etc/profile.d/hm-session-vars.sh
  #

  programs.neovim.withNodeJs = true;
  programs.neovim.withPython3 = true;
  programs.neovim.withRuby = true;

  home.sessionVariables = {
     EDITOR = "lvim";
  };

  programs.git = {
    enable = true;
    userName  = "dacdparis";
    userEmail = "dacdparis@gmail.com";

    };

  programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    rust-lang.rust-analyzer
    vadimcn.vscode-lldb
    ];
  };

  xdg.enable = true;

  services.emacs.enable = true;

  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";
    network = { startWhenNeeded = true;
    };
    extraConfig = ''
      audio_output {
      type "pipewire"
      name "My PipeWire Output"
      }
      '';
    };
  
    home.file.".zshenv" = {
      text = "export MPD_HOST=\"/run/user/1000/mpd/socket\"";
  };

    programs = {
      direnv = {
        enable = true;
        enableZshIntegration = true; # see note on other shells below
        nix-direnv.enable = true;
    };

  };

  # Testing following ChatGPT instructions*
  home.file.".zshrc" = {
  text = ''
    export PATH=$PATH:$(dirname $(which node))
    export PATH=$PATH:$(dirname $(which npm))
    export PATH=$PATH:$(dirname $(which ruby))
  '';
};

  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
