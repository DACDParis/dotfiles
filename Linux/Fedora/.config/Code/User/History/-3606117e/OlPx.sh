#!/bin/bash
# 1. Update DBus environment (Crucial for fixing IBus/KDE errors)
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# 2. Restart portals cleanly (Instead of killall)
systemctl --user stop xdg-desktop-portal-hyprland
systemctl --user stop xdg-desktop-portal
/usr/libexec/xdg-desktop-portal-hyprland &
sleep 2
/usr/libexec/xdg-desktop-portal &