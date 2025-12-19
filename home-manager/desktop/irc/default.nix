{ config, pkgs, ... }:
let
  configToml = builtins.readFile ./halloy.toml;
in
{
  age.secrets.nickserv-libera-chat.file = ./nickserv-libera-chat.age;

  programs.halloy.enable = true;
  programs.halloy.package = pkgs.halloy;

  home.file.".config/halloy/config.toml".source =
    builtins.replaceStrings
      [ "NICKSERV_PASSWORD_FILE" ]
      [ config.age.secrets.nickserv-libera-chat.path ]
      configToml
    |> builtins.toFile "halloy-config.yaml";
}
