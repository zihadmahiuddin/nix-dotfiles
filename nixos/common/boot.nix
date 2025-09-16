{ ... }:
{
  boot.loader = {
    systemd-boot.enable = false;
    grub.device = "nodev";
    grub.efiSupport = true;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };
}

