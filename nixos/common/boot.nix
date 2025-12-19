{ ... }:
{
  boot.loader = {
    systemd-boot.enable = false;
    grub = {
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
}
