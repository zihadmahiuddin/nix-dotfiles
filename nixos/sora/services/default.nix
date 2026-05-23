{ pkgs, ... }:
{
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = false;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.zihad.extraGroups = [ "docker" ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha-mauve";
  };

  services.gvfs.enable = true;
  services.libinput.enable = true;
  services.ratbagd.enable = true;

  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
    openrgb
    piper
    (
      catppuccin-sddm.override {
        flavor = "mocha";
        accent = "mauve";
        font = "Noto Sans";
        fontSize = "9";
        loginBackground = true;
      }
    )
  ];

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  services.gnome.at-spi2-core.enable = true;
  services.hardware.openrgb.enable = true;
}
