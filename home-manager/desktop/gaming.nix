{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    inputs.nix-gaming.packages.${system}.osu-stable
    (inputs.nix-gaming.packages.${system}.osu-lazer-tachyon-bin.override {
      pipewire_latency = "32/44100";
    })
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
