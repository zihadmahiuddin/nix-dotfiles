{ pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
  };

  users.users.zihad.extraGroups = [ "docker" ];

  services.gvfs.enable = true;
  services.desktopManager.gnome.enable = true;
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

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs; [
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
