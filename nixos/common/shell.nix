{ pkgs, ... }:
{
  programs.zsh.enable = true;
  programs.starship.enable = true;
  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;
}

