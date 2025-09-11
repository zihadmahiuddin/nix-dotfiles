{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    inputs.nix-gaming.packages.${system}.osu-lazer-bin
    inputs.nix-gaming.packages.${system}.osu-stable
    winetricks
    wineWowPackages.staging
  ];
}
