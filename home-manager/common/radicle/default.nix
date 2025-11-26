{ config, pkgs, ... }:
{
  age.secrets.radicle-privkey = {
    file = ./privkey.age;
    path = "${config.home.homeDirectory}/.radicle/keys/radicle";
  };

  age.secrets.radicle-pubkey = {
    file = ./pubkey.age;
    path = "${config.home.homeDirectory}/.radicle/keys/radicle.pub";
  };

  home.packages = [ pkgs.radicle-node ];
}
