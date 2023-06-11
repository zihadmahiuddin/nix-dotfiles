{ lib, pkgs, ... }:
let
  dex = pkgs.dex;
in
{
  home.packages = [
    dex
  ];

  systemd.user.services.dex = {
    Unit = {
      Description = "Dex XDG Autostart";
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Install = { WantedBy = [ "graphical-session.target" ]; };

    Service = {
      ExecStart = lib.concatStringsSep " " [
        "${dex}/bin/dex"
        "-a"
      ];
      Restart = "always";
      RestartSec = 3;
    };
  };
}

