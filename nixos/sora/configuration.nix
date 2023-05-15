{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ../common

    ./hardware-configuration.nix
    ./newtworking.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./sound.nix
  ];
}
