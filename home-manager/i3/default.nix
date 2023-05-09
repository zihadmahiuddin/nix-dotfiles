{ pkgs,  ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
  };

  xdg.configFile."i3" = {
    source = ./config;
    recursive = true;
  };
}
