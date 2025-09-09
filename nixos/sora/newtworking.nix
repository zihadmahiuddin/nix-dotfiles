{ pkgs, ... }:
{
  networking.hostName = "sora";

  networking.firewall.enable = false;
  networking.networkmanager.enable = true;

  # Enable WireGuard kernel module
  boot.kernelModules = ["wireguard"];
  # Install WireGuard tools
  environment.systemPackages = with pkgs; [
    wireguard-tools
    wireguard-ui
  ];
}
