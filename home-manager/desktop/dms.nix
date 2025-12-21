{ inputs, pkgs, ... }:
{
  imports = [
    inputs.dankMaterialShell.homeModules.dank-material-shell
    inputs.dankMaterialShell.homeModules.niri
  ];

  programs.dank-material-shell.enable = true;
  programs.dank-material-shell.enableCalendarEvents = false;

  programs.dank-material-shell.niri.enableKeybinds = false;
  programs.dank-material-shell.niri.enableSpawn = true;

  home.packages = with pkgs; [
    papirus-icon-theme
  ];
}
