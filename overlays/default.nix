{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    mpv = prev.mpv.override {
      scripts = [ final.mpvScripts.webtorrent-mpv-hook ];
    };

    # https://github.com/NixOS/nixpkgs/issues/513245#issuecomment-4320293674
    openldap = prev.openldap.overrideAttrs {
      doCheck = !prev.stdenv.hostPlatform.isi686;
    };

    # https://github.com/NixOS/nixpkgs/issues/526914#issuecomment-4598327460
    bitwarden-desktop = prev.bitwarden-desktop.override {
      electron_39 = final.electron_39-bin;
    };
  };

  niri = inputs.niri.overlays.niri;
}
