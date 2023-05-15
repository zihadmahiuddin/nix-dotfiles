{ lib, stdenvNoCC, pkgs, custom ? "~/.config/nvim/lua/custom" }:

stdenvNoCC.mkDerivation {
  pname = "nvchad";
  version = "2.0.0";
  dontBuild = true;

  src = pkgs.fetchFromGitHub {
    owner = "NvChad";
    repo = "NvChad";
    rev = "907684efa019c7d5c189e29358b466852965fd76";
    hash = "sha256-gnPphpKkuUh1YT39zy5WwkJTQmNWwA/5zGM1YqMq+jw=";
  };

  installPhase = ''
    mkdir $out
    cp -r * "$out/"
    mkdir -p "$out/lua/custom"
    cp -r ${custom}/* "$out/lua/custom/"
  '';

  meta = with lib; {
    description = "NvChad";
    homepage = "https://github.com/NvChad/NvChad";
    platforms = platforms.all;
    license = licenses.gpl3;
  };
}
