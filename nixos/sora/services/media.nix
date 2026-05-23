{
  lib,
  pkgs,
  ...
}:
{
  services.qbittorrent.enable = true;

  services.jellyfin.enable = true;

  services.shoko.enable = true;
  services.shoko.plugins = with pkgs; [
    luarenamer
  ];

  # no idea why but with a dynamic user it throws random file access errors for some files
  # even though all the files are in the same folder. maybe NTFS shenanigans?
  systemd.services.shoko.serviceConfig.DynamicUser = lib.mkForce false;
}
