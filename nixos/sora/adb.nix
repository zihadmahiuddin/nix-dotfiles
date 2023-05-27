{ ... }:
{
  programs.adb.enable = true;
  users.users.zihad.extraGroups = [ "adbusers" ];
}
