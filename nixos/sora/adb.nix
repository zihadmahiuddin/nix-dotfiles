{ pkgs, ... }:
{
  # TODO: move to home-manager?
  environment.systemPackages = [ pkgs.android-tools ];
  users.users.zihad.extraGroups = [ "adbusers" ];
}
