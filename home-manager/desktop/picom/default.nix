{ lib, pkgs,  ... }:
let
  picom = pkgs.picom;
  conf = ./picom.conf;
in
{
  home.packages = [ picom ];

  systemd.user.services.picom = {
    Unit = {
      Description = "Picom X11 compositor";
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Install = { WantedBy = [ "graphical-session.target" ]; };

    Service = {
      ExecStart = lib.concatStringsSep " " [
        "${picom}/bin/picom"
        "--experimental-backends"
        "--config ${conf}"
      ];
      Restart = "always";
      RestartSec = 3;
    };
  };
}
