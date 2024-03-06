{ lib, config, pkgs, emacs, ... }:

with lib;

{
  options = {
    doomEmacs = {
      enable = mkEnableOption "Install and configure Doom Emacs";

      # Add any Doom Emacs specific configuration options here
      # For example, you can specify a specific version or revision
      version = mkOption {
        type = types.str;
        default = "develop";
        description = "Doom Emacs version or revision to use";
      };
    };
  };

  config = mkIf config.doomEmacs.enable {
    programs.emacs.enable = true;

    home.file."emacs/init.el" = {
      source = pkgs.fetchgit {
        url = "https://github.com/hlissner/doom-emacs.git";
        rev = config.doomEmacs.version;
        sha256 = "..."; # Update with the actual sha256
      };
      destination = ".doom.d/init.el";
    };

    home.file."emacs/packages.el" = {
      source = pkgs.fetchgit {
        url = "https://github.com/hlissner/doom-emacs.git";
        rev = config.doomEmacs.version;
        sha256 = "..."; # Update with the actual sha256
      };
      destination = ".doom.d/packages.el";
    };

    home.file."emacs/config.org" = {
      source = pkgs.fetchgit {
        url = "https://github.com/hlissner/doom-emacs.git";
        rev = config.doomEmacs.version;
        sha256 = "..."; # Update with the actual sha256
      };
      destination = ".doom.d/config.org";
    };
  };
}
