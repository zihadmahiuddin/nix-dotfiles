{ config, pkgs, ... }:

{
  imports = [
    ../common

    ./hardware-configuration.nix
    ./newtworking.nix
    ./packages.nix
  ];
}
