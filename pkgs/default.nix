{ pkgs }: {
  rebuild = pkgs.callPackage ./scripts/nix-rebuild.nix {  };

  nvchad = pkgs.callPackage ./nvchad.nix { };
}
