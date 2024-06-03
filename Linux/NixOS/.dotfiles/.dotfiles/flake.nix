{

  description = "My First flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #    rust-overlay.url = "github:oxalica/rust-overlay";

  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";

    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [
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
