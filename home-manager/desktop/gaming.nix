{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    bottles
    inputs.nix-gaming.packages.${system}.osu-lazer-tachyon-bin
    inputs.nix-gaming.packages.${system}.osu-stable
    lutris
    mangohud
    steam
    steam-run
    winetricks
    wineWowPackages.staging
  ];
}
