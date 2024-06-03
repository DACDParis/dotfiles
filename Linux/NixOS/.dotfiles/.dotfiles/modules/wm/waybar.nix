{ pkgs, config, nix-colors, ... }:

{
  # Configure & Theme Waybar
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = ''
      * {
          border: none;
          border-radius: 8px;
          font-family: "JetBrainsMono Nerd Font";
          font-weight: bold;
          font-size: 11px;
          min-height: 11px;
      }

      window#waybar {
          background: transparent;
          color: #2f88fc;
      }

      tooltip {
          background: #1e1e2e;
          opacity: 0.8;
          border-radius: 8px;
          border-width: 2px;
          border-style: solid;
          border-color: #11111b;
      }

      tooltip label{
          color: #cdd6f4;
      }

      #workspaces button {
          color: #2f88fc;
      }

      #workspaces button.active {
          color: #000000;
          background: #2f88fc;

      }

      #workspaces button:hover {
          background: #11111b;
          color: #cdd6f4;
      }

      #window,
      #cpu,
      #clock,
      #pulseaudio,
      #tray,
      #temperature
      {
          background: rgba(21, 18, 27, 0);
          opacity: 1;
          padding: 0px 8px;
          margin: 0px 3px;
          border: 0px;
      }

      #temperature.critical {
          color: #e92d4d;
      }

      #workspaces {
          padding-right: 0px;
          padding-left: 5px;
      }

    '';

    settings = [{
      layer = "top";
      position = "top";
      mod = "dock";
      exclusive = true;
      passthrough = false;
      gtk-layer-shell = true;
      height = 12;
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [
        "bluetooth"
        "pulseaudio"
        "pulseaudio#microphone"
        "temperature"
        "tray"
        "hyprland/language"
        "clock"

      ];

      "hyprland/window" = {
        "format" = "{}";
        "format-us" = "us";
        "format-fr" = "fr";
      };

      "hyprland/language" = {
        "format" = "{short}";
        "on-click" = "hyprcrl ";
      };

      "hyprland/workspaces" = {
        disable-scroll = true;
        all-outputs = false;
        on-click = "activate";
        "1" = [ ];
        "2" = [ ];
        "3" = [ ];
        "4" = [ ];
        "5" = [ ];
        "6" = [ ];
        "7" = [ ];
        "8" = [ ];
        "9" = [ ];
        "10" = [ ];
      };

      "temperature" = {
        "thermal-zone" = 1;
        "hmon-path" =
          [ "/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input" ];
        "critical-threshold" = 80;
        "format-critical" = "{temperatureC}°C ";
        "format" = "{temperatureC}°C ";
        "on-click" = "btop";
      };

      "tray" = {
        "icon-size" = 10;
        "spacing" = 10;
      };

      "pulseaudio" = {
        format = "{icon} {volume}%";
        tooltip = false;
        format-muted = " Muted";
        on-click = "/home/david/.dotfiles/modules/misc/volume --toggle";
        on-click-right = "pavucontrol";
        on-scroll-up = "/home/david/.dotfiles/modules/misc/volume --inc";
        on-scroll-down = "/home/david/.dotfiles/modules/misc/volume --dec";
        scroll-step = 5;
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" "" ];
        };
      };

      "pulseaudio#microphone" = {
        format = "{format_source}";
        format-source = " {volume}%";
        format-source-muted = "  Muted";
        on-click = "/home/david/.dotfiles/modules/misc/volume --toggle-mic";
        on-click-right = "pavucontrol";
        on-scroll-up = "~/home/david/.dotfiles/modules/misc/volume --mic-inc";
        on-scroll-down = "~/home/david/.dotfiles/modules/misc/volume --mic-dec";
        scroll-step = 5;
      };

      "bluetooth" = {
        format = " {status}";
        format-disabled = "";
        format-connected = " {num_connections}";
        tooltip-format = "{device_alias}";
        tooltip-format-connected = " {device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}";
      };

    }];

  };

}
