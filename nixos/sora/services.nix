{ pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
  };

  users.users.zihad.extraGroups = [ "docker" ];

  services.gvfs.enable = true;

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];

    displayManager.sddm.enable = true;

    desktopManager.session = [
      {
        name = "i3-home-manager";
        start = ''
          ${pkgs.runtimeShell} $HOME/.hm-xsession &
          waitPID=$!
        '';
      }
    ];

    libinput.enable = true;
  };

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  services.gnome.at-spi2-core.enable = true;
}
