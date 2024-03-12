{ pkgs, config, lib, ... }:

with lib;

let
  cfg = config.services.openrgb;
in  {
	options.services.openrgb = {
		enable = mkEnableOption "OpenRGB server";

		package = mkOption {
			type = types.package;
			default = pkgs.openrgb;
			defaultText = "pkgs.openrgb";
			description = "Set version of openrgb package to use.";
		};
        
	        server.port = mkOption {
			type = types.port;
			default = 6742;
			defaultText = "6742";
			description = "Set server port to openrgb.";
		};

	};
  
  config = mkIf cfg.enable {
	  environment.systemPackages = [ cfg.package ];
	  services.dbus.packages = [ cfg.package ];

	  systemd.services.openrgb = {
		  desciption = "opergb server deamon.";

		  wantedBy = [ "multi-user.target" ];
		  after = [ "network.target" ];

		  restartIfChanged = true;

		  serviceConfig = {
			  DynamicUser = true;
			  ExecStart = "${cfg.package}/bin/openrgb --server --server-port ${cfg.server.port}";
			  Restart = "always";
	  };
	};
     };

  meta.maintainers = with lib.maintainers; [ david ];
 
 }


   
