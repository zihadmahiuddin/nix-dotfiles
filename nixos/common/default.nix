{ inputs, outputs, lib, config, ... }:
let
  inherit (builtins) attrValues filter hasAttr;
  inputOverlays =
    attrValues inputs
    |> filter (x: hasAttr "overlays" x)
    |> map (x: x.overlays)
    |> filter (x: hasAttr "default" x)
    |> map (x: x.default);
  outputOverlays = attrValues outputs.overlays;
in {
  imports = [
    ./boot.nix
    ./misc.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./shell.nix
    ./sudo.nix
    ./users.nix
  ];

  nixpkgs = {
    overlays = inputOverlays ++ outputOverlays;
    config = {
      allowUnfree = true;
      # bitwarden desktop https://github.com/NixOS/nixpkgs/issues/526914
      permittedInsecurePackages = [ "electron-39.8.10" ];
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes pipe-operators";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;

      # Add nix-gaming and hyprland cachix
      substituters = ["https://nix-gaming.cachix.org" "https://hyprland.cachix.org"];
      trusted-substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
      trusted-users = ["zihad"];
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}
