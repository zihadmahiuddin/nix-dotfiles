# CREDITS
# Subcommands system based on https://gist.github.com/waylan/4080362
# Activation scripts based on https://github.com/srid/nixos-flake/blob/16c3cf65b5335d9e09c00fc722d7d44bbf93d581/flake-module.nix

{ lib, pkgs, ... }:
pkgs.writeShellApplication {
  name = "rebuild";

  text = ''
    prog_name=$(basename "$0")

    sub_help(){
      printf "Usage: %s <subcommand>\n\n" "$prog_name"
      printf "Subcommands:\n"
      printf "    nixos  Rebuild NixOS configuration\n"
      printf "    home   Rebuild Home Manager configuration\n"
      printf "\n"
    }

    sub_nixos() {
      HOSTNAME=$(hostname -s)
      ${lib.getExe pkgs.nixos-rebuild} \
        switch \
        --flake .#"''${HOSTNAME}" \
        --use-remote-sudo \
        "$@"
    }

    sub_home() {
      HOSTNAME=$(hostname -s)
      nix run \
        .#homeConfigurations."\"''${USER}@''${HOSTNAME}\"".activationPackage \
        "$@"
    }

    subcommand=$1

    case $subcommand in
      "" | "-h" | "--help")
        sub_help
        ;;
      *)
      shift
      sub_"''${subcommand}" "$@"
      if [ $? = 127 ]; then
        printf "Error: '%s' is not a known subcommand.\n" "$subcommand" >&2
        printf "       Run '%s --help' for a list of known subcommands.\n" "$prog_name" >&2
        exit 1
      fi
      ;;
    esac
  '';
}
