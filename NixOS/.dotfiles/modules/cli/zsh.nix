{...}:

{
  
  programs.zsh = {
	  enable = true;
	  enableAutosuggestions = true;
	  enableCompletion = true;
	  syntaxHighlighting.enable = true;
	  shellAliases = {
		  l = "ls -lah --color";
		  ll = "ls -lah --color";
		  ls = "ls -ah --color";
		  cat = "bat";
      fm = "yazi";
      lv = "lvim";
      g = "z";
		  szsh = "source ~/.zshrc";
      mpc ="mpc --host='/run/user/1000/mpd/socket'";
      zik = "ncmpcpp";
      record = "asciinema rec";
      lvhome = "lvim ~/.dotfiles/home.nix";
      lvflake = "lvim ~/.dotfiles/flake.nix";
      lvconfig = "lvim ~/.dotfiles/configuration.nix";
		  frebuild = "sudo nixos-rebuild switch --flake /home/david/.dotfiles/";
		  hrebuild = "home-manager switch --flake /home/david/.dotfiles/";
      syncos = " rsync -avr --delete-during --mkpath $HOME/.dotfiles $HOME/Git/dotfiles/NixOS/";
		  };

       initExtra = '' 
          eval "$(starship init zsh)"
          eval "$(zoxide init zsh)"


	'';

 };

}





