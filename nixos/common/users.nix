{ ... }:
{
  users.users = {
    zihad = {
      isNormalUser = true;
      description = "Zihad";
      extraGroups = [ "wheel" "networkmanager" "audio" ];
      openssh.authorizedKeys.keys = import ../../common/ssh-keys.nix;
      initialPassword = "password";
    };
  };
}
