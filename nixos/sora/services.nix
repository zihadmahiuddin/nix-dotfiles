{ pkgs, ... }:
{
  virtualisation.docker.enable = true;
  virtualisation.vmware.host.enable = true;

  users.users.zihad.extraGroups = [ "docker" ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha-mauve";
  };

  services.gvfs.enable = true;
  services.libinput.enable = true;
  services.ratbagd.enable = true;

  environment.systemPackages = with pkgs; [
    piper
    (
      catppuccin-sddm.override {
        flavor = "mocha";
        accent = "mauve";
        font  = "Noto Sans";
        fontSize = "9";
        loginBackground = true;
      }
    )
  ];

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
  };

  hardware.graphics = {
    enable32Bit = true;
  };

  services.gnome.at-spi2-core.enable = true;
}
