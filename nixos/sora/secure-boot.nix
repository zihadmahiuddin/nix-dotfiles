{ lib, ... }:
{
  boot = {
    bootspec.enable = true;
    loader.systemd-boot.enable = lib.mkForce false;
    loader.grub.device = "nodev";
    lanzaboote = {
      enable = false;
      pkiBundle = "/etc/secureboot";
    };
  };
}
