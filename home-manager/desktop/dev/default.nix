{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./jetbrains.nix
  ];

  home.packages = [ pkgs.antigravity ];
}
