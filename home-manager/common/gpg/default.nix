{ pkgs, ... }:
{
  programs.gpg = {
    enable = true;
    settings = {
      no-autostart = true;
    };
  };
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    sshKeys = [ "14DCC35FFE1D535576F2D592915CF4626AA0420D" ];
  };
}
