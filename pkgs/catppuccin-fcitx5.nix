{ lib
, stdenvNoCC
, fetchFromGitHub
}:
let
  pname = "catppuccin-fcitx5";
in
stdenvNoCC.mkDerivation rec {
  inherit pname;
  version = "unstable-2022-10-05";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "fcitx5";
    rev = "main";
    sha256 = "uFaCbyrEjv4oiKUzLVFzw+UY54/h7wh2cntqeyYwGps=";
  };

  installPhase = ''
    runHook preInstall

    set -x
    mkdir -p $out/share/fcitx5/themes
    cp -r ${src}/src/* $out/share/fcitx5/themes
    set +x

    runHook postInstall
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Fcitx5";
    homepage = "https://github.com/catppuccin/fcitx5";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = [ maintainers.zihadmahiuddin ];
  };
}
