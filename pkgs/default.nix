{ pkgs }: {
  rebuild = pkgs.callPackage ./scripts/nix-rebuild.nix {  };
  discord-krisp-patcher = pkgs.callPackage ./scripts/discord-krisp-patcher.nix {  };
  yt-dlp-sabr = pkgs.callPackage ./yt-dlp-sabr.nix {  };
  catppuccin-fcitx5 = pkgs.callPackage ./catppuccin-fcitx5.nix { };
  nvchad = pkgs.callPackage ./nvchad.nix { };
}
