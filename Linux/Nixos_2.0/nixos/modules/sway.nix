{
  config,
  pkgs,
  lib,
  home-manager,
  ...
}:

{
  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
  };

  services = {
    greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = "sway";
          user = "david";
        };
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd sway";
          user = "greeter";
        };
      };
    };
    getty.autologinUser = "david";
    gvfs.enable = true;
  };

  environment.systemPackages = with pkgs; [
    swaynotificationcenter
    fuzzel
    swaylock
    wl-clipboard
    swayidle
    nwg-look
    networkmanagerapplet
    pavucontrol
    i3status-rust
    polkit_gnome
    nemo-with-extensions
    nemo-fileroller
    gthumb
    adwaita-icon-theme
    
  ];

systemd.user.services.polkit-gnome-authentication-agent-1 = {
  description = "polkit-gnome-authentication-agent-1";
  wantedBy = [ "graphical-session.target" ];
  wants = [ "graphical-session.target" ];
  after = [ "graphical-session.target" ];
  serviceConfig = {
    Type = "simple";
    ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    Restart = "on-failure";
    RestartSec = 1;
    TimeoutStopSec = 10;
  };
};

}