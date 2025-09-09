# CREDITS
# https://github.com/amaanq/dotfiles/blob/c7a2e21/modules/common/discord.nix
# https://github.com/keysmashes/sys/blob/7806b21/hm/discord/krisp-patcher.py

{
  pkgs,
  ...
}: let
  discord-krisp-patcher =
    pkgs.writers.writePython3Bin
    "patch-discord-krisp"
    {
      libraries = [
        pkgs.python3Packages.capstone
        pkgs.python3Packages.pyelftools
      ];
      flakeIgnore = [
        "E501" # line too long (82 > 79 characters)
        "F403" # 'from module import *' used; unable to detect undefined names
        "F405" # name may be undefined, or defined from star imports: module
      ];
    }
    (
      builtins.readFile (
        pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/sersorrel/sys/afc85e6b249e5cd86a7bcf001b544019091b928c/hm/discord/krisp-patcher.py";
          sha256 = "sha256-h8Jjd9ZQBjtO3xbnYuxUsDctGEMFUB5hzR/QOQ71j/E=";
        }
      )
    );
in
  discord-krisp-patcher
