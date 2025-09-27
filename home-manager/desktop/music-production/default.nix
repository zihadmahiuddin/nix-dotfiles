{ pkgs, lib, ... }:
let
  yabridgeScriptContent = builtins.readFile ./yabridge-wine.sh;
  yabridgeScriptWrapped = lib.strings.replaceStrings 
    [ "$WINE_PATH" ] 
    [ "${pkgs.wineWowPackages.yabridge}" ]
    yabridgeScriptContent;
  yabridge-wine = pkgs.writeScriptBin "yabridge-wine" yabridgeScriptWrapped;
in
{
  home.packages = with pkgs; [
    reaper
    yabridge
    yabridgectl
    yabridge-wine
  ];
}