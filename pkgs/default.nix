{ pkgs }: {
  rebuild = pkgs.callPackage ./scripts/nix-rebuild.nix {  };
}
