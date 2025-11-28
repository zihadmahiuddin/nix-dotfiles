{ ... }:
{
  users.users = {
    zihad = {
      isNormalUser = true;
      description = "Zihad";
      extraGroups = [ "wheel" "networkmanager" "audio" "input" "uinput" ];
      openssh.authorizedKeys.keys = import ../../common/ssh-keys.nix;
      initialPassword = "password";
    };
  };
}
