{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ../common

    ./hardware-configuration.nix
    ./misc.nix
    ./newtworking.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
  ];
}
