{ pkgs, ... }:
{
  services.libinput.enable = true;
  services.displayManager.sddm.enable = true;

  services.xserver = {
    enable = true;

    desktopManager.session = [
      {
        name = "i3-home-manager";
        start = ''
          ${pkgs.runtimeShell} $HOME/.hm-xsession &
          waitPID=$!
        '';
      }
    ];
  };
}
