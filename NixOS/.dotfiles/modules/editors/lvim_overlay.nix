# ~/.dotfiles/modules/editors/lvim-overlay.nix

{ pkgs, ... }:

let
  lunarvim = pkgs.lunarvim;
  customFiles = {
    whichKey = "/home/david/.config/lvim/which-key.lua";
    # Add more files to override as needed
  };
  customFilesOverrides = builtins.mapAttrs (name: path: {
    name = lunarvim.overrideAttrs (oldAttrs: {
      buildInputs = oldAttrs.buildInputs or [] ++ [ pkgs.writeText "lunarvim-${name}" (builtins.readFile path) ];
    });
  }) customFiles;
in
{
  overlays = [ customFilesOverrides ];
}
