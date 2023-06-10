{ pkgs }:
pkgs.xwayland.overrideAttrs (finalAttrs: previousAttrs: {
  patches = [
    ./vsync-fix.patch
  ];
})
