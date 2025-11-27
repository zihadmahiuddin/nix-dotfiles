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
    (tetrio-desktop.overrideAttrs (_: _: {
      version = "10";
      src = fetchzip {
        url = "https://tetr.io/about/desktop/builds/10/TETR.IO%20Setup.deb";
        hash = "sha256-2FtFCajNEj7O8DGangDecs2yeKbufYLx1aZb3ShnYvw=";
        nativeBuildInputs = [ dpkg ];
      };
    }))
  ];
}
