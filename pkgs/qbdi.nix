{ lib, stdenv, cmake, ninja, python3, fetchFromGitHub, fetchurl }:
let
  pname = "qbdi";
  version = "0.11.0";

  llvm-version = "17.0.6";
  llvm-src = fetchurl {
      url = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${llvm-version}/llvm-${llvm-version}.src.tar.xz";
      hash = "sha256-tjgWfaE5EmyhGRe2iAIHzG6PnRy7GkjYfQF/aX73gYg=";
  };
  llvm-cmake-src = fetchurl {
    url = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${llvm-version}/cmake-${llvm-version}.src.tar.xz";
    hash = "sha256-gH8GnFTcIMtHshwfasr92cZJ864BVgkEDWGCyrARQPQ=";
  };

  spdlog-project-version = "1.10.0";
  spdlog-project-src = fetchurl {
    url = "https://github.com/gabime/spdlog/archive/refs/tags/v${spdlog-project-version}.zip";
    hash = "sha256-e+KP8F0yqKEc+6lDgegg3ShCg19/MZ+EOZMQG8q0S2Y=";
  };

  catch2-version = "2.13.7";
  catch2-src = fetchurl {
    url = "https://github.com/catchorg/Catch2/archive/refs/tags/v${catch2-version}.zip";
    hash = "sha256-PzzNkK06j7sb7rFebbRAzNy+vjeN/RJdB6H5pYepJ+k=";
  };

  pybind11-version = "2.11.1";
  pybind11-src = fetchurl {
    url = "https://github.com/pybind/pybind11/archive/v${pybind11-version}.zip";
    hash = "sha256-sBGnMMiEW/wmXw+B7k5enh01TfOQg20qJYgOEj0CH4k=";
  };
in
stdenv.mkDerivation {
  inherit pname version;

  src = fetchFromGitHub {
      owner = "QBDI";
      repo = "QBDI";
      rev = "v${version}";
      hash = "sha256-eaPzVSf3LiADc2igjmrSkJflERxvyYdQfeZLw8i3RWU=";
  };

  nativeBuildInputs = [
    cmake
    ninja
    python3
  ];

  postUnpack = ''
    mkdir -p source/third-party/llvm-download
    mkdir -p source/third-party/llvm-cmake-download
    mkdir -p source/third-party/spdlog-project-download
    mkdir -p source/third-party/catch2-download
    mkdir -p source/third-party/pybind11-download

    ln -sf ${llvm-src} source/third-party/llvm-download/llvm-${llvm-version}.src.tar.xz
    ln -sf ${llvm-cmake-src} source/third-party/llvm-cmake-download/cmake-${llvm-version}.src.tar.xz
    ln -sf ${spdlog-project-src} source/third-party/spdlog-project-download/v${spdlog-project-version}.zip
    ln -sf ${catch2-src} source/third-party/catch2-download/v${catch2-version}.zip
    ln -sf ${pybind11-src} source/third-party/pybind11-download/v${pybind11-version}.zip
  '';

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DCMAKE_CROSSCOMPILING=FALSE"
    "-DQBDI_PLATFORM=linux"
    "-DQBDI_ARCH=X86_64"
    "-DCMAKE_INSTALL_PREFIX=${placeholder "out"}"
  ];

  cmakeGenerator = "Ninja";
}

