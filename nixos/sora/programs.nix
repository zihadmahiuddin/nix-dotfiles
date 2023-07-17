{ pkgs, ... }:
{
  programs.dconf.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [ xfce.thunar-volman xfce.thunar-archive-plugin ];
  };
  programs.kdeconnect.enable = true;
}
