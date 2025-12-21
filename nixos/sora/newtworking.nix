{ pkgs, ... }:
{
  networking.hostName = "sora";

  networking.interfaces.enp34s0.wakeOnLan.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80 443 # web
      3000 5000 8000 # development stuff
      58585 # torrent
    ];
    allowedUDPPorts = [
      58585 # torrent
    ];
  };
  networking.nftables.enable = true;

  networking.networkmanager.enable = true;

  networking.networkmanager.ensureProfiles.profiles = {
    "Ethernet" = {
      connection = {
        id = "ethernet";
        interface-name = "enp34s0";
        type = "ethernet";
      };
      ipv4.method = "auto";
      ipv6.method = "auto";
      ipv6.addresses = "2001:df5:cd40:1003::100/128";
      ipv6.addrGenMode = "stable-privacy";
      ipv6.neverDefault = false;
    };
  };

  # Enable WireGuard kernel module
  boot.kernelModules = ["wireguard"];
  # Install WireGuard tools
  environment.systemPackages = with pkgs; [
    wireguard-tools
    wireguard-ui
  ];
}
