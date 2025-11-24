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
      builtins.readFile ./discord-krisp-patcher.py
    );
in
  discord-krisp-patcher
