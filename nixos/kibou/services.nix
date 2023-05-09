{ ... }:
{
  services.openssh.enable = true;

  services.xserver = {
    enable = true;

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
}
