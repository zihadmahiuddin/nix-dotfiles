{ inputs, ... }:
{
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland.enable = true;

  home.file = {
    ".config/hypr" = {
      source = ./hypr;
      recursive = true;
    };
  };
}
