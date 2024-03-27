{config, home-manager,pkgs, ...}:

{
  
  programs.zsh = {
	  enable = true;
	  autosuggestion.enable = true;
	  enableCompletion = true;
	  syntaxHighlighting.enable = true;
    history.ignoreAllDups = true;

	  shellAliases = {
		  # l = "ls -lah --color";
		  # ll = "ls -lah --color";
		  # ls = "ls -ah --color";
       l = "eza -a";
		  ll = "eza -al --group-directories-first --icons=auto";
		  ls = "eza -a";

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
          eval "$(zoxide init zsh)" 
          eval "PS1=$' %F{27}%n%f %F{249}%~\n %F{27}%  >%f '"

        	'';
     };
}





