{ pkgs, config, ... }:
{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    # aggressiveResize = true; -- Disabled to be iTerm-friendly
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
    ];

    extraConfig = ''
      # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      # Mouse works as expected
      set-option -g mouse on
       
       bind -n S-Left select-pane -L
       bind -n S-Right select-pane -R
       bind -n S-Up select-pane -U
       bind -n S-Down select-pane -D
       
       bind-key v split-window -h
       bind-key h split-window -v
       
       bind -n M-Left previous-window
       bind -n M-Right next-window
       
       # Yazi File Manager Related
       
       set -g allow-passthrough on
       
       set -ga update-environment TERM
       set -ga update-environment TERM_PROGRAM
       
       #Theme
       
         set-option -g message-command-style 'bg=#282c34,fg=#bbc2cf' 
         set-option -g message-style 'bg=#282c34,fg=#bbc2cf'
         set-option -g mode-style 'bg=#424856'
         set-option -g status-justify left
         set-option -g status-left '  #{=28:session_name}  ' 
         set-option -g status-left-length 32 
         set-option -g status-left-style 'bold' 
         set-option -g status-style 'bg=#1b2229,fg=#bbc2cf'
         set-option -g window-status-current-format ' [#I] #W ' 
         set-option -g window-status-current-style 'bg=#51afef,fg=#282c34'
         set-option -g window-status-format ' [#I] #W ' 
         set -g pane-active-border-style "bg=default,fg=#51afef"
         '';
  };

 }
