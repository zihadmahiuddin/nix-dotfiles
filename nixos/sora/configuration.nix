{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ../common

    ./hardware-configuration.nix
    ./i18n.nix
    ./newtworking.nix
    ./packages.nix
    ./polkit.nix
    ./programs.nix
    ./services.nix
    ./sound.nix
  ];
}
