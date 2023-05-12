{ ... }:
{
  users.users = {
    zihad = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = import ../../common/ssh-keys.nix;
      extraGroups = [ "wheel" "networkmanager" "audio" ];
    };
  };
}

