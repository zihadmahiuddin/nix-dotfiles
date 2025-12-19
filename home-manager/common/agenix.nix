{ config, ... }:
{
  age.secretsDir = "${config.home.homeDirectory}/.local/share/agenix";
  age.secretsMountPoint = "${config.home.homeDirectory}/.local/share/agenix.d";
}
