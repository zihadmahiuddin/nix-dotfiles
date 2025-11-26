{ pkgs, ... }:
{
  virtualisation.docker.enable = true;
  virtualisation.vmware.host.enable = true;

  users.users.zihad.extraGroups = [ "docker" ];

  services.gvfs.enable = true;
  services.displayManager.gdm.enable = true;
  services.displayManager.autoLogin = {
    enable = true;
    user = "zihad";
  };
  services.libinput.enable = true;

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
  };

  hardware.graphics = {
    enable32Bit = true;

    extraPackages = with pkgs; [
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  services.gnome.at-spi2-core.enable = true;
}
