{ home, pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    mouse = true;
    shortcut = "a";
    baseIndex = 1;

    sensibleOnTop = true;
    plugins = with pkgs.tmuxPlugins; [
      continuum
      extrakto
      fuzzback
      jump
      resurrect
      tmux-thumbs
    ];

    extraConfig = ''
      # Follow terminal background color (this is what makes transparency work)
      set-window-option -ag window-active-style "bg=terminal"

      # Fix Home and End keys not working by default
      # https://stackoverflow.com/a/55616731
      bind-key -n Home send Escape "OH"
      bind-key -n End send Escape "OF"

      set -g default-terminal xterm-256color
    '';
  };
}

