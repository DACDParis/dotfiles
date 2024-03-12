{

  description = "My First flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    nix-colors.url = "github:misterio77/nix-colors";
    rust-overlay.url = "github:oxalica/rust-overlay";
    
 };

  outputs = { self, nixpkgs, home-manager, hyprland, rust-overlay, ...}: 
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
 
    in { 
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ 

          hyprland.nixosModules.default
          {programs.hyprland.enable = true;}

        ./configuration.nix

        ({ pkgs, ... }: {
            nixpkgs.overlays = [ rust-overlay.overlays.default ];
            environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
          })

        ];
    };
  };
   homeConfigurations = {
      david = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home.nix];
       
      };
    };
  };


}
