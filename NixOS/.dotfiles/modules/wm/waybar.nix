{ pkgs, config, nix-colors, ...}:

{
  # Configure & Theme Waybar
  programs.waybar = {
   enable = true;
   systemd = {
     enable = false;
     target = "graphical-session.target";
   };
   package = pkgs.waybar;
    style = ''
     * {   
      border: none;
      border-radius: 8;
      font-family: "JetBrainsMono Nerd Font";
      font-weight: bold;
      font-size: 12px;
      min-height: 12px;
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
      padding: 5px;
      color: #2f88fc;
  }
  
  #workspaces button.active {
      color: #000000;
      background: #2f88fc;
    
  }
  
  #workspaces button:hover {
      background: #11111b;
      color: #cdd6f4;
      border-radius: 8px;
  }
  
  #window,
  #clock,
  #pulseaudio,
  #network,
  #tray, 
  #temperature,
  #workspaces,
  #idle_inhibitor,
  #backlight {
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
  
  #window {
      border-radius: 10px;
      margin-left: 0px;
      margin-right: 0px;
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
    modules-left = [
        "custom/weather"
        "hyprland/workspaces"
    ];
    modules-center = ["hyprland/window"];
    modules-right = [
        "custom/waybar-mpris"
        "bluetooth"
        "pulseaudio"
        "pulseaudio#microphone"
        "temperature"
        "tray"
        "clock"

    ];
    
    "hyprland/window" = {
        "format" = "{}";
    };

    "custom/waybar-mpris" = {
    return-type = "json";
    exec = "waybar-mpris --position --autofocus";
    on-click = "waybar-mpris --send toggle";
 #  // This option will switch between players on right click.;
        on-click-right = "waybar-mpris --send player-next";
 #  // The options below will switch the selected player on scroll;
 #      // on-scroll-up = "waybar-mpris --send player-next";
 #      // on-scroll-down = "waybar-mpris --send player-prev";
 #   // The options below will go to next/previous track on scroll;
 #       // on-scroll-up = "waybar-mpris --send next";
 #       // on-scroll-down = "waybar-mpris --send prev";
    escape = true;
    };

    "hyprland/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        on-click = "activate";
            "1"= [];
            "2"= [];
            "3"= [];
            "4"= [];
            "5"= [];
            "6"= [];
            "7"= [];
            "8"= [];
            "9"= [];
            "10"= [];
        };

    "temperature" = {
        on-click = "kytty btop";    
        on-click-right = "nvtop";

       };

    "tray" = {
        icon-size = "10";
    };

    "pulseaudio" = {
        format = "{icon} {volume}%";
        tooltip = false;
        format-muted = " Muted";
        on-click = "~/.config/waybar/scripts/volume --toggle";
        on-click-right =  "pavucontrol";
        on-scroll-up = "~/.config/waybar/scripts/volume --inc";
        on-scroll-down = "~/.config/waybar/scripts/volume --dec";
        scroll-step = 5;
        format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
        };
    };

      "pulseaudio#microphone" = {
        format = "{format_source}";
        format-source = " {volume}%";
        format-source-muted = "  Muted";
        on-click = "~/.config/waybar/scripts/volume --toggle-mic";
        on-click-right = "pavucontrol";
        on-scroll-up = "~/.config/waybar/scripts/volume --mic-inc";
        on-scroll-down = "~/.config/waybar/scripts/volume --mic-dec";
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

