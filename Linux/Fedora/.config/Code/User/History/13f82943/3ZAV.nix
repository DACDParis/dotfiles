{
  
  home.username = "david";
  home.homeDirectory = "/home/david";  
  home.stateVersion = "25.11";
  
  #programs.home-manager.enable= true;

  wayland.windowManager.hyprland = {
    enable = true;
    # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
    package = null;
    portalPackage = null;
    systemd.enable = true;
  #  systemd.variables = ["--all"];
    };

 programs = {
#      fzf = {
#        enable = true;
#        enableZshIntegration = true;
#      };

bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
    };
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec uwsm start -S hyprland-uwsm.desktop
      fi'';

      git = {
        enable = true;
        settings.user.name = "dacdparis";
        settings.user.email = "dacdparis@gmail.com";
      };

      direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
      };

      vscode = {
        enable = true;
#        extensions = with pkgs.vscode-extensions; [
#          rust-lang.rust-analyzer
#          vadimcn.vscode-lldb
#        ];
      };
    };


}
