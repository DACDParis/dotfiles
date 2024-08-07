{ config, pkgs, lib, ... }:

{

  imports = [ ./waybar.nix ];

  programs.waybar.enable = true;

  home.packages = with pkgs; [
    wofi
    grim
    grimblast
    cairo
    swaynotificationcenter
    swappy
    sway
    swaybg
    swayidle
    swaylock
    swaytools
    nwg-look
    kdePackages.kdenlive
    # opensnitch-ui
    # opensnitch
    openrgb-with-all-plugins
    libadwaita
    wl-clipboard
    # cliphist
    polkit_gnome
    swww
    waybar-mpris
    wttrbar
    mpdris2
    # xdg-desktop-portal-hyprland
    pamixer
    playerctl
    usbimager
    hyprdim
    hypridle
    hyprlock
    hyprpicker
    kdePackages.qtstyleplugin-kvantum
  ];

  #qt.platformTheme = "qt6ct";

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = pkgs.hyprland;
    systemd.variables = [ "--all" ];
    extraConfig = ''
                        #monitor=HDMI-A-2,3840x1080@30,0x0,1
                        monitor=DP-4,2560x1080@60.00,0x0,1
                        monitor=DP-5,2560x14400@143.99800,2560x0,1
                        # monitor=,preferred,auto1

            env = LIBVA_DRIVER_NAME,nvidia
            env = XDG_SESSION_TYPE,wayland
            env = GBM_BACKEND,nvidia-drm
            env = __GLX_VENDOR_LIBRARY_NAME,nvidia


                  #    # Some default env vars
                  #      env = XCURSOR_SIZE,10
                  #      # env = GLFW_IM_MODULE=ibus
                  #      # env = GDK_BACKEND,wayland,x11
                  #
                        env = XDG_SESSION_DESKTOP=Hyprland
                        env = XDG_SESSION_TYPE,wayland
                  #      #env = XDG_SESSION_DESKTOP,KDE
                  #      #env = XDG_CURRENT_DESKTOP,KDE
                  #      env = XDG_CURRENT_DESKTOP=Hyprland
                  #
                       env = QT_QPA_PLATFORM,wayland;xcb
                  #      #env = QT_STYLE_OVERRIDE,breeze
                  #  #    env = QT_QPA_PLATFORMTHEME,qt6ct
                  #
                  #      env=LIBVA_DRIVER_NAME,nvidia
                  #
                        env = WLR_NO_HARDWARE_CURSORS,1
                  #   #   env = WLR_DRM_NO_ATOMIC,1
                  #
                  #    #  env = SSH_AUTH_SOCK,$XDG_RUNTIME_DIR/ssh-agent.socket

                        $mainMod = SUPER

                        # Startup
                        exec-once = waybar
                        #exec-once = ~/.dotfiles/modules/misc/idle.sh
                        exec-once = mpd
                        exec-once = ~/.dotfiles/modules/misc/fans
                        exec-once = ~/.dotfiles/modules/misc/gnome_polkit.sh
                        exec-once = swaync -style ~/.config/hypr/swaync/style.css --config ~/.config/sway/swaync/config.json
                        exec-once = dbus-update-activation-environment --systemd --all  &  ##WAYLAND_DISPLAY XDG_CURRENT_DESKTOP QT_QPA_PLATFORMTHEME GTK_THEME
                        exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP QT_QPA_PLATFORMTHEME GTK_THEME &
                        # exec-once = dunst
                        # exec-once = blueman &
                        exec-once = nm-applet
                        # exec-once = hexchat
                        # exec-once = QT_QPA_PLATFORM=xcb opensnitch-ui
                        # exec-once = wl-paste --watch cliphist store

                        exec-once = wl-paste --type text --watch cliphist store #Stores only text data
                        exec-once = wl-paste --type image --watch cliphist store #Stores only image data

                        #exec-once = [workspace 8 ] qbittorrent
                        #exec-once = [workspace 6 ] thunderbird
                        #exec-once = [workspace 4 ] discord
                        # exec-once = [workspace 4 ] flatpak run com.spotify.Client
                        # exec-once = [workspace 4 ] flatpak run im.riot.Riot
                        # exec-once = [workspace 1 ] google-chrome
                        # exec-once = [workspace 1 ] vivaldi --enable-features=UseOzonePlatform --ozone-platform=wayland
                        # exec-once = [workspace 1 ] floorp
                        exec-once = [workspace 1 ] firefox
                        exec-once = [workspace 1 ] kitty

                        input {
                          kb_layout = us,fr
                          kb_options = ctrl:swapcaps, grp:alt_space_toggle

                          follow_mouse = 1
                          sensitivity = 0
                        }

                        misc {
                          disable_hyprland_logo = true
                          disable_splash_rendering = true
                          mouse_move_enables_dpms = true
                          no_direct_scanout = true
                        }

                        binds {
                          workspace_back_and_forth = true
                        }

                        general {
                        # allow_tearing = true
                          gaps_in = 3
                          gaps_out = 7
                          border_size = 2
                          col.active_border = rgb(2f88FC)
                          col.inactive_border = rgba(595959aa)
                        # cursor_inactive_timeout = 5
                          layout = dwindle
                        }

                        dwindle {
                        #  pseudotile = true
                        #  smart_split = true
                        #  force_split = 2
                        #  smart_resizing = true
                        #  preserve_split = true
                        }

                        #master {
                        #new_is_master = false
                        #mfact = 0.5
                        #}

                        decoration {
                        #  rounding = 6
                        #  blur = true
                        #  blur_size = 3
                        #  blur_passes = 1
                        #  blur_new_optimizations = true
                        # active_opacity = 1.0
                        # inactive_opacity = 0.7
                        # fullscreen_opacity = 1.0
                          #drop_shadow = true
                          #shadow_range = 4
                          #shadow_render_power = 3
                          #col.shadow = rgba(1a1a1aee)

                         #dim_inactive = true
                         #dim_strength = 0.2
                        }

                        blurls = waybar
                        animations {
                        enabled = false
                        #  bezier = myBezier, 0.05, 0.9, 0.1, 1.05
                        #  animation = windows, 1, 7, myBezier
                        #  animation = windowsOut, 1, 7, default, popin 80%
                        #  animation = border, 1, 10, default
                        #  animation = fade, 1, 7, default
                        #  animation = workspaces, 1, 6, default
                        }

                        # Example windowrule v2
                        windowrulev2 = workspace 6, class:^(thunderbird)$
                        windowrulev2 = workspace 8, class:^(org.qbittorrent.qBittorrent)$
                        windowrulev2 = workspace 5, class:^(Spotify)$
                        windowrulev2 = workspace 5, class:^(com.github.wwmm.easyeffects)$
                        windowrulev2 = workspace 4, class:^(Element)$
                        windowrulev2 = workspace 4, class:^(discord)$
                        windowrulev2 = workspace 4, class:^(discordo)$
                        windowrulev2 = workspace 4, class:^(HexChat)$

                        windowrulev2 = float,class:^(NoiseTorch)$,title:^(NoiseTorch)$
                        windowrulev2 = float,class:^(com.github.hluk.copyq)$,title:^(CopyQ)$
                        windowrulev2 = float,class:^(org.qbittorrent.qBittorrent), title:(*qBittorrent*)$
                        windowrulev2 = float,class:^(openrgb)$,title:^(OpenRGB)$
                        windowrulev2 = float,class:^(org.kde.dolphin)$,title:^(Extract — Dolphin)$
                        windowrulev2 = float,class:^(org.kde.dolphin)$,title:^(File Already Exists — Dolphin)$
                        windowrulev2 = float,class:^(kcm_kaccounts)$
                        windowrulev2 = float,class:^(com.github.wwmm.easyeffects)$,title:^(Easy Effects)$
                        windowrulev2 = float,class:^(lsp-plugins)$,title:^(Parametrischer Entzerrer x32 LeftRight)$
                        windowrulev2 = float,class:^(soffice)$,title:^(Extension Manager)$
                        windowrulev2 = float,class:^(thunar)$,title:^(File Operation Progress)$
                        windowrulev2 = float,class:^(thunar)$,title:^(Confirm to replace files)$
                        windowrulev2 = float,class:^(nm-connection-editor)$
                        windowrule=float,org.kde.polkit-kde-authentication-agent-1

                        bind = $mainMod, Q, killactive
                        bind = $mainMod, A, exec, emacsclient -c
                        bind = $mainMod ALT1, z, exec, google-chrome
                        # bind = $mainMod, z, exec, vivaldi --enable-features=UseOzonePlatform --ozone-platform=wayland
                       # bind = $mainMod ALT1, z, exec, vivaldi --enable-features=UseOzonePlatform --ozone-platform=wayland
                        bind = $mainMod, z, exec, firefox
                        bind = $mainMod, 0, exec, /$HOME/.dotfiles/modules/misc/exit_hyprland.sh
                        bind = $mainMod, F, fullscreen
                        bind = $mainMod, Return, exec, kitty
                        bind = $mainMod  SHIFT, Return, exec, appimage-run ~/Apps/Warp.AppImage
                        bind = $mainMod, x, exec, dolphin
                        bind = $mainMod, Space, exec, wofi --show drun --allow-images --width=400 --hight=400
                        bind = $mainMod SHIFT, R, exec, hyprctl reload

                        bind = $mainMod SHIFT, M, exec, hyprctl dispatch splitratio -0.1
                        bind = $mainMod, M, exec, hyprctl dispatch splitratio 0.1

                        bind = $mainMod, Escape, exec, hyprctl kill
                        bind = $mainMod, V, togglefloating,
                        bind = $mainMod, P, pseudo

                        # Special Keys
                        bind = , XF86Tools, exec, vlc
                        bind = , xf86audioraisevolume, exec, pamixer -i 3
                        bind = , xf86audiolowervolume, exec, pamixer -d 3
                        bind = , xf86audiomute, exec, pamixer -t
                        bind = , xf86audioplay, exec, playerctl -a play-pause
                        bind = , xf86audionext, exec, playerctl -a position 5+
                        bind = , xf86audioprev, exec, playerctl -a position 5-

                        # Move windows
                        bind = $mainMod SHIFT, left, movewindow, l
                        bind = $mainMod SHIFT, right, movewindow, r
                        bind = $mainMod SHIFT, up, movewindow, u
                        bind = $mainMod SHIFT, down, movewindow, d

                        # Move focus with mainMod + arrow keys
                        bind = $mainMod, left, movefocus, l
                        bind = $mainMod, right, movefocus, r
                        bind = $mainMod, up, movefocus, u
                        bind = $mainMod, down, movefocus, d

                        # Vim Keys Mouvements
                        #Move windows
                        bind = $mainMod SHIFT, H, movewindow, l
                        bind = $mainMod SHIFT, L, movewindow, r
                        bind = $mainMod SHIFT, K, movewindow, u
                        bind = $mainMod SHIFT, J, movewindow, d

                        # Vim Keys - Move focus with mainMod + arrow keys
                        bind = $mainMod, H, movefocus, l
                        bind = $mainMod, L, movefocus, r
                        bind = $mainMod, K, movefocus, u
                        bind = $mainMod, J, movefocus, d

                        # Special workspace
                        bind = $mainMod SHIFT, U, movetoworkspace, special
                        bind = $mainMod, U, togglespecialworkspace,

                        # Scroll through existing workspaces with mainMod + scroll
                        bind = $mainMod, mouse_down, workspace, e+1
                        bind = $mainMod, mouse_up, workspace, e-1
                        bind = $mainMod, period, workspace, e+1
                        bind = $mainMod, comma, workspace, e-1

                        # Move/resize windows with mainMod + LMB/RMB and dragging
                        bindm = $mainMod, mouse:272, movewindow
                        bindm = $mainMod, mouse:273, resizewindow

                        # Qwerty
                        # Switch workspaces with mainMod + [0-9]
                        bind = $mainMod, 1, workspace, 1
                        bind = $mainMod, 2, workspace, 2
                        bind = $mainMod, 3, workspace, 3
                        bind = $mainMod, 4, workspace, 4
                        bind = $mainMod, 5, workspace, 5
                        bind = $mainMod, 6, workspace, 6
                        bind = $mainMod, 7, workspace, 7
                        bind = $mainMod, 8, workspace, 8

                        # Qwerty
                        # Move active window and follow to workspace
                        bind = $mainMod CTRL, 1, movetoworkspace, 1
                        bind = $mainMod CTRL, 2, movetoworkspace, 2
                        bind = $mainMod CTRL, 3, movetoworkspace, 3
                        bind = $mainMod CTRL, 4, movetoworkspace, 4
                        bind = $mainMod CTRL, 5, movetoworkspace, 5
                        bind = $mainMod CTRL, 6, movetoworkspace, 6
                        bind = $mainMod CTRL, 7, movetoworkspace, 7
                        bind = $mainMod CTRL, 8, movetoworkspace, 8
                        #bind = $mainMod CTRL, 9, movetoworkspace, 9
                        #bind = $mainMod CTRL, 0, movetoworkspace, 10
                        #bind = $mainMod CTRL, bracketleft, movetoworkspace, -1
                        #bind = $mainMod CTRL, bracketright, movetoworkspace, +1

                        # Qwerty
                        # Move active window to a workspace with mainMod + SHIFT + [0-9]
                        bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
                        bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
                        bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
                        bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
                        bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
                        bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
                        bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
                        bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
                        #bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
                        #bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10
                        #bind = $mainMod SHIFT, bracketleft, movetoworkspacesilent, -1
                        #bind = $mainMod SHIFT, bracketright, movetoworkspacesilent, +1

    '';
  };

}
