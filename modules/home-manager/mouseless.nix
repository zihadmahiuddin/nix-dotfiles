{ lib, pkgs, ... }:
{
  systemd.user.services.mouseless = {
    Unit = {
      Description = "A mouse replacement and key remapper for Linux.";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = lib.getExe pkgs.mouseless;
    };
  };
}
