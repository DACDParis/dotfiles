{
  pkgs,
  lib,
  config,
  home-manager,
  ...
}:

{

  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      l = "eza -al --group-directories-first --icons=auto";
      ll = "eza -al --group-directories-first --icons=auto";
      ls = "eza -al --group-directories-first --icons=auto";
      cat = "bat";
      fm = "yazi";
      lv = "lvim";
      g = "z";
      cd = "z";
      clean = "$HOME/nixos/modules/clean.sh";

      update = "sudo nixos-rebuild switch --flake ~/nixos/.";
    };

    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];

    shellInit = ''
      eval "$(zoxide init zsh)"
      eval "PS1=$'%F{27}\n %n%f %F{249}%~\n %F{27} >%f '"

      export PATH="$HOME/.config/emacs/bin:$HOME/.cargo/bin:$PATH"
      export PATH=$PATH:$(dirname $(which node))
      export PATH=$PATH:$(dirname $(which npm))
      export PATH=$PATH:$(dirname $(which ruby))

      export EDITOR="code"
      export VISUAL="code"

      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
    '';

  };

}
