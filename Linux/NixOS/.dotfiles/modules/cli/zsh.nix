{ config, home-manager, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history.ignoreAllDups = true;

    shellAliases = {
      l = "eza -a";
      ll = "eza -al --group-directories-first --icons=auto";
      ls = "eza -a";
      cat = "bat";
      fm = "yazi";
      lv = "lvim";
      g = "z";
      cd = "z";
      szsh = "source ~/.zshrc";
      mpc = "mpc --host='/run/user/1000/mpd/socket'";
      zik = "ncmpcpp";
      record = "asciinema rec";
      lvhome = "lvim ~/.dotfiles/home.nix";
      lvflake = "lvim ~/.dotfiles/flake.nix";
      lvconfig = "lvim ~/.dotfiles/configuration.nix";
      frebuild = "sudo nixos-rebuild switch --flake /home/david/.dotfiles/";
      hrebuild = "home-manager switch --flake /home/david/.dotfiles/";
      syncos =
        " rsync -avr --delete-during --mkpath $HOME/.dotfiles $HOME/Git/dotfiles/NixOS/";
      dem = "emacsclient -c -a '' &";
    };

    initExtra = ''
      eval "$(zoxide init zsh)"
      eval "PS1=$'%F{27}\n %n%f %F{249}%~\n %F{27} >%f '"
      export PATH=$PATH:$(dirname $(which node))
      export PATH=$PATH:$(dirname $(which npm))
      export PATH=$PATH:$(dirname $(which ruby))
      export PATH="$HOME/.config/emacs/bin:$PATH"
      export PATH="$HOME/.cargo/bin:$PATH"

      function yy() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }

    '';
  };

  home.file.".zshenv" = {
    text = ''export MPD_HOST="/run/user/1000/mpd/socket";'';
  };

}
