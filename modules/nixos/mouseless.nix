{ lib, config, ... }:
{
  config = {
    boot.kernelModules = [ "uinput" ];
    services.udev.extraRules = ''
      KERNEL=="uinput", GROUP="uinput", MODE="0660"
    '';
    users.groups = {
      uinput = { };
    };
  };
}
