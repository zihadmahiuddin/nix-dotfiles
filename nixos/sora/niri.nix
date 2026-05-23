{ inputs, pkgs, ... }:
{
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-unstable;

  environment.variables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    wl-clipboard
    wayland-utils
    libsecret
    xwayland-satellite
    nautilus
  ];
}
