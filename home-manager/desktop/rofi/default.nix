{ home, pkgs, ... }:
{
  programs.rofi = {
    enable = true;

    package = pkgs.rofi.override {
      plugins = [pkgs.rofi-emoji];
    };

    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      modi = "run,drun,emoji,window,ssh";
      icon-theme = "Oranchelo";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 﩯  Window";
      display-Network = " 󰤨  Network";
      sidebar-mode = true;
    };

    theme = ./catppuccin-mocha.rasi;
  };

  home.packages = [
    pkgs.rofi-emoji
  ];
}

