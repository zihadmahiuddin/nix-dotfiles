{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-label/root";
      fsType = "ext4";
      noCheck = true; # temporary until e2fsprogs in nixpkgs is updated
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-label/boot";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    {
      device = "/dev/disk/by-label/ESP";
      fsType = "vfat";
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-label/home";
      fsType = "ext4";
    };

  fileSystems."/home/zihad/Games" =
    {
      device = "/dev/disk/by-label/Games";
      fsType = "ntfs";
      options = [ "defaults" ];
    };

  fileSystems."/home/zihad/windows" =
    {
      device = "/dev/disk/by-label/windows";
      fsType = "ntfs";
      options = [ "defaults" ];
    };

  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp34s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
