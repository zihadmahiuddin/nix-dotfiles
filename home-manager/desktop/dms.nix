{ inputs, pkgs, ... }:
{
  imports = [
    inputs.dankMaterialShell.homeModules.dank-material-shell
    inputs.dankMaterialShell.homeModules.niri
  ];

  programs.dank-material-shell = {
    enable = true;
    enableCalendarEvents = false;
    niri.enableSpawn = true;
  };

  home.packages = with pkgs; [
    papirus-icon-theme
  ];
}
