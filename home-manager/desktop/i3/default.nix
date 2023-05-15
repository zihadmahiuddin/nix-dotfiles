{ pkgs,  ... }:
{
  xsession = {
    enable = true;
    scriptPath = ".hm-xsession";
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3;
    };
  };

  xdg.configFile."i3" = {
    source = ./config;
    recursive = true;
  };

  xdg.configFile."i3status-rust" = {
    source = ./i3status-rust;
    recursive = true;
  };

  programs.i3status-rust.enable = true;
}
