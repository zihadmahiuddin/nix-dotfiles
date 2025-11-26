{ inputs, pkgs, ... }:
{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
  ];

  programs.dankMaterialShell.enable = true;
  programs.dankMaterialShell.enableBrightnessControl = false;
  programs.dankMaterialShell.enableCalendarEvents = false;

  programs.dankMaterialShell.niri.enableKeybinds = false;
  programs.dankMaterialShell.niri.enableSpawn = true;

  home.packages = with pkgs; [
    papirus-icon-theme
  ];
}
