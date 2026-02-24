{ pkgs, ... }:
{
  networking.hostName = "sora";

  networking.interfaces.enp34s0.wakeOnLan.enable = true;


  networking.networkmanager.enable = true;


  # Enable WireGuard kernel module
  boot.kernelModules = ["wireguard"];
  # Install WireGuard tools
  environment.systemPackages = with pkgs; [
    wireguard-tools
    wireguard-ui
  ];
}
