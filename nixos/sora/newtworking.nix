{ pkgs, ... }:
{
  networking.hostName = "sora";

  networking.interfaces.enp42s0.wakeOnLan.enable = true;
  networking.firewall.enable = false;
  networking.networkmanager.enable = true;

  systemd.services.NetworkManager-wait-online.enable = false;

  # Enable WireGuard kernel module
  boot.kernelModules = [ "wireguard" ];
  # Install WireGuard tools
  environment.systemPackages = with pkgs; [
    wireguard-tools
    wireguard-ui
  ];
}
