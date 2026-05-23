{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  hyprland-pkgs = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  services.xserver.windowManager.i3.enable = true;
  programs.hyprland = {
    enable = true;
    package = hyprland-pkgs.hyprland;
    portalPackage = hyprland-pkgs.xdg-desktop-portal-hyprland;
    withUWSM = true;
    xwayland.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      hyprland-pkgs.xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
}
