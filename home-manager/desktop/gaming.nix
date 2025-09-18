{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    inputs.nix-gaming.packages.${system}.osu-lazer-tachyon-bin
    inputs.nix-gaming.packages.${system}.osu-stable
    lutris
    steam
    steam-run
    winetricks
    wineWowPackages.staging
  ];
}
