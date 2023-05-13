{ ... }:
{
  users.users = {
    zihad = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = import ../../common/ssh-keys.nix;
      extraGroups = [ "wheel" "networkmanager" "audio" ];
      initialHashedPassword = "$y$j9T$6arzU4IITk6lIwU.aiu4s.$MOJui8XwyboZ31Dm4C08kBvU0y9XVq/2fM1qXMr4VT8";
    };
  };
}

