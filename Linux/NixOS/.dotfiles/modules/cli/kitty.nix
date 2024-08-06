{ pkgs, ... }:

{
  home.packages = with pkgs; [ kitty-img pixcat ];

  programs.kitty = {
    enable = true;
    extraConfig = ''
      include /home/david/.dotfiles/modules/misc/Kitty_Theme_vscode-dark.conf

      linux_display_server wayland

      scrollback_pager_history_size 20000

      enable_audio_bell no

      visual_bell_duration 0.5

      visual_bell_color #2d2d10

      repaint_delay 5

      font_size 11.0

      input_delay 1

      sync_to_monitor yes

      wheel_scroll_multiplier 7.0

      map shift+left move_window left
      map shift+right move_window right
      map shift+up move_window up
      map shift+down move_window down
      map ctrl+shift+down neighboring_window down
      map ctrl+shift+up neighboring_window up
      map ctrl+right neighboring_window right
      map ctrl+left neighboring_window left

      confirm_os_window_close 2

      map ctrl+shift+tab detach_tab

      copy_on_select yes

      clipboard_control write-clipboard write-primary read-clipboard

    '';
  };

}
