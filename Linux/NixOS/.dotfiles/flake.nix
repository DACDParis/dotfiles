{

  description = "My First flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #    rust-overlay.url = "github:oxalica/rust-overlay";
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, home-manager, stylix, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";

    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [
            stylix.nixosModules.stylix

            ./configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.david = import ./home.nix;

            }
            #
            #            ({ pkgs, ... }: {
            #              nixpkgs.overlays = [ rust-overlay.overlays.default ];
            #              environment.systemPackages =
            #                [ pkgs.rust-bin.stable.latest.default ];
            #            })
          ];
        };
      };
    };
}
