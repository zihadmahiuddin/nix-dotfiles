{ lib, outputs, ... }:
let
  mouselessConfig = {
    baseMouseSpeed = 750;
    baseScrollSpeed = 20;
    layers = [
      {
        name = "default";
        bindings = {
          tab = "tap-hold-next tab ; toggle-layer mouse ; 500";
        };
      }
      {
        name = "mouse";
        passThrough = true;
        bindings = {
          q = "layer default";
          space = "layer mouse";
          h = "move -1  0";
          j = "move  0  1";
          k = "move  0 -1";
          l = "move  1  0";
          p = "scroll up";
          n = "scroll down";
          i = "scroll left";
          o = "scroll right";
          leftalt = "speed 2.0";
          leftshift = "speed 0.25";
          f = "button left";
          d = "button right";
          s = "button middle";
        };
      }
    ];
  };

  configFile = builtins.toFile "mouseless-config.yaml" (lib.generators.toYAML {} mouselessConfig);
in
{
  imports = [
    outputs.homeManagerModules.mouseless
  ];

  home.file.".config/mouseless/config.yaml".source = configFile;
}
