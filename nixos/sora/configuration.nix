{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ../common

    ./adb.nix
    ./desktop.nix
    ./hardware-configuration.nix
    ./i18n.nix
    ./newtworking.nix
    ./packages.nix
    ./polkit.nix
    ./programs.nix
    ./secure-boot.nix
    ./services.nix
    ./sound.nix
    ./niri.nix

    outputs.nixosModules.mouseless
  ];

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
}
