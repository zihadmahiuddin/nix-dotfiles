{ pkgs, ... }:
let
  catppuccin-kvantum = pkgs.catppuccin-kvantum.override {
    variant = "Mocha";
  };
in
{
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    catppuccin-kvantum
  ];

  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "kvantum";
  };

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=Catppuccin-Mocha-Blue
  '';
}
