{ pkgs, config, nix-colors, ...} :

{
  # Configure & Theme Waybar
  programs.waybar = {
   enable = true;
   package = pkgs.waybar;
    style = ''
     * {   
      border: none;
      border-radius: 0px;
      font-family: "JetBrainsMono Nerd Font";
      font-weight: bold;
      font-size: 11px;
      min-height: 11px;
  }
  
  window#waybar {
      background: transparent;
      color: #2f88fc;
  }

  #tray, #clock, #temperature, #pulseaudio, #pulseaudio-microphone #bluetooth {
  padding: 0px 5px;
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
        "hyprland/workspaces"
    ];
    modules-center = ["hyprland/window"];
    modules-right = [
        "bluetooth"
        "pulseaudio"
        "pulseaudio#microphone"
        "temperature"
        "tray"
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
        on-click = "btop";    
       };

    "tray" = {
        icon-size = "8";
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

