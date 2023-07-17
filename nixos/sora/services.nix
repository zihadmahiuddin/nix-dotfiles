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

    displayManager.gdm.enable = true;

    desktopManager.session = [
      {
        name = "i3-home-manager";
        start = ''
          ${pkgs.runtimeShell} $HOME/.hm-xsession &
          waitPID=$!
        '';
      }
    ];
    desktopManager.gnome.enable = true;

    libinput.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

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
