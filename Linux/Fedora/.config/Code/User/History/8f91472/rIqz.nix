{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {nixpkgs, home-manager, hyprland, ...}: {
    homeConfigurations."david@nixos" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      modules = [
        {
          wayland.windowManager.hyprland = {
            enable = true;
            # set the flake package
            package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
            portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
          };

		  ./configuration.nix
	   home-manager.nixosModules.home-manager
	   {
	      home-manager = {
		useGlobalPkgs = true;
		useUserPackages = true;
		users.david = import ./home.nix;
		backupFileExtension = "backup";
                	};	
        };
		};
        # ...
      ];
    };
  };
}







{
	description = "Flake";

	inputs = {
	   nixpkgs.url = "nixpkgs/nixos-unstable";

	   home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ...}: 
	{
	   nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	      system = "x86_64-linux";

	modules = [
	   ./configuration.nix
	   home-manager.nixosModules.home-manager
	   {
	      home-manager = {
		useGlobalPkgs = true;
		useUserPackages = true;
		users.david = import ./home.nix;
		backupFileExtension = "backup";
                	};	
   
} 
		];
	  };
	
	};

}
